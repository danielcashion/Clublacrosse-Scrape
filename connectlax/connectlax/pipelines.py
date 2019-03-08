# -*- coding: utf-8 -*-

# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://doc.scrapy.org/en/latest/topics/item-pipeline.html
import pymysql as MySQLdb
import pyodbc
from connectlax.items import ConnectlaxItem,ConnectlaxItem_link
from connectlax.spiders import database_con as dbc
import logging

class ConnectlaxPipeline(object):
    server = dbc.server
    database = dbc.database
    username = dbc.username
    password = dbc.password
    driver = dbc.driver
    table_data = dbc.table_data
    table_link = dbc.table_link

    i = 1

    def __init__(self):
        try:
            self.cnxn = pyodbc.connect(
                'DRIVER=' + self.driver + ';SERVER=' + self.server + ';DATABASE=' + self.database + ';UID=' + self.username + ';PWD=' + self.password)
            # self.cursor = self.cnxn.cursor()
            # self.cursor.execute('CREATE DATABASE '+self.database)
        except Exception as e:
            logging.log(logging.ERROR, e)

        # try:
        #     self.cnxn = pyodbc.connect('DRIVER=' + self.driver + ';SERVER=' + self.server + ';DATABASE=' + self.database + ';UID=' + self.username + ';PWD=' + self.password)
        #     self.cursor = self.cnxn.cursor()
        #     qry1 = "CREATE TABLE "+self.table_link+""" ([Id] INT NOT NULL IDENTITY,
        #                                                 [Page] [text] NOT NULL,
        #                                                 [LinkUrl] [text] NOT NULL,
        #                                                 [event_url] [varchar](250) NULL UNIQUE,
        #                                                 [event_name] [text] NOT NULL,
        #                                                 [event_date] [text] NULL,
        #                                                 [event_location] [text] NULL,
        #                                                 [event_gender] [text] NOT NULL,
        #                                                 [status] [varchar](250) default 'Pending',
        #                                                 PRIMARY KEY([Id])
        #                                             )"""
        #     self.cursor.execute(qry1)
        #     self.cnxn.commit()
        #     print('Link Table Created')
        # except Exception as e:
        #     logging.log(logging.ERROR, e)

        try:
            self.cnxn = pyodbc.connect('DRIVER=' + self.driver + ';SERVER=' + self.server + ';DATABASE=' + self.database + ';UID=' + self.username + ';PWD=' + self.password)
            self.cursor = self.cnxn.cursor()
            qry1 = "CREATE TABLE "+self.table_data+""" ([Id] INT NOT NULL IDENTITY,           
                                                        [event_url] [varchar](250) NULL UNIQUE,
                                                        [event_name] [text] NOT NULL,
                                                        [event_date] [text] NULL,
                                                        [event_location] [text] NULL,
                                                        [event_gender] [text] NOT NULL,
                                                        [logo_url] [text] NOT NULL,
                                                        [event_website] [text] NOT NULL,
                                                        [event_type] [text] NULL,
                                                        [player_age_range] [text] NULL,
                                                        [created_by] [text] NULL,
                                                        [created_datetime] [text] NULL,                                                        
                                                        PRIMARY KEY([Id])
                                                    )"""
            self.cursor.execute(qry1)
            self.cnxn.commit()
            print('Data Table Created')
        except Exception as e:
            logging.log(logging.ERROR, e)
    def process_item(self, item, spider):

        if isinstance(item, ConnectlaxItem_link):
            try:
                self.cnxn = pyodbc.connect(
                    'DRIVER=' + self.driver + ';SERVER=' + self.server + ';DATABASE=' + self.database + ';UID=' + self.username + ';PWD=' + self.password)
                self.cursor = self.cnxn.cursor()
                self.cursor.execute("INSERT INTO " + dbc.table_link + " ([Page],[LinkUrl],[event_url],[event_name],[event_date],[event_location],[event_gender]) VALUES ('" + str(item['Page'])+ "', '" + str(item['LinkUrl'])  + "', '" + str(item['event_url']) + "', '" + str(item['event_name']) + "', '" + str(item['event_date']) + "', '" + str(item['event_location']) + "', '" + str(item['event_gender']) + "')")
                #self.cursor.execute("INSERT INTO " + dbc.table + " ([event_url],[event_name],[event_date],[event_location],[event_gender],[logo_url],[event_website],[event_type],[player_age_range],[created_by],[created_datetime]) VALUES ('" + item['event_url'] + "', '" + item['event_name'] + "', '" + item['event_date'] + "', '" + item['event_location'] + "', '" + item['event_gender'] + "', '" + item['logo_url'] + "', '" + item['event_website'] + "', '" + item['event_type'] + "', '" + item['player_age_range'] + "', '" + item['created_by'] + "', '" + item['created_datetime'] + "')")
                self.cnxn.commit()
                print('\rLink Inserted.'+str(item['event_url']))
                #print('\rData Inserted.' + str(self.i))
                self.i += 1
            except Exception as e:
                logging.log(logging.ERROR, e)
            return item

        if isinstance(item, ConnectlaxItem):
            try:
                self.cnxn = pyodbc.connect(
                    'DRIVER=' + self.driver + ';SERVER=' + self.server + ';DATABASE=' + self.database + ';UID=' + self.username + ';PWD=' + self.password)
                self.cursor = self.cnxn.cursor()
                #self.cursor.execute("set names utf8;")
                #self.cursor.execute("INSERT INTO " + dbc.table + " ([Keyword],[Title],[Date],[Location],[Icon],[Link]) VALUES ('" + str(item['Keyword']) + "', '" + str(item['Title']) + "', '" + str(item['Date']) + "', '" + str(item['Location']) + "', '" + str(item['Icon']) + "', '" + str(item['Link']) + "')")
                #self.cursor.execute("INSERT INTO "+dbc.table+" ([event_url],[event_name],[event_date],[event_location],[event_gender],[logo_url],[event_website],[event_type],[player_age_range],[created_by],[created_datetime]) VALUES ('"+str(item['event_url'])+"', '"+str(item['event_name'])+"', '"+str(item['event_date'])+"', '"+str(item['event_location'])+"', '"+str(item['event_gender'])+"', '"+str(item['logo_url'])+"', '"+str(item['event_website'])+"', '"+str(item['event_type'])+"', '"+str(item['player_age_range'])+"', '"+str(item['created_by'])+"', '"+str(item['created_datetime'])+"')")

                #self.cursor.execute("""INSERT INTO """ + self.DB_table_link + """(LinkUrl,LinkId,Page,ProductId,ProductUrl,HTML_Save_Path_Link) VALUES (%s,%s,%s,%s,%s,%s)""", (item['LinkUrl'], item['LinkId'], item['Page'], item['ProductId'], item['ProductUrl'], item['HTML_Save_Path_Link']))

                self.cursor.execute("INSERT INTO " + dbc.table_data + " ([event_url],[event_name],[event_date],[event_location],[event_gender],[logo_url],[event_website],[event_type],[player_age_range],[created_by],[created_datetime]) VALUES ('" + str(item['event_url']) + "', '" + str(item['event_name']) + "', '" + str(item['event_date']) + "', '" + str(item['event_location']) + "', '" + str(item['event_gender']) + "', '" + str(item['logo_url']) + "', '" + str(item['event_website']) + "', '" + str(item['event_type']) + "', '" + str(item['player_age_range']) + "', '" + str(item['created_by']) + "', '" + str(item['created_datetime']) + "')")
                #self.cursor.execute("INSERT INTO " + dbc.table + " ([event_url],[event_name],[event_date],[event_location],[event_gender],[logo_url],[event_website],[event_type],[player_age_range],[created_by],[created_datetime]) VALUES ('" + item['event_url'] + "', '" + item['event_name'] + "', '" + item['event_date'] + "', '" + item['event_location'] + "', '" + item['event_gender'] + "', '" + item['logo_url'] + "', '" + item['event_website'] + "', '" + item['event_type'] + "', '" + item['player_age_range'] + "', '" + item['created_by'] + "', '" + item['created_datetime'] + "')")
                self.cnxn.commit()
                print('\rData Inserted.'+str(item['event_url']))
                #print('\rData Inserted.' + str(self.i))
                self.i += 1
            except Exception as e:
                logging.log(logging.ERROR, e)
            return item
        # return item
