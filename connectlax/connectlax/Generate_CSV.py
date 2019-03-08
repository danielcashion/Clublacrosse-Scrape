import pymysql as MySQLdb
import os
import pyodbc
import pandas as pd
from connectlax.spiders import database_con as dbc
from connectlax.spiders import paths

def Export_CSV():

    current_folder = os.path.dirname(os.path.abspath(__file__))
    csv_folder = current_folder+"/csv/"
    if not os.path.exists(csv_folder):
        os.makedirs(csv_folder)

    server = dbc.server
    database = dbc.database
    username = dbc.username
    password = dbc.password
    driver = dbc.driver
    table_data = dbc.table_data
    table_link = dbc.table_link

    cnxn = pyodbc.connect(
        'DRIVER=' + driver + ';SERVER=' + server + ';DATABASE=' + database + ';UID=' + username + ';PWD=' + password)

    csv_Path = paths.csv_path+'Connextlax_data.csv'

    try:
        # File_1 = csv_folder + "temp.csv"
        File_2 = csv_Path

        sql = "SELECT [Id],[event_url],[event_name],[event_date],[event_location],[event_gender],[logo_url],[event_website],[event_type],[player_age_range],[created_by],[created_datetime] FROM "+dbc.table_data

        df = pd.read_sql(sql,cnxn)
        # df.drop_duplicates(subset=None, inplace=True)
        # df.rename(columns={"page_url": "Page URL",'video_title':'Video Title','video_embed_link':'Video Embed link','thumbnail_images':'Thumbnail Images URL','category_tree':'Category Tree'}, inplace=True)
        df.drop_duplicates(subset=None, inplace=True)
        df.to_csv(File_2, index=False)

        print ("\nCSV genrated...")

    except Exception as e:
        print ("Cant Genrate csv : " + str(e))

# Export_CSV()
