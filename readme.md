# Welcome to our data scraping folder'
What we have here are two folders that we use:
1 - Tournaments and
2 - Tourneymachine

## Tounraments - Step 1
From within the spiders folder (Tournaments\Tournaments\Spiders), you will see TournamentExtractor.py. When at the parent folder (the first Tournaments), if once runs from an anaconda promt *logged in as an administrator) "scrapy crawl TournamentExtractor -a start=YYYYMMDD -a end=YYYYMMDD, we will scrape the events from our api endpoint and store them in our "public_events" database.

From there, we determine if we want to scrape this event's details via setting a boolean flag "is_active" in the table to 1.

## TMachineExtractor - Step 2
This scraper queries the table from the first query for the resulting endpoint and scrapes those pages. It inserts data into two separate tables, one for game details and the other for locations of those games.

## Scheduling
What we would like to do is scrape the endpoints from ***step one*** on a calendar (monday morning (11 AM), thursday night (6 PM), Friday night (7 PM), saturday morning (7 AM), Sunday morning (7 AM).
