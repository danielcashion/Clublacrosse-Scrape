# -*- coding: utf-8 -*-
import json
import re

import scrapy
from scrapy.cmdline import execute

from Tournaments.Generate_CSV import Export_CSV
from Tournaments.items import TournamentsItem
from Tournaments.spiders import paths


class TournamentextractorSpider(scrapy.Spider):
    name = 'TournamentExtractor'
    allowed_domains = ['tourneymachine.com']
    start_urls = ['https://tourneymachine.com/Home.aspx/']

    def parse(self, response):
        file_path = paths.html_path + 'main_page.html'
        f = open(file_path, 'wb')
        f.write(response.body)
        f.close()

        try:
            json_data = re.findall(r'\{\"(.*?)\"\}\,*', response.text)
            for i in json_data:
                i = '{\"'+i+'\"}'
                dct = json.loads(i)

                try:
                    Keyword = dct['keywords']
                except KeyError:
                    Keyword = ''

                try:
                    Title = dct['title']
                except KeyError:
                    Title = ''

                try:
                    Date = dct['date']
                except KeyError:
                    Date = ''

                try:
                    Location = dct['location']
                except KeyError:
                    Location = ''

                try:
                    Icon = dct['icon']
                except KeyError:
                    Icon = ''

                try:
                    Link = dct['link']
                except KeyError:
                    Link = ''

                item = TournamentsItem()
                item['Keyword'] = Keyword
                item['Title'] = Title
                item['Date'] = Date
                item['Location'] = Location
                item['Icon'] = Icon
                item['Link'] = Link
                # item['status'] = 'pending'
                yield item

        except Exception as e:
            print(str(e))
        pass

    def close(spider, reason):
        Export_CSV()

execute('scrapy crawl TournamentExtractor'.split())