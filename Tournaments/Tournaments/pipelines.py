# -*- coding: utf-8 -*-

# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://doc.scrapy.org/en/latest/topics/item-pipeline.html
import pyodbc
from Tournaments.items import TournamentsItem, TournamentsComplexItem
from Tournaments.spiders import database_con as dbc

class TournamentsPipeline(object):

    server = dbc.server
    database = dbc.database
    username = dbc.username
    password = dbc.password
    driver = dbc.driver
    table = dbc.table
    i = 1

    def __init__(self):
        self.cnxn = pyodbc.connect(f'DRIVER={self.driver};SERVER={self.server};DATABASE={self.database};UID={self.username};PWD={self.password}')
        self.cursor = self.cnxn.cursor()

    def process_item(self, item, spider):
        if isinstance(item, TournamentsItem):
            try:

                self.cursor.execute(
                    f"INSERT INTO {dbc.table} (CustomerID ,TournamentID ,status ,name ,sport ,color ,logo ,StartDate ,EndDate ,DisplayDate ,DisplayLocation ,RegistrationOpen ,RegistrationDateRangeDisplay ,TourneyPass ,ComplexDictionary) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
                    (
                        item['IDCustomer'],
                        item['IDTournament'],
                        item['Status'],
                        item['Name'],
                        item['Sport'],
                        item['Color'],
                        item['Logo'],
                        item['StartDate'],
                        item['EndDate'],
                        item['DisplayDate'],
                        item['DisplayLocation'],
                        item['RegistrationOpen'],
                        item['RegistrationDateRangeDisplay'],
                        item['TourneyPass'],
                        item['ComplexDictionary']
                    )
                )

                self.cnxn.commit()
                print('\rData Inserted... '+str(self.i))
                self.i += 1
            except Exception as e:
                print(str(e))

        if isinstance(item, TournamentsComplexItem):
            try:
                self.cursor.execute(
                    f"INSERT INTO {dbc.table2} (IDComplex, IDTournament, Name, Address, City, State, Zip, Long, Lat) values (?, ?, ?, ?, ?, ?, ?, ?, ?)",
                    (
                        item['IDComplex'],
                        item['IDTournament'],
                        item['Name'],
                        item['Address'],
                        item['City'],
                        item['State'],
                        item['Zip'],
                        item['Long'],
                        item['Lat']
                    )
                )

                self.cnxn.commit()
            except Exception as e:
                print(e)

        return item
