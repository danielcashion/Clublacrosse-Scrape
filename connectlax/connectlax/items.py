# -*- coding: utf-8 -*-

# Define here the models for your scraped items
#
# See documentation in:
# https://doc.scrapy.org/en/latest/topics/items.html

import scrapy


class ConnectlaxItem_link(scrapy.Item):
    LinkUrl = scrapy.Field()
    event_url = scrapy.Field()
    event_name = scrapy.Field()
    event_date = scrapy.Field()
    event_location = scrapy.Field()
    event_gender = scrapy.Field()
    status = scrapy.Field()
    pass


class ConnectlaxItem(scrapy.Item):
    event_url = scrapy.Field()
    event_name = scrapy.Field()
    event_date = scrapy.Field()
    event_location = scrapy.Field()
    event_gender = scrapy.Field()
    logo_url = scrapy.Field()
    event_website = scrapy.Field()
    event_type = scrapy.Field()
    player_age_range = scrapy.Field()
    created_by = scrapy.Field()
    created_datetime = scrapy.Field()
    pass
