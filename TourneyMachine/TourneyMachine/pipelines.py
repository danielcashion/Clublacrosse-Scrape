# -*- coding: utf-8 -*-

# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://doc.scrapy.org/en/latest/topics/item-pipeline.html
import pymysql
from TourneyMachine.items import TourneymachineItem
from TourneyMachine import database_con as dbc


class TourneymachinePipeline(object):

    def __init__(self) -> None:
        super().__init__()
        self.cnxn = pymysql.connect(dbc.host, dbc.user, dbc.passwd, dbc.database)
        self.cursor = self.cnxn.cursor()

    def process_item(self, item, spider):

        if isinstance(item, TourneymachineItem):
            try:
                self.cursor.execute(f"INSERT INTO {dbc.game_table} (`tournament_id` , `tournament_endpoint`, `tournament_name`, `tournament_division_id`, `tournament_division_name`, `time_period`, `location_id`, `location_name`, `last_update`, `game_date`, `game_id`, `game_time`, `away_team_id`, `away_team_name`, `home_team_id`, `home_team_name`, `away_score`, `home_score`, `is_active`, `created_by`, `created_datetime`) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)",
                                    (
                                        item['tournament_id'],
                                        item['tournament_endpoint'],
                                        item['tournament_name'],
                                        item['tournament_division_id'],
                                        item['tournament_division_name'],
                                        item['time_period'],
                                        item['Location'],
                                        item['location_name'],
                                        item['last_update'],
                                        item['game_date'],
                                        item['game_id'],
                                        item['game_time'],
                                        item['away_team_id'],
                                        item['away_team'],
                                        item['home_team_id'],
                                        item['home_team'],
                                        item['away_score'],
                                        item['home_score'],
                                        item['is_active'],
                                        item['created_by'],
                                        item['created_datetime']
                                    )
                                    )
                self.cnxn.commit()
                print('\rData inserted...')

            except Exception as e:
                print(str(e))

        # if isinstance(item, TourneymachineTournamnetTitleItem):
        #     try:
        #         self.cursor.execute(
        #             f"INSERT INTO {dbc.title_table} ([tournament_id], [tournament_division_id], [tournament_division_name], [tournament_title], [tournament_details]) VALUES (?, ?, ?, ?, ?)",
        #             (
        #                 item['tournament_id'],
        #                 item['tournament_division_id'],
        #                 item['tournament_division_name'],
        #                 item['tournament_title'],
        #                 item['tournament_details']
        #             )
        #         )
        #         self.cnxn.commit()
        #         print('\rData inserted..' + str(self.i))
        #         self.i += 1
        #     except Exception as e:
        #         print(e)

        return item