select * from [stg].[NLFChampionshipData]


/* GET RID OF FINAL TOURNEY RANKINGS */
	update [stg].[NLFChampionshipData] SET hometeam = SUBSTRING(hometeam,(charindex( '] ',hometeam)+2),len(hometeam))
	where hometeam like '%]%'
	update [stg].[NLFChampionshipData] SET awayteam = SUBSTRING(awayteam,(charindex( '] ',awayteam)+2),len(awayteam))
	where awayteam like '%]%'

/* 2023s */
	update [stg].[NLFChampionshipData] SET hometeam = REPLACE(hometeam,'2023 ','') -- WHEN IT IS IN THE MIDDLE OF A STRING
	where hometeam like '%2023 %'
	update [stg].[NLFChampionshipData] SET hometeam = REPLACE(hometeam,' 2023','') -- FOR WHEN IT ENDS THE STRING
	where hometeam like '% 2023%'
	update [stg].[NLFChampionshipData] SET awayteam = REPLACE(awayteam,'2023 ','') -- WHEN IT IS IN THE MIDDLE OF A STRING
	where awayteam like '%2023 %'
	update [stg].[NLFChampionshipData] SET awayteam = REPLACE(awayteam,' 2023','') -- FOR WHEN IT ENDS THE STRING
	where awayteam like '% 2023%'

/* 2022s */
	update [stg].[NLFChampionshipData] SET hometeam = REPLACE(hometeam,'2022 ','') -- WHEN IT IS IN THE MIDDLE OF A STRING
	where hometeam like '%2022 %'
	update [stg].[NLFChampionshipData] SET hometeam = REPLACE(hometeam,' 2022','') -- FOR WHEN IT ENDS THE STRING
	where hometeam like '% 2022%'
	update [stg].[NLFChampionshipData] SET awayteam = REPLACE(awayteam,'2022 ','') -- WHEN IT IS IN THE MIDDLE OF A STRING
	where awayteam like '%2022 %'
	update [stg].[NLFChampionshipData] SET awayteam = REPLACE(awayteam,' 2022','') -- FOR WHEN IT ENDS THE STRING
	where awayteam like '% 2022%'


/* 2021s */
	update [stg].[NLFChampionshipData] SET hometeam = REPLACE(hometeam,'2021 ','') -- WHEN IT IS IN THE MIDDLE OF A STRING
	where hometeam like '%2021 %'
	update [stg].[NLFChampionshipData] SET hometeam = REPLACE(hometeam,' 2021','') -- FOR WHEN IT ENDS THE STRING
	where hometeam like '% 2021%'
	update [stg].[NLFChampionshipData] SET awayteam = REPLACE(awayteam,'2021 ','') -- WHEN IT IS IN THE MIDDLE OF A STRING
	where awayteam like '%2021 %'
	update [stg].[NLFChampionshipData] SET awayteam = REPLACE(awayteam,' 2021','') -- FOR WHEN IT ENDS THE STRING
	where awayteam like '% 2021%'

/* 2020s */
	update [stg].[NLFChampionshipData] SET hometeam = REPLACE(hometeam,'2020 ','') -- WHEN IT IS IN THE MIDDLE OF A STRING
	where hometeam like '%2020 %'
	update [stg].[NLFChampionshipData] SET hometeam = REPLACE(hometeam,' 2020','') -- FOR WHEN IT ENDS THE STRING
	where hometeam like '% 2020%'
	update [stg].[NLFChampionshipData] SET awayteam = REPLACE(awayteam,'2020 ','') -- WHEN IT IS IN THE MIDDLE OF A STRING
	where awayteam like '%2020 %'
	update [stg].[NLFChampionshipData] SET awayteam = REPLACE(awayteam,' 2020','') -- FOR WHEN IT ENDS THE STRING
	where awayteam like '% 2020%'

/* 2019s */
	update [stg].[NLFChampionshipData] SET hometeam = REPLACE(hometeam,'2019 ','') -- WHEN IT IS IN THE MIDDLE OF A STRING
	where hometeam like '%2019 %'
	update [stg].[NLFChampionshipData] SET hometeam = REPLACE(hometeam,' 2019','') -- FOR WHEN IT ENDS THE STRING
	where hometeam like '% 2019%'
	update [stg].[NLFChampionshipData] SET awayteam = REPLACE(awayteam,'2019 ','') -- WHEN IT IS IN THE MIDDLE OF A STRING
	where awayteam like '%2019 %'
	update [stg].[NLFChampionshipData] SET awayteam = REPLACE(awayteam,' 2019','') -- FOR WHEN IT ENDS THE STRING
	where awayteam like '% 2019%'


/* CLUB SPECIFIC NAMING INCONSISTENCIES */
DECLARE @teamname VARCHAR(50), @newname VARCHAR(50)
SET		@teamname = 'Virginia LC'
SET		@newname = 'VLC'
UPDATE [stg].[NLFChampionshipData] set hometeam = @newname where hometeam = @oldname
UPDATE [stg].[NLFChampionshipData] set awayteam = @newname where awayteam = @oldname


DECLARE @teamname VARCHAR(50), @newname VARCHAR(50)
SET		@teamname = 'MESA'
SET		@newname = 'Mesa Fresh Elite'
UPDATE [stg].[NLFChampionshipData] set hometeam = @newname where hometeam = @oldname
UPDATE [stg].[NLFChampionshipData] set awayteam = @newname where awayteam = @oldname


DECLARE @teamname VARCHAR(50), @newname VARCHAR(50)
SET		@teamname = 'Madlax DC Dogs'
SET		@newname = 'Madlax Capitol'
UPDATE [stg].[NLFChampionshipData] set hometeam = @newname where hometeam = @oldname
UPDATE [stg].[NLFChampionshipData] set awayteam = @newname where awayteam = @oldname

DECLARE @oldname VARCHAR(50), @newname VARCHAR(50)
SET		@oldname = 'LI Express Wieczorek'
SET		@newname = 'LI Express Weiczorek'
UPDATE [stg].[NLFChampionshipData] set hometeam = @newname where hometeam = @oldname
UPDATE [stg].[NLFChampionshipData] set awayteam = @newname where awayteam = @oldname

DECLARE @oldname VARCHAR(50), @newname VARCHAR(50)
SET		@oldname = 'Leading Edge'
SET		@newname = 'Leading Edge Elite'
UPDATE [stg].[NLFChampionshipData] set hometeam = @newname where hometeam = @oldname
UPDATE [stg].[NLFChampionshipData] set awayteam = @newname where awayteam = @oldname

DECLARE @oldname VARCHAR(50), @newname VARCHAR(50)
SET		@oldname = 'HHH'
SET		@newname = 'Big 4 HHH'
UPDATE [stg].[NLFChampionshipData] set hometeam = @newname where hometeam = @oldname
UPDATE [stg].[NLFChampionshipData] set awayteam = @newname where awayteam = @oldname





select * from [stg].[NLFChampionshipData] 
order by tournament, year,hometeam, awayteam

update [stg].[NLFChampionshipData]  set tournament = '2018 NLF Summer Championship'
where tournament = '2018 NLF Championship'

/* STEP 1, GET UNIQUE LIST OF TOURNEYS, YEARS, AND TEAMS */
;WITH CTE AS (
SELECT tournament, [year], hometeam as team FROM [stg].[NLFChampionshipData]
UNION 
SELECT tournament, [year], awayteam as team FROM [stg].[NLFChampionshipData]
) SELECT DISTINCT tournament, [year], team 
INTO #teamList
FROM CTE

select *,  from [stg].[NLFChampionshipData] 

SELECT tournament, year, hometeam, 
			CASE	WHEN homescore > awayscore THEN 1 ELSE 0 END as homewin,
			CASE	WHEN homescore < awayscore THEN 1 ELSE 0 END as homeloss,
			CASE	WHEN homescore < awayscore THEN 1 ELSE 0 END as awaywin,
			CASE	WHEN homescore > awayscore THEN 1 ELSE 0 END as awayloss,
			CASE	WHEN homescore = awayscore THEN 1 ELSE 0 END as hometie,
			CASE	WHEN homescore = awayscore THEN 1 ELSE 0 END as awaytie
				 from [stg].[NLFChampionshipData] 
				 ORDER BY Tournament, year, hometeam

select *, CAST([time] AS TIME) from [stg].[NLFChampionshipData]

CREATE VIEW v_nlf_tournament_data
AS
/*
THIS COULD BE LONGER TERM, BUT I THINK IT MIGHT BE A STOP GAP MEASURE TABLE */
SELECT		tournament, 
			[year], 
			CAST(SUBSTRING([date],CHARINDEX(',',[date],1)+2,len([date])) AS DATE) AS event_date, 
			GameNum, 
			CAST([time] AS TIME) as event_time, 
			[location], 
			hometeam, 
			homescore, 
			awayscore, 
			awayteam,
			CASE	WHEN homescore > awayscore THEN 1 ELSE 0 END as homewin,
			CASE	WHEN homescore < awayscore THEN 1 ELSE 0 END as homeloss,
			CASE	WHEN homescore < awayscore THEN 1 ELSE 0 END as awaywin,
			CASE	WHEN homescore > awayscore THEN 1 ELSE 0 END as awayloss,
			CASE	WHEN homescore = awayscore THEN 1 ELSE 0 END as tie
		FROM [stg].[NLFChampionshipData] 

		select * FROM v_nlf_tournament_data 
		where 1=1
		AND (hometeam = 'Leading Edge Elite' or awayteam = 'Leading Edge Elite')
		and tournament = '2016 NLF Summer Championship'
		and year = '2023AA'
		ORDER BY event_date

ALTER VIEW v_six_event_rolling_nlf 
AS
WITH NewCTE AS (

SELECT	--tournament, 
			[year], hometeam as team, [event_date], event_time, sum(homewin) as wins, sum(homeloss) as loss, sum(tie) as tie 
FROM v_nlf_tournament_data
WHERE 1=1
		--AND tournament = '2017 NLF Summer Championship'
	--	and (hometeam = 'Team 91 Orange')
	--	and year = '2019AA'
GROUP BY --tournament, 
		[year], hometeam, [event_date], event_time
--ORDER BY 1,2,3
UNION
SELECT	--tournament, 
			[year], awayteam as team, [event_date], event_time, SUM(awaywin) as wins, SUM(awayloss) as loss, 0 as tie 
FROM v_nlf_tournament_data
WHERE 1=1
	--	AND tournament = '2017 NLF Summer Championship'
	--	and (awayteam = 'Team 91 Orange')
	--	and year = '2019AA'
GROUP BY --tournament, 
[year], awayteam, [event_date], event_time


) select *, 
/* THIS IS WHERE THIS SHOULD BE PARAMETERS, BUT TSQL DOES NOT ALLOW */
SUM(wins) OVER (PARTITION BY [year], team ORDER BY [year], team, event_date, event_time ROWS 50 PRECEDING) AS cum_wins,
SUM(loss) OVER (PARTITION BY [year], team ORDER BY [year], team, event_date, event_time ROWS 50 PRECEDING) AS cum_loss

FROM newCTE 
ORDER BY team, [year], [event_date]

SELECT		[year], 
			team, 
			event_date, 
			event_time, 
			wins, 
			loss, 
			tie, 
			cum_wins, 
			cum_loss, 
			ROUND(CAST(cum_wins AS FLOAT)/ CAST((cum_wins + cum_loss) AS FLOAT),2) as WP 
--into #temp
from v_six_event_rolling_nlf			-- SELECT * FROM v_six_event_rolling_nlf
										-- SELECT * FROM v_nlf_tournament_data
where 1=1
AND team = 'LI Express Weiczorek'
order by 1,2,3
-- Next add in OP, and OOP COlUMNS


select t.*, vnlf. *
from #temp t
join v_six_event_rolling_nlf vnlf
on	t.[year] = vnlf.[year]
AND	t.team = vnlf.team
AND t.event_date = vnlf.event_date
AND t.event_time = vnlf.event_time





