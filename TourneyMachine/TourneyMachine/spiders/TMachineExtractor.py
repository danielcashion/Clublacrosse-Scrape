# -*- coding: utf-8 -*-
import json
import pymysql as MySQLdb
import pyodbc
import scrapy
import re
from TourneyMachine.spiders import database_con as dbc
from scrapy.cmdline import execute
from TourneyMachine.Generate_CSV import Export_CSV
from TourneyMachine.items import TourneymachineItem, TourneymachineTournamnetTitleItem
from TourneyMachine.spiders import paths


class TmachineextractorSpider(scrapy.Spider):
    name = 'TMachineExtractor'
    allowed_domains = ['tourneymachine.com']
    start_urls = ['https://tourneymachine.com/Home.aspx/']

    server = dbc.server
    database = dbc.database
    username = dbc.username
    password = dbc.password
    driver = dbc.driver
    table = dbc.table
    i = 1

    def parse(self, response):

        try:
            self.cnxn = pyodbc.connect('DRIVER=' + self.driver + ';SERVER=' + self.server + ';DATABASE=' + self.database + ';UID=' + self.username + ';PWD=' + self.password)
            self.cursor = self.cnxn.cursor()
            self.cursor.execute("SELECT [TournamentID] FROM [stg].[tourneymachine_homepage_data]")
            Links = self.cursor.fetchall()
            self.cnxn.close()
            for link in Links:
                id = link[0]
                id = "h20191011142817550ef4c63eca45042"
                tournament_id = id
                url = 'https://tourneymachine.com/Public/Results/Tournament.aspx?IDTournament=' + id
                tournament_endpoint = url
                yield scrapy.FormRequest(
                    url,
                    method='GET',
                    callback=self.getTournament,
                    meta={
                        'tournament_endpoint': tournament_endpoint,
                        'tournament_id': tournament_id
                    }
                )
                break

        except Exception as e:
            print(str(e))

    def getTournament(self, response):

        tournament_endpoint = response.meta['tournament_endpoint']
        tournament_id = response.meta['tournament_id']
        try:
            teams = response.xpath('//div[@class="col-xs-6 col-sm-3"]')

            for team in teams:
                try:
                    temp_url = team.xpath('./a/@href').extract_first()

                    tournament_division_id = temp_url.split('IDDivision=')[-1]

                    url = 'https://admin.tourneymachine.com/Public/Results/' + temp_url

                    try:
                        tournament_division_name = team.xpath('./a/div/text()').extract_first().strip()
                    except TypeError:
                        tournament_division_name = ''

                    try:
                        last_update = team.xpath('./a/p/span/text()').extract()
                        last_update = ''.join(last_update).replace('Last Updated', '').strip()
                    except Exception as e:
                        last_update = ''

                    yield scrapy.FormRequest(url, method='GET', callback=self.getTournamentDetails, meta={
                        'tournament_endpoint': tournament_endpoint,
                        'tournament_division_id': tournament_division_id,
                        'tournament_id': tournament_id,
                        'tournament_division_name': tournament_division_name,
                        'last_update': last_update
                    })
                except Exception as e:
                    print(str(e))

        except Exception as e:
            print(str(e))
            print('could\'nt find teams')

    def getTournamentDetails(self, response):

        # ------------------------------------------------------ Tournament Title Process ------------------------------------ #

        title_item = TourneymachineTournamnetTitleItem()
        title_item['tournament_id'] = response.meta['tournament_id']
        title_item['tournament_division_id'] = response.meta['tournament_division_id']
        title_item['tournament_division_name'] = response.meta['tournament_division_name']

        for tournaments in response.xpath('//div[contains(@class, "col-sm-6")]//table[contains(@class,"tournamentResultsTable")]'):
            title_item['tournament_title'] = tournaments.xpath('.//*[@class="tournamentResultsTitle"]//text()').get().strip()
            table = list()
            headers = list()
            for th in tournaments.xpath(".//th[not (@colspan)]"):
                headers.append("".join(th.xpath(".//text()").getall()).strip())

            for tr in tournaments.xpath('//div[contains(@class, "col-sm-6")]//table[contains(@class,"tournamentResultsTable")]//tr[(.//td)]'):
                tab = dict()
                for id, td in enumerate(tr.xpath(".//td")):
                    tab[headers[id]] = "".join(td.xpath(".//text()").getall()).strip()
                table.append(tab)

            title_item['tournament_details'] = json.dumps(table)
            yield title_item

        # --------------------------------------------------------------------------------------------------------------------- #

        game_ids = set()

        tournament_endpoint = response.meta['tournament_endpoint']
        tournament_division_id = response.meta['tournament_division_id']
        tournament_id = response.meta['tournament_id']
        tournament_division_name = response.meta['tournament_division_name']
        last_update = response.meta['last_update']

        try:
            tournament_name = response.xpath('//h1/a/text()').extract_first()
        except Exception as e:
            print('tournament_name not found ')
            tournament_name = ''

        try:
            time_period = response.xpath('normalize-space(//div[@class="tournamentDates"]/text())').extract_first()
        except Exception as e:
            print('time_period not found ')
            time_period = ''

        try:
            Location = response.xpath('normalize-space(//div[@class="tournamentLocation"]/text())').extract_first()
        except Exception as e:
            print('time_period not found ')
            Location = ''

        try:
            try:
                game = response.xpath('//tr[following-sibling::tr and preceding-sibling::thead and count(child::*)>2]')
                if game:
                    for j in game:
                        item = TourneymachineItem()

                        try:
                            game_date = j.xpath('normalize-space(./preceding-sibling::thead[1]/tr[1]/th/text())').extract_first()
                        except Exception as e:
                            game_date = ''

                        game_id = ''
                        try:
                            game_id = j.xpath('./td[1]/text()').extract_first().strip()
                            if game_id == '':
                                continue
                        except Exception as e:
                            continue

                        try:
                            game_time = j.xpath('./td[2]//text()').extract()[2].strip()
                            if ':' not in game_time:
                                game_time = j.xpath('./td[2]/b/text()').extract_first().strip()
                        except Exception as e:
                            game_time = ''

                        try:
                            location_name = j.xpath('normalize-space(./td[3]/text())').extract_first().strip().replace('\r', '')
                        except Exception as e:
                            location_name = ''

                        try:
                            tmpt = j.xpath('./@class').extract_first().strip()
                            tmp_away_team_id = re.findall(r'\steam_(\w+)', tmpt)
                            try:
                                home_team_id = tmp_away_team_id[0]
                            except IndexError:
                                home_team_id = ''
                            try:
                                away_team_id = tmp_away_team_id[1]
                            except IndexError:
                                away_team_id = ''
                        except Exception as e:
                            away_team_id = ''
                            home_team_id = ''

                        try:
                            away_team = j.xpath('./td[4]/text()').extract_first().strip()
                        except Exception as e:
                            away_team = ''

                        try:
                            away_score = j.xpath('./td[5]/text()').extract_first().strip()
                        except Exception as e:
                            away_score = ''

                        try:
                            home_score = j.xpath('./td[6]/text()').extract_first().strip()
                        except Exception as e:
                            home_score = ''

                        try:
                            home_team = j.xpath('./td[7]/text()').extract_first().strip()
                        except Exception as e:
                            home_team = ''

                        if game_id != '':
                            item['tournament_endpoint'] = tournament_endpoint
                            item['tournament_division_id'] = tournament_division_id
                            item['tournament_id'] = tournament_id
                            item['tournament_name'] = tournament_name
                            item['time_period'] = time_period
                            item['Location'] = Location
                            item['tournament_division_name'] = tournament_division_name
                            item['last_update'] = last_update
                            item['game_date'] = game_date
                            item['game_id'] = game_id
                            item['game_time'] = game_time
                            item['location_name'] = location_name
                            item['home_team_id'] = home_team_id
                            item['away_team_id'] = away_team_id
                            item['away_team'] = away_team
                            item['away_score'] = away_score
                            item['home_score'] = home_score
                            item['home_team'] = home_team
                            yield item
            except TypeError:
                game = ''

        except Exception as e:
            print(str(e))


execute('scrapy crawl TMachineExtractor'.split())
