# -*- coding: utf-8 -*-
import json
import re
import scrapy
from scrapy.cmdline import execute
from scrapy.exceptions import CloseSpider
from Tournaments.items import TournamentsItem, TournamentsLocationItem
from Tournaments.spiders import paths
from datetime import datetime


class TournamentextractorSpider(scrapy.Spider):
    name = 'TournamentExtractor'
    allowed_domains = ['tourneymachine.com']
    start_urls = []

    def __init__(self, name=None, start=None, end=None, **kwargs):
        super().__init__(name, **kwargs)
        if start and end:
            self.start_date = f"{start[0:4]}-{start[4:6]}-{start[6:8]}"
            self.end_date = f"{end[0:4]}-{end[4:6]}-{end[6:8]}"
        else:
            ''' Error for start and end date'''
            print("No start date or end date provided...\nplease input start date and end date")
            print("you can pass dates by following way")
            print("eg. scrapy crawl TournamentExtractor -a start=YYYYMMDD -a end=YYYYMMDD")
            exit(0)

    def start_requests(self):
		# city is not used... maybe someday...

        # icons = ['baseball', 'basketball', 'beach volleyball', 'dodgeball', 'fieldhockey', 'football', 'futsal', 'hockey', 'kickball', 'lacrosse', 'other', 'rugby', 'soccer', 'softball', 'volleyball', 'water polo','']

        icons = ['fieldhockey']
		# icons = ['fieldhockey']
		

        for i in icons:

            url = f'https://tourneymachine.com/Public/Service/json/TournamentSearch.aspx?sport={i}&start={self.start_date}&end={self.end_date}'

            yield scrapy.FormRequest(
                url=url,
                callback=self.getData,
                method='GET',
                meta={
                    'com': i
                }
            )

    def getData(self, response):

        com = response.meta['com']
        file_path = paths.html_path + com + '.html'
        f = open(file_path, 'wb')
        f.write(response.body)
        f.close()

        item = TournamentsItem()
        locationItem = TournamentsLocationItem()

        json_data = json.loads(response.text)
        if json_data != {}:

            for i in json_data:
                item['IDCustomer'] = json_data[i]['IDCustomer']
                item['IDTournament'] = json_data[i]['IDTournament']
                item['Status'] = json_data[i]['Status']
                item['Name'] = json_data[i]['Name']
                item['Sport'] = json_data[i]['Sport']
                item['Logo'] = json_data[i]['Logo']

                if "https://" not in item['Logo']:
                    item['Logo'] = "https:" + item['Logo']

                item['StartDate'] = json_data[i]['StartDate']
                item['EndDate'] = json_data[i]['EndDate']
                item['DisplayLocation'] = json_data[i]['DisplayLocation']
                item['location_dictionary'] = json_data[i]['IDTournament']
                item['is_active_YN'] = "0"
                item['created_by'] = "xbyte"
                item['created_datetime'] = datetime.now()

                for compdata in json_data[i]['ComplexDictionary']:
                    locationItem['location_dictionary'] = json_data[i]['IDTournament']
                    locationItem['IDComplex'] = json_data[i]['ComplexDictionary'][compdata]['IDComplex']
                    locationItem['IDTournament'] = json_data[i]['ComplexDictionary'][compdata]['IDTournament']
                    locationItem['Name'] = json_data[i]['ComplexDictionary'][compdata]['Name']
                    locationItem['Address'] = json_data[i]['ComplexDictionary'][compdata]['Address']
                    locationItem['City'] = json_data[i]['ComplexDictionary'][compdata]['City']
                    locationItem['State'] = str(json_data[i]['ComplexDictionary'][compdata]['State']).upper()
                    locationItem['Zip'] = json_data[i]['ComplexDictionary'][compdata]['Zip']
                    locationItem['Long'] = json_data[i]['ComplexDictionary'][compdata]['Long']
                    locationItem['Lat'] = json_data[i]['ComplexDictionary'][compdata]['Lat']
                    locationItem['Notes'] = json_data[i]['ComplexDictionary'][compdata]['Notes']
                    locationItem['IDFacilities'] = None
                    locationItem['is_active_YN'] = "0"
                    locationItem['created_by'] = "xbyte"
                    locationItem['created_datetime'] = datetime.now()
                    yield locationItem
                yield item


# execute('scrapy crawl TournamentExtractor -a start=20191111 -a end=20191113'.split())
