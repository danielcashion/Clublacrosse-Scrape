# -*- coding: utf-8 -*-

# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://doc.scrapy.org/en/latest/topics/item-pipeline.html
import pymysql
from Tournaments.items import TournamentsItem, TournamentsLocationItem
from Tournaments import database_con as dbc


class TournamentsPipeline(object):
    i = 1

    def __init__(self):
        self.cnxn = pymysql.connect(dbc.host, dbc.user, dbc.passwd, dbc.database)
        self.cursor = self.cnxn.cursor()

    def process_item(self, item, spider):
        if isinstance(item, TournamentsItem):
            try:

                self.cursor.execute(
                    f"INSERT INTO {dbc.events_table} (`IDTournament`, `IDCustomer`, `status`, `name`, `sport`, `logo_url`, `StartDate`, `EndDate`, `DisplayLocation`, `location_dictionary`, `is_active_YN`, `created_by`, `created_datetime`) values (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)",
                    (
                        item['IDTournament'],
                        item['IDCustomer'],
                        item['Status'],
                        item['Name'],
                        item['Sport'],
                        item['Logo'],
                        item['StartDate'],
                        item['EndDate'],
                        item['DisplayLocation'],
                        item['location_dictionary'],
                        item['is_active_YN'],
                        item['created_by'],
                        item['created_datetime']
                    )
                )

                self.cnxn.commit()
                print('\rData Inserted... ' + str(self.i))
                self.i += 1
            except Exception as e:
                print(str(e))

        if isinstance(item, TournamentsLocationItem):
            try:
                self.cursor.execute(
                    f"INSERT INTO {dbc.location_table} (`location_dictionary`, `IDComplex`, `IDTournament`, `Name`, `Address`, `City`, `State`, `Zip`, `Long`, `Lat`, `Notes`, `IDFacilities`, `is_active_YN`, `created_by`, `created_datetime`) values (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)",
                    (
                        item['location_dictionary'],
                        item['IDComplex'],
                        item['IDTournament'],
                        item['Name'],
                        item['Address'],
                        item['City'],
                        item['State'],
                        item['Zip'],
                        item['Long'],
                        item['Lat'],
                        item['Notes'],
                        item['IDFacilities'],
                        item['is_active_YN'],
                        item['created_by'],
                        item['created_datetime']
                    )
                )
                self.cnxn.commit()
            except Exception as e:
                print(e)

        return item
