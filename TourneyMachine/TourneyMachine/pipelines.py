# -*- coding: utf-8 -*-

# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://doc.scrapy.org/en/latest/topics/item-pipeline.html
import MySQLdb

from TourneyMachine.items import TourneymachineItem
from TourneyMachine.spiders import database_con as dbc

class TourneymachinePipeline(object):
    DB_IP = dbc.host
    DB_user = dbc.username
    DB_password = dbc.passwd
    DB_name = dbc.database
    i = 1

    def __init__(self):
        try:
            self.connection = MySQLdb.connect(self.DB_IP, self.DB_user, self.DB_password, charset='utf8')
            self.cursor = self.connection.cursor()
            self.cursor.execute('CREATE DATABASE if not exists ' + self.DB_name)
        except Exception as e:
            print(str(e))

        try:
            self.connection = MySQLdb.connect(self.DB_IP, self.DB_user, self.DB_password, self.DB_name, charset='utf8')
            self.cursor = self.connection.cursor()
            strquery2 = "CREATE TABLE if not exists " + dbc.table + """ (Id INT NOT NULL AUTO_INCREMENT,
                                                                            tournament_endpoint longtext DEFAULT NULL,
                                                                            tournament_division_id longtext DEFAULT NULL,
                                                                            tournament_id longtext DEFAULT NULL,
                                                                            tournament_name longtext DEFAULT NULL,
                                                                            time_period longtext DEFAULT NULL,
                                                                            Location longtext DEFAULT NULL,
                                                                            tournament_division_name longtext DEFAULT NULL,
                                                                            last_update longtext DEFAULT NULL,
                                                                            game_date longtext DEFAULT NULL,
                                                                            game_id longtext DEFAULT NULL,
                                                                            game_time longtext DEFAULT NULL,
                                                                            location_name longtext DEFAULT NULL,
                                                                            away_team_id longtext DEFAULT NULL,
                                                                            away_team longtext DEFAULT NULL,
                                                                            away_score longtext DEFAULT NULL,
                                                                            home_score longtext DEFAULT NULL,
                                                                            home_team longtext DEFAULT NULL,
                                                                            PRIMARY KEY (`Id`))"""
            self.cursor.execute(strquery2)
        except Exception as e:
            print(str(e))
    def process_item(self, item, spider):
        if isinstance(item, TourneymachineItem):
            try:
                self.connection = MySQLdb.connect(self.DB_IP, self.DB_user, self.DB_password, self.DB_name,
                                                  charset='utf8')
                self.cursor = self.connection.cursor()
                self.cursor.execute("set names utf8;")
                self.cursor.execute(
                    """INSERT INTO """ + dbc.table + """(tournament_endpoint, tournament_division_id, tournament_id, tournament_name, time_period, Location, tournament_division_name, last_update, game_date, game_id, game_time, location_name, away_team_id, away_team, away_score, home_score, home_team) VALUES(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)""",
                    (item['tournament_endpoint'], item['tournament_division_id'], item['tournament_id'], item['tournament_name'], item['time_period'],
                     item['Location'], item['tournament_division_name'], item['last_update'], item['game_date'],
                     item['game_id'], item['game_time'], item['location_name'], item['away_team_id'], item['away_team'], item['away_score'], item['home_score'],item['home_team']))
                self.connection.commit()
                print('\rData inserted..' + str(self.i))
                self.i += 1

            except Exception as e:
                print(str(e))
            return item
