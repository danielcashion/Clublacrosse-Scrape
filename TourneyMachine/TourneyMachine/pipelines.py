# -*- coding: utf-8 -*-

# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://doc.scrapy.org/en/latest/topics/item-pipeline.html
import pyodbc

from TourneyMachine.items import TourneymachineItem, TourneymachineTournamnetTitleItem
from TourneyMachine.spiders import database_con as dbc


class TourneymachinePipeline(object):
    server = dbc.server
    database = dbc.database
    username = dbc.username
    password = dbc.password
    driver = dbc.driver
    table = dbc.table
    i = 1

    def __init__(self) -> None:
        super().__init__()
        self.cnxn = pyodbc.connect('DRIVER=' + self.driver + ';SERVER=' + self.server + ';DATABASE=' + self.database + ';UID=' + self.username + ';PWD=' + self.password)
        self.cursor = self.cnxn.cursor()

    def process_item(self, item, spider):

        if isinstance(item, TourneymachineItem):
            try:

                self.cursor.execute(
                    """INSERT INTO """ + dbc.table + "([tournament_endpoint], [tournament_division_id], [tournament_id], [tournament_name], [time_period], [Location], [tournament_division_name], [last_update], [game_date], [game_id], [game_time], [location_name], [home_team_id], [away_team_id], [away_team], [away_score], [home_score], [home_team]) VALUES('" +
                    item['tournament_endpoint'] + "', '" + item['tournament_division_id'] + "', '" + item['tournament_id'] + "', '" + item['tournament_name'] + "', '" + item['time_period'] + "', '" +
                    item['Location'] + "', '" + item['tournament_division_name'] + "', '" + item['last_update'] + "', '" + item['game_date'] + "', '" + item['game_id'] + "', '" + item[
                        'game_time'] + "', '" + item['location_name'] + "', '" + item['home_team_id'] + "', '" + item['away_team_id'] + "', '" + item['away_team'] + "', '" + item[
                        'away_score'] + "', '" + item['home_score'] + "', '" + item['home_team'] + "')",
                )
                self.cnxn.commit()
                print('\rData inserted..' + str(self.i))
                self.i += 1

            except Exception as e:
                print(str(e))
            return item
        if isinstance(item, TourneymachineTournamnetTitleItem):
            try:
                self.cursor.execute(
                    f"INSERT INTO {dbc.title_table} ([tournament_id], [tournament_division_id], [tournament_division_name], [tournament_title], [tournament_details]) VALUES (?, ?, ?, ?, ?)",
                    (
                        item['tournament_id'],
                        item['tournament_division_id'],
                        item['tournament_division_name'],
                        item['tournament_title'],
                        item['tournament_details']
                    )
                )
                self.cnxn.commit()
                print('\rData inserted..' + str(self.i))
                self.i += 1
            except Exception as e:
                print(e)
