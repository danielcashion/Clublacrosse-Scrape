# Welcome to our data scraping folder!
What we have here are two folders that we use:
1 - Tournaments and
2 - Tourneymachine

<img src="https://miscdatacash.s3.us-east-2.amazonaws.com/awsTMdatatables.png" alt="Data Tables" width="250" height="350">

## "Tournaments" - Step 1
From within the spiders folder (Tournaments\Tournaments\Spiders), you will see TournamentExtractor.py. When at the parent folder (the first Tournaments), if once runs from an anaconda prompt (*logged in as an administrator) "scrapy crawl TournamentExtractor -a start=YYYYMMDD -a end=YYYYMMDD", we will scrape the events from our api endpoint and store them in our "public_events" database.

From there, we determine if we want to scrape this event's details via setting a boolean flag "is_active" in the table to 1.

## "TMachineExtractor" - Step 2
This scraper queries the table from the first query for the resulting endpoint and scrapes those pages. It inserts data into two separate tables, one for game details and the other for locations of those games.

## Scheduling (All times Eastern Time (USA)
This scraping give us our  ***events schedule***. 
What we would like to do is scrape the endpoints from ***Step One*** on a calendar 
1. Monday morning (10 AM)
1. Thursday night (4 PM)

This scraping give us our ***game schedules and results***. 
What we would like to do is scrape the endpoints from ***Step Two*** on a calendar 
1. Monday morning (11 AM)
1. Thursday night (6 PM)
1. Friday night (7 PM)
1. Saturday morning (7 AM)
1. Sunday morning (7 AM). 

We will also want to get the results from the games, which is more of an hourly scrape if the given event is that day.

## ScrapyingHub.com
We would like to employ scrapingweb or crawlera so that we can log into a site and view status, change parameters, etc. 

Our organization has an account on scrapinghub.com. This is where the spider needs to reside.



