# -*- coding: utf-8 -*-
import json
import re
import scrapy
from scrapy.cmdline import execute
from scrapy.exceptions import CloseSpider
from Tournaments.items import TournamentsItem, TournamentsLocationItem
from Tournaments.spiders import paths
from datetime import datetime


class TournamentextractorSpider(scrapy.Spider):
    name = 'TournamentExtractor'
    allowed_domains = ['tourneymachine.com']
    start_urls = []

    def __init__(self, name=None, start=None, end=None, **kwargs):
        super().__init__(name, **kwargs)
        if start and end:
            self.start_date = f"{start[0:4]}-{start[4:6]}-{start[6:8]}"
            self.end_date = f"{end[0:4]}-{end[4:6]}-{end[6:8]}"
        else:
            ''' Error for start and end date'''
            print("No start date or end date provided...\nplease input start date and end date")
            print("you can pass dates by following way")
            print("eg. scrapy crawl TournamentExtractor -a start=YYYYMMDD -a end=YYYYMMDD")
            exit(0)

    def start_requests(self):

        # cities = ['New York City,NY','Los Angeles,CA','Chicago,IL','Houston,TX','Phoenix,AZ','Philadelphia,PA','San Antonio,TX','San Diego,CA','Dallas,TX','San Jose,CA','Austin,TX','Jacksonville,FL','San Francisco,CA','Columbus,OH','Fort Worth,TX','Indianapolis,IN','Charlotte,NC','Seattle,WA','Denver,CO','Washington,DC','Boston,MA','El Paso,TX','Detroit,MI','Nashville,TN','Memphis,TN','Portland,OR','Oklahoma City,OK','Las Vegas,NV','Louisville,KY','Baltimore,MD','Milwaukee,WI','Albuquerque,NM','Tucson,AZ','Fresno,CA','Sacramento,CA','Mesa,AZ','Kansas City,MO','Atlanta,GA','Long Beach,CA','Omaha,NE','Raleigh,NC','Colorado Springs,CO','Miami,FL','Virginia Beach,VA','Oakland,CA','Minneapolis,MN','Tulsa,OK','Arlington,TX','New Orleans,LA','Wichita,KS','Cleveland,OH','Tampa,FL','Bakersfield,CA','Aurora,CO','Anaheim,CA','Honolulu,HI','Santa Ana,CA','Riverside,CA','Corpus Christi,TX','Lexington,KY','Stockton,CA','St. Louis,MO','Saint Paul,MN','Henderson,NV','Pittsburgh,PA','Cincinnati,OH','Anchorage,AK','Greensboro,NC','Plano,TX','Newark,NJ','Lincoln,NE','Orlando,FL','Irvine,CA','Toledo,OH','Jersey City,NJ','Chula Vista,CA','Durham,NC','Fort Wayne,IN','St. Petersburg,FL','Laredo,TX','Buffalo,NY','Madison,WI','Lubbock,TX','Chandler,AZ','Scottsdale,AZ','Reno,NV','Glendale,AZ','Norfolk,VA','Winston–Salem,NC','North Las Vegas,NV','Gilbert,AZ','Chesapeake,VA','Irving,TX','Hialeah,FL','Garland,TX','Fremont,CA','Richmond,VA','Boise,ID','Baton Rouge,LA','Des Moines,IA','Spokane,WA','San Bernardino,CA','Modesto,CA','Tacoma,WA','Fontana,CA','Santa Clarita,CA','Birmingham,AL','Oxnard,CA','Fayetteville,NC','Rochester,NY','Moreno Valley,CA','Glendale,CA','Yonkers,NY','Huntington Beach,CA','Aurora,IL','Salt Lake City,UT','Amarillo,TX','Montgomery,AL','Grand Rapids,MI','Little Rock,AR','Akron,OH','Augusta,GA','Huntsville,AL','Columbus,GA','Grand Prairie,TX','Shreveport,LA','Overland Park,KS','Tallahassee,FL','Mobile,AL','Port St. Lucie,FL','Knoxville,TN','Worcester,MA','Tempe,AZ','Cape Coral,FL','Brownsville,TX','McKinney,TX','Providence,RI','Fort Lauderdale,FL','Newport News,VA','Chattanooga,TN','Rancho Cucamonga,CA','Frisco,TX','Sioux Falls,SD','Oceanside,CA','Ontario,CA','Vancouver,WA','Santa Rosa,CA','Garden Grove,CA','Elk Grove,CA','Pembroke Pines,FL','Salem,OR','Eugene,OR','Peoria,AZ','Corona,CA','Springfield,MO','Jackson,MS','Cary,NC','Fort Collins,CO','Hayward,CA','Lancaster,CA','Alexandria,VA','Salinas,CA','Palmdale,CA','Lakewood,CO','Springfield,MA','Sunnyvale,CA','Hollywood,FL','Pasadena,TX','Clarksville,TN','Pomona,CA','Kansas City,KS','Macon,GA','Escondido,CA','Paterson,NJ','Joliet,IL','Naperville,IL','Rockford,IL','Torrance,CA','Bridgeport,CT','Savannah,GA','Killeen,TX','Bellevue,WA','Mesquite,TX','Syracuse,NY','McAllen,TX','Pasadena,CA','Orange,CA','Fullerton,CA','Dayton,OH','Miramar,FL','Olathe,KS','Thornton,CO','Waco,TX','Murfreesboro,TN','Denton,TX','West Valley City,UT','Midland,TX','Carrollton,TX','Roseville,CA','Warren,MI','Charleston,SC','Hampton,VA','Surprise,AZ','Columbia,SC','Coral Springs,FL','Visalia,CA','Sterling Heights,MI','Gainesville,FL','Cedar Rapids,IA','New Haven,CT','Stamford,CT','Elizabeth,NJ','Concord,CA','Thousand Oaks,CA','Kent,WA','Santa Clara,CA','Simi Valley,CA','Lafayette,LA','Topeka,KS','Athens,GA','Round Rock,TX','Hartford,CT','Norman,OK','Victorville,CA','Fargo,ND','Berkeley,CA','Vallejo,CA','Abilene,TX','Columbia,MO','Ann Arbor,MI','Allentown,PA','Pearland,TX','Beaumont,TX','Wilmington,NC','Evansville,IN','Arvada,CO','Provo,UT','Independence,MO','Lansing,MI','Odessa,TX','Richardson,TX','Fairfield,CA','El Monte,CA','Rochester,MN','Clearwater,FL','Carlsbad,CA','Springfield,IL','Temecula,CA','West Jordan,UT','Costa Mesa,CA','Miami Gardens,FL','Cambridge,MA','College Station,TX','Murrieta,CA','Downey,CA','Peoria,IL','Westminster,CO','Elgin,IL','Antioch,CA','Palm Bay,FL','High Point,NC','Lowell,MA','Manchester,NH','Pueblo,CO','Gresham,OR','North Charleston,SC','Ventura,CA','Inglewood,CA','Pompano Beach,FL','Centennial,CO','West Palm Beach,FL','Everett,WA','Richmond,CA','Clovis,CA','Billings,MT','Waterbury,CT','Broken Arrow,OK','Lakeland,FL','West Covina,CA','Boulder,CO','Daly City,CA','Santa Maria,CA','Hillsboro,OR','Sandy Springs,GA','Norwalk,CA','Jurupa Valley,CA','Lewisville,TX','Greeley,CO','Davie,FL','Green Bay,WI','Tyler,TX','League City,TX','Burbank,CA','San Mateo,CA','Wichita Falls,TX','El Cajon,CA','Rialto,CA','Lakewood,NJ','Edison,NJ','Davenport,IA','South Bend,IN','Woodbridge,NJ','Las Cruces,NM','Vista,CA','Renton,WA','Sparks,NV','Clinton,MI','Allen,TX','Tuscaloosa,AL','San Angelo,TX','Vacaville,CA']

        city = ['New York City','Los Angeles','Chicago','Houston','Phoenix','Philadelphia','San Antonio','San Diego','Dallas','San Jose','Austin','Jacksonville','San Francisco','Columbus','Fort Worth','Indianapolis','Charlotte','Seattle','Denver','Washington','Boston','El Paso','Detroit','Nashville','Memphis','Portland','Oklahoma City','Las Vegas','Louisville','Baltimore','Milwaukee','Albuquerque','Tucson','Fresno','Sacramento','Mesa','Kansas City','Atlanta','Long Beach','Omaha','Raleigh','Colorado Springs','Miami','Virginia Beach','Oakland','Minneapolis','Tulsa','Arlington','New Orleans','Wichita','Cleveland','Tampa','Bakersfield','Aurora','Anaheim','Honolulu','Santa Ana','Riverside','Corpus Christi','Lexington','Stockton','St. Louis','Saint Paul','Henderson','Pittsburgh','Cincinnati','Anchorage','Greensboro','Plano','Newark','Lincoln','Orlando','Irvine','Toledo','Jersey City','Chula Vista','Durham','Fort Wayne','St. Petersburg','Laredo','Buffalo','Madison','Lubbock','Chandler','Scottsdale','Reno','Glendale','Norfolk','Winston–Salem','North Las Vegas','Gilbert','Chesapeake','Irving','Hialeah','Garland','Fremont','Richmond','Boise','Baton Rouge','Des Moines','Spokane','San Bernardino','Modesto','Tacoma','Fontana','Santa Clarita','Birmingham','Oxnard','Fayetteville','Rochester','Moreno Valley','Glendale','Yonkers','Huntington Beach','Aurora','Salt Lake City','Amarillo','Montgomery','Grand Rapids','Little Rock','Akron','Augusta','Huntsville','Columbus','Grand Prairie','Shreveport','Overland Park','Tallahassee','Mobile','Port St. Lucie','Knoxville','Worcester','Tempe','Cape Coral','Brownsville','McKinney','Providence','Fort Lauderdale','Newport News','Chattanooga','Rancho Cucamonga','Frisco','Sioux Falls','Oceanside','Ontario','Vancouver','Santa Rosa','Garden Grove','Elk Grove','Pembroke Pines','Salem','Eugene','Peoria','Corona','Springfield','Jackson','Cary','Fort Collins','Hayward','Lancaster','Alexandria','Salinas','Palmdale','Lakewood','Springfield','Sunnyvale','Hollywood','Pasadena','Clarksville','Pomona','Kansas City','Macon','Escondido','Paterson','Joliet','Naperville','Rockford','Torrance','Bridgeport','Savannah','Killeen','Bellevue','Mesquite','Syracuse','McAllen','Pasadena','Orange','Fullerton','Dayton','Miramar','Olathe','Thornton','Waco','Murfreesboro','Denton','West Valley City','Midland','Carrollton','Roseville','Warren','Charleston','Hampton','Surprise','Columbia','Coral Springs','Visalia','Sterling Heights','Gainesville','Cedar Rapids','New Haven','Stamford','Elizabeth','Concord','Thousand Oaks','Kent','Santa Clara','Simi Valley','Lafayette','Topeka','Athens','Round Rock','Hartford','Norman','Victorville','Fargo','Berkeley','Vallejo','Abilene','Columbia','Ann Arbor','Allentown','Pearland','Beaumont','Wilmington','Evansville','Arvada','Provo','Independence','Lansing','Odessa','Richardson','Fairfield','El Monte','Rochester','Clearwater','Carlsbad','Springfield','Temecula','West Jordan','Costa Mesa','Miami Gardens','Cambridge','College Station','Murrieta','Downey','Peoria','Westminster','Elgin','Antioch','Palm Bay','High Point','Lowell','Manchester','Pueblo','Gresham','North Charleston','Ventura','Inglewood','Pompano Beach','Centennial','West Palm Beach','Everett','Richmond','Clovis','Billings','Waterbury','Broken Arrow','Lakeland','West Covina','Boulder','Daly City','Santa Maria','Hillsboro','Sandy Springs','Norwalk','Jurupa Valley','Lewisville','Greeley','Davie','Green Bay','Tyler','League City','Burbank','San Mateo','Wichita Falls','El Cajon','Rialto','Lakewood','Edison','Davenport','South Bend','Woodbridge','Las Cruces','Vista','Renton','Sparks','Clinton','Allen','Tuscaloosa','San Angelo','Vacaville']

        # icons = ['baseball', 'basketball', 'beach volleyball', 'dodgeball', 'field hockey', 'football', 'futsal', 'hockey', 'kickball', 'lacrosse', 'other', 'rugby', 'soccer', 'softball', 'volleyball', 'water polo','']

        icons = ['lacrosse']

        for i in icons:

            url = f'https://tourneymachine.com/Public/Service/json/TournamentSearch.aspx?sport={i}&start={self.start_date}&end={self.end_date}'

            yield scrapy.FormRequest(
                url=url,
                callback=self.getData,
                method='GET',
                meta={
                    'com': i
                }
            )

    def getData(self, response):

        com = response.meta['com']
        file_path = paths.html_path + com + '.html'
        f = open(file_path, 'wb')
        f.write(response.body)
        f.close()

        item = TournamentsItem()
        locationItem = TournamentsLocationItem()

        json_data = json.loads(response.text)
        if json_data != {}:

            for i in json_data:
                item['IDCustomer'] = json_data[i]['IDCustomer']
                item['IDTournament'] = json_data[i]['IDTournament']
                item['Status'] = json_data[i]['Status']
                item['Name'] = json_data[i]['Name']
                item['Sport'] = json_data[i]['Sport']
                item['Logo'] = json_data[i]['Logo']

                if "https://" not in item['Logo']:
                    item['Logo'] = "https:" + item['Logo']

                item['StartDate'] = json_data[i]['StartDate']
                item['EndDate'] = json_data[i]['EndDate']
                item['DisplayLocation'] = json_data[i]['DisplayLocation']
                item['location_dictionary'] = json_data[i]['IDTournament']
                item['is_active_YN'] = "0"
                item['created_by'] = "xbyte"
                item['created_datetime'] = datetime.now()

                for compdata in json_data[i]['ComplexDictionary']:
                    locationItem['location_dictionary'] = json_data[i]['IDTournament']
                    locationItem['IDComplex'] = json_data[i]['ComplexDictionary'][compdata]['IDComplex']
                    locationItem['IDTournament'] = json_data[i]['ComplexDictionary'][compdata]['IDTournament']
                    locationItem['Name'] = json_data[i]['ComplexDictionary'][compdata]['Name']
                    locationItem['Address'] = json_data[i]['ComplexDictionary'][compdata]['Address']
                    locationItem['City'] = json_data[i]['ComplexDictionary'][compdata]['City']
                    locationItem['State'] = str(json_data[i]['ComplexDictionary'][compdata]['State']).upper()
                    locationItem['Zip'] = json_data[i]['ComplexDictionary'][compdata]['Zip']
                    locationItem['Long'] = json_data[i]['ComplexDictionary'][compdata]['Long']
                    locationItem['Lat'] = json_data[i]['ComplexDictionary'][compdata]['Lat']
                    locationItem['Notes'] = json_data[i]['ComplexDictionary'][compdata]['Notes']
                    locationItem['IDFacilities'] = None
                    locationItem['is_active_YN'] = "0"
                    locationItem['created_by'] = "xbyte"
                    locationItem['created_datetime'] = datetime.now()
                    yield locationItem
                yield item


# execute('scrapy crawl TournamentExtractor -a start=20191111 -a end=20191113'.split())
