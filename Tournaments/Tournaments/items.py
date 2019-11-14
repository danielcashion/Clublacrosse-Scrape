# -*- coding: utf-8 -*-

# Define here the models for your scraped items
#
# See documentation in:
# https://doc.scrapy.org/en/latest/topics/items.html

import scrapy


class TournamentsLocationItem(scrapy.Item):

    location_dictionary = scrapy.Field()
    IDComplex = scrapy.Field()
    IDTournament = scrapy.Field()
    Name = scrapy.Field()
    Address = scrapy.Field()
    City = scrapy.Field()
    State = scrapy.Field()
    Zip = scrapy.Field()
    Long = scrapy.Field()
    Lat = scrapy.Field()
    Notes = scrapy.Field()
    IDFacilities = scrapy.Field()
    is_active_YN = scrapy.Field()
    created_by = scrapy.Field()
    created_datetime = scrapy.Field()


class TournamentsItem(scrapy.Item):

    IDCustomer = scrapy.Field()
    IDTournament = scrapy.Field()
    Status = scrapy.Field()
    Name = scrapy.Field()
    Sport = scrapy.Field()
    Logo = scrapy.Field()
    StartDate = scrapy.Field()
    EndDate = scrapy.Field()
    DisplayLocation = scrapy.Field()
    location_dictionary = scrapy.Field()
    is_active_YN = scrapy.Field()
    created_by = scrapy.Field()
    created_datetime = scrapy.Field()