import MySQLdb
import os
import pandas as pd
from TourneyMachine.spiders import database_con as dbs
from TourneyMachine.spiders import paths

def Export_CSV():

    current_folder = os.path.dirname(os.path.abspath(__file__))
    csv_folder = current_folder+"/csv/"

    if not os.path.exists(csv_folder):
        os.makedirs(csv_folder)

    host = dbs.host
    username = dbs.username
    passwd = dbs.passwd
    db = dbs.database

    con = MySQLdb.connect(host, username, passwd,db, charset='utf8')
    cursor = con.cursor()

    csv_Path = paths.csv_path+'tourneymachine_data.csv'

    try:
        # File_1 = csv_folder + "temp.csv"
        File_2 = csv_Path

        sql = "Select tournament_endpoint, tournament_division_id, tournament_id, tournament_name, time_period, Location, tournament_division_name, last_update, game_date, game_id, game_time, location_name, away_team_id, away_team, away_score, home_score, home_team From "+dbs.table

        df = pd.read_sql(sql,con)
        # df.drop_duplicates(subset=None, inplace=True)
        # df.rename(columns={"page_url": "Page URL",'video_title':'Video Title','video_embed_link':'Video Embed link','thumbnail_images':'Thumbnail Images URL','category_tree':'Category Tree'}, inplace=True)
        df.drop_duplicates(subset=None, inplace=True)
        df.to_csv(File_2, index=False)

        print ("\nCSV genrated...")

    except Exception as e:
        print ("Cant Genrate csv : " + str(e))

# Export_CSV()