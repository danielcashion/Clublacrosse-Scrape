
#import pymysql as MySQLdb  #Dan Commented 2019 02 25
import pyodbc
from Tournaments.items import TournamentsItem
from Tournaments.spiders import database_con as dbc

class TournamentsPipeline(object):
    DB_IP = dbc.host
    DB_user = dbc.username
    DB_password = dbc.passwd
    DB_name = dbc.database
    DB_driver = dbc.driver
    i = 1

    # path = 'C:/Users/danie/Dropbox/Lax Stats/Code/TourneyMachine/Tournaments'
    # os.chdir(path)
    connection_string = "Driver="+db_driver+";Server="+DB_IP+";Initial Catalog="+DB_name+";Uid="+DB_user+";Pwd="+DB_password+";Ecrypt=Yes"

    def __init__(self):
        try:
            # self.connection = MySQLdb.connect(self.DB_IP, self.DB_user, self.DB_password, charset='utf8')
            self.connection = pyodbc.connect(connection_string)
			self.cursor = self.connection.cursor()
            self.cursor.execute('CREATE DATABASE if not exists ' + self.DB_name)
        except Exception as e:
            print(str(e))

        try:
            #self.connection = MySQLdb.connect(self.DB_IP, self.DB_user, self.DB_password, self.DB_name, charset='utf8')
            self.connection = pyodbc.connect(connection_string)
            self.cursor = self.connection.cursor()
            strquery2 = "CREATE TABLE if not exists " + dbc.table + """ (Id INT IDENTITY(1,1) NOT NULL,
                                                                                Keyword VARCHAR(255) DEFAULT NULL,
                                                                                Title VARCHAR(255) DEFAULT NULL,
                                                                                Date VARCHAR(255) DEFAULT NULL,
                                                                                Location VARCHAR(255) DEFAULT NULL,
                                                                                Icon VARCHAR(255) DEFAULT NULL,
                                                                                Link varchar(255) DEFAULT NULL,
                                                                                status VARCHAR(255) DEFAULT NULL,
                                                                                PRIMARY KEY (`Id`),
                                                                                UNIQUE (Link))"""
            self.cursor.execute(strquery2)
        except Exception as e:
            print(str(e))
    def process_item(self, item, spider):
        if isinstance(item, TournamentsItem):
            try:
                self.connection = MySQLdb.connect(self.DB_IP, self.DB_user, self.DB_password, self.DB_name,
                                                  charset='utf8')
                self.cursor = self.connection.cursor()
                self.cursor.execute("set names utf8;")
                self.cursor.execute(
                    """INSERT INTO """ + dbc.table + """(Keyword,Title,Date,Location,Icon,Link,status) VALUES(%s, %s, %s, %s, %s, %s, %s)""",
                    (item['Keyword'],item['Title'],item['Date'], item['Location'], item['Icon'], item['Link'],item['status']))
                self.connection.commit()
                print('\rData inserted..' + str(self.i), end = "")
                self.i += 1

            except Exception as e:
                print(str(e))
            return item
        # return item
