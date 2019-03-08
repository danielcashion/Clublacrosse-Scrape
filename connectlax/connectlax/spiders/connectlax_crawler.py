# -*- coding: utf-8 -*-
import scrapy
import sys
import logging
import os
from connectlax.items import ConnectlaxItem
import re
from w3lib.html import remove_tags
from datetime import datetime, timezone
from connectlax.Generate_CSV import Export_CSV
from connectlax.spiders import database_con as dbc
import pyodbc

PageSave = False
Current_Directory = os.path.dirname(os.path.abspath(__file__))
Html_Directory_Link = Current_Directory + '\\Html\\' + 'HTML_Link\\'
Html_Directory_Data = Current_Directory + '\\Html\\' + 'HTML_Data\\'

class ConnectlaxCrawlerSpider(scrapy.Spider):
    name = 'connectlax_crawler'
    allowed_domains = ['www.connectlax.com']
    def start_requests(self):
        try:
            LinkId = 0
            server = dbc.server
            database = dbc.database
            username = dbc.username
            password = dbc.password
            driver = dbc.driver
            table_data = dbc.table_data
            table_link = dbc.table_link
            cnxn = pyodbc.connect('DRIVER=' + driver + ';SERVER=' + server + ';DATABASE=' + database + ';UID=' + username + ';PWD=' + password)
            cursor = cnxn.cursor()
            cursor.execute("EXEC dbo.usp_web_scrape NULL")
            results = cursor.fetchall()
        except Exception as e:
            logging.log(logging.ERROR, e)  # self.cnxn = pyodbc.connect('DRIVER=' + self.driver + ';SERVER=' + self.server + ';DATABASE=' + self.database + ';UID=' + self.username + ';PWD=' + self.password)  # self.cursor = self.cnxn.cursor()
        for row in results:
            try:
                Page = 1
                LinkId = LinkId + 1
                start_urls = row[0].strip()
                #print (start_urls)
                yield scrapy.Request(url=str(start_urls), callback=self.parse , meta={'Page':Page,'LinkId':LinkId})
            except Exception as e:
                logging.log(logging.ERROR, e)
            # start_urls = ['https://www.connectlax.com/camp_search?utf8=%E2%9C%93&search_distance=3000.00&startdate=2019-02-27&enddate=2021-02-27&search_gender_any=1&search_agerange_8=5%3B8&search_eventtype_team=1']

    def parse(self, response):
        # import sys
        # sys.exit()
        Page = response.meta['Page']
        LinkId = response.meta['LinkId']
        print (response.url)
        LinkUrl = response.url
        try:
            if PageSave == True:
                HTML_Save_Path_Link = Html_Directory_Link + str(LinkId) +'_'+str(Page) +  '.html'
                #HTML_Save_Path_Link = Html_Directory_Link + str(LinkId) + '_' + str(Page) + '.html'
                f = open(HTML_Save_Path_Link, 'w')
                f.write(response.text)
                f.close()
        except Exception as e:
            logging.log(logging.ERROR, e)

        try:
            EventList = []
            EventList = response.xpath('//div[@class="grid-list-row grid-list-row-col3-mid body "]')
        except Exception as e:
            logging.log(logging.ERROR, e)

        for Event_item in EventList:
            # All varaibles Declaration
            try:
                event_name = ''
                event_date = ''
                event_location = ''
                event_gender = ''
                event_url = ''
                logo_url = ''
                created_by = 'spider'
                created_datetime = ''
            except Exception as e:
                logging.log(logging.ERROR, e)
            try:
                event_name = Event_item.xpath('.//a/text()').extract_first(default='').strip()
            except Exception as e:
                logging.log(logging.ERROR, e)
            try:
                event_url = Event_item.xpath('.//a/@href').extract_first(default='').strip()
            except Exception as e:
                logging.log(logging.ERROR, e)
            try:
                event_date = Event_item.xpath('.//div[@class="grid-list-cell cell3 ellipsis"]/span/text()').extract_first(default='').strip()
            except Exception as e:
                logging.log(logging.ERROR, e)
            try:
                event_location = Event_item.xpath('.//div[@class="grid-list-cell cell4 ellipsis"]/span/text()').extract_first(default='').strip()
            except Exception as e:
                logging.log(logging.ERROR, e)
            try:
                event_gender = Event_item.xpath('.//div[@class="fixed-12 centered"][2]/div/text()').extract_first(default='').strip()
            except Exception as e:
                logging.log(logging.ERROR, e)
            #yield scrapy.Request(url=str(ProductUrl), callback=self.parse_data, meta={'Page': Page, 'LinkId': LinkId, 'ProductId': ProductId, 'HTML_Save_Path_Link': HTML_Save_Path_Link})
            yield scrapy.Request(url=str(event_url), callback=self.parse_data, meta = {'event_name':event_name,'event_url':event_url,'event_date':event_date,'event_location':event_location,'event_gender':event_gender})
            #break

        if response.xpath('//div[@class="pagination"]/ul/li[@class=" active"]/following-sibling::li/a/@href').extract_first(default='').strip():
            NextpageLink = 'https://www.connectlax.com'+response.xpath('//div[@class="pagination"]/ul/li[@class=" active"]/following-sibling::li/a/@href').extract_first(default='').strip()
            Page = Page + 1
            yield scrapy.Request(url=str(NextpageLink), callback=self.parse, meta={'Page': Page, 'LinkId': LinkId})

    def parse_data(self, response):
        try:
            print (response.url)
            item = ConnectlaxItem()
            logo_url = ''
            created_by = 'spider'
            created_datetime = datetime.utcnow().strftime("%Y%m%d")
            event_name = response.meta['event_name']
            event_url = response.meta['event_url']
            event_date = response.meta['event_date']
            event_location = response.meta['event_location']
            event_gender = response.meta['event_gender']
            #print (response.url)
        except Exception as e:
            logging.log(logging.ERROR, e)

        # logo_url
        try:
            logo_url = ''
            logo_url = response.xpath('//img[@alt="avatar"]/@src').extract_first(default='').strip()
        except Exception as e:
            logging.log(logging.ERROR, e)
        # event_website
        try:
            event_website = ''
            event_website = response.xpath('//button[@class="button-transparent full"]/@onclick').extract_first(default='').strip()
            if event_website!='':
                event_website = event_website.split(',')[2].replace("'","").strip()
        except Exception as e:
            logging.log(logging.ERROR, e)
        #event_type
        try:
            event_type = response.xpath('//h5[contains(text(),"Event Type")]/parent::li/p/text()').extract_first(default='').strip()
        except Exception as e:
            logging.log(logging.ERROR, e)
        # player_age_range
        try:
            player_age_range = response.xpath('//h5[contains(text(),"Player Age Range")]/parent::li/p/text()').extract_first(default='').strip()
        except Exception as e:
            logging.log(logging.ERROR, e)

        # # coaches
        # try:
        #     coaches = response.xpath('//div[@class="team-associations"]/div/p/text()').extract_first(default='').strip()
        # except Exception as e:
        #     logging.log(logging.ERROR, e)


        # imageurl (extract the first image)

        try:
            item['event_url'] = event_url
            item['event_name'] = event_name
            item['event_date'] = event_date.replace("'","''")
            item['event_location'] = event_location
            item['event_gender'] = event_gender.replace("'","''")
            item['logo_url'] = logo_url
            item['event_website'] = event_website
            item['event_type'] = event_type
            item['player_age_range'] = player_age_range
            item['created_by'] = created_by
            item['created_datetime'] = created_datetime
            yield item
        except Exception as e:
            logging.log(logging.ERROR, e)
        #print (response.status)

    def close(spider, reason):
        Export_CSV()


from scrapy.cmdline import execute
execute("scrapy crawl connectlax_crawler".split())