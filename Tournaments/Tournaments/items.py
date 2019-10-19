# -*- coding: utf-8 -*-

# Define here the models for your scraped items
#
# See documentation in:
# https://doc.scrapy.org/en/latest/topics/items.html

import scrapy


class TournamentsComplexItem(scrapy.Item):

    # complex data item

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


class TournamentsItem(scrapy.Item):
    # define the fields for your item here like:
    # name = scrapy.Field()

    # Home Page Data Items
    # updated Fields ....
    IDCustomer = scrapy.Field()
    IDTournament = scrapy.Field()
    Status = scrapy.Field()
    Name = scrapy.Field()
    Sport = scrapy.Field()
    Color = scrapy.Field()
    Logo = scrapy.Field()
    StartDate = scrapy.Field()
    EndDate = scrapy.Field()
    DisplayDate = scrapy.Field()
    DisplayLocation = scrapy.Field()
    RegistrationOpen = scrapy.Field()
    RegistrationDateRangeDisplay = scrapy.Field()
    TourneyPass = scrapy.Field()
    ComplexDictionary = scrapy.Field()

    # Old Filds ...
    # Keyword = scrapy.Field()
    # Title = scrapy.Field()
    # Date = scrapy.Field()
    # Location = scrapy.Field()
    # Icon = scrapy.Field()
    # Link = scrapy.Field()
    # Long = scrapy.Field()
    # Lat = scrapy.Field()
    # Status = scrapy.Field()
