# -*- coding: utf-8 -*-
import datetime
import json
from pprint import pprint
import pymysql
import scrapy
import re
from TourneyMachine import database_con as dbc
from scrapy.cmdline import execute
from TourneyMachine.items import TourneymachineItem, TourneymachineTournamnetPoolItem


class TmachineextractorSpider(scrapy.Spider):
    name = 'TMachineExtractor'
    allowed_domains = ['tourneymachine.com']
    start_urls = ['https://tourneymachine.com/Home.aspx/']

    def parse(self, response):

        try:
            self.cnxn = pymysql.connect(dbc.host, dbc.user, dbc.passwd, dbc.database)
            self.cursor = self.cnxn.cursor()
            self.cursor.execute(f"SELECT IDTournament FROM {dbc.events_table}")
            Links = self.cursor.fetchall()
            for link in Links:
                id = link[0]
                tournament_endpoint = 'https://tourneymachine.com/Public/Results/Tournament.aspx?IDTournament=' + id
                yield scrapy.FormRequest(
                    tournament_endpoint,
                    method='GET',
                    callback=self.getTournament,
                    meta={
                        'tournament_endpoint': tournament_endpoint,
                        'tournament_id': id
                    }
                )
                # break

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
            IDComplex = re.findall(r"complex0.ID = '(.*?)';", response.text)[0]
        except:
            IDComplex = ""

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
                            item['tournament_id'] = tournament_id
                            item['tournament_endpoint'] = tournament_endpoint
                            item['tournament_name'] = tournament_name
                            item['tournament_division_id'] = tournament_division_id
                            item['tournament_division_name'] = tournament_division_name
                            item['time_period'] = time_period
                            item['Location'] = Location
                            item['location_name'] = location_name
                            item['last_update'] = last_update
                            item['game_date'] = game_date
                            item['game_id'] = game_id
                            item['game_time'] = game_time
                            item['away_team_id'] = away_team_id
                            item['away_team'] = away_team
                            item['home_team_id'] = home_team_id
                            item['home_team'] = home_team
                            item['away_score'] = away_score
                            item['home_score'] = home_score
                            item['is_active'] = 0
                            item['created_by'] = "xbyte"
                            item['created_datetime'] = datetime.datetime.now()
                            item['IDComplex'] = IDComplex
                            yield item

                else:
                    print("No Game Table Found")
            except TypeError:
                game = ''
        except Exception as e:
            print(str(e))

        # --------------------------------------- Tournament pool Process ---------------------------- #

        pool_item = TourneymachineTournamnetPoolItem()
        pool_item['IDTournament'] = response.meta['tournament_id']
        pool_item['IDDivision'] = response.meta['tournament_division_id']
        pool_item['created_by'] = "xbyte"
        pool_item['created_datetime'] = datetime.datetime.now()

        for tournaments in response.xpath('//div[contains(@class, "col-sm-6")]//table[contains(@class,"tournamentResultsTable")]'):
            pool_item['IDPool'] = tournaments.xpath('.//*[@class="tournamentResultsTitle"]//text()').get().strip()
            print(pool_item['IDPool'])

            # headers = list()
            # for th in tournaments.xpath(".//th[not (@colspan)]"):
            #     headers.append("".join(th.xpath(".//text()").getall()).strip())

            for tr in tournaments.xpath('.//tr[(.//td)]'):

                try:
                    pool_item['IDTeam'] = tr.xpath(".//@href").get('').split('IDTeam=')[1]
                except:
                    pool_item['IDTeam'] = ""

                # tab = dict()
                # for id, td in enumerate(tr.xpath(".//td")):
                #     tab[headers[id]] = "".join(td.xpath(".//text()").getall()).strip()
                # pool_item['pool_description'] = json.dumps(tab)

                pool_item['pool_description'] = pool_item['IDPool']
                yield pool_item


# execute('scrapy crawl TMachineExtractor'.split())
