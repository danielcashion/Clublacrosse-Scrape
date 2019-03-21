select * from v_nlf_tournament_data
where (hometeam = 'Leading Edge Elite' or awayteam = 'Leading Edge Elite')
and year = '2023AA'

DROP TABLE IF EXISTS dbo.columnar_nlf_data
create table columnar_nlf_data (
row_num INT IDENTITY(1,1) PRIMARY KEY,
tournament VARCHAR(200) NOT NULL,
[year] VARCHAR(30) NOT NULL,
event_date datetime2 NOT NULL,
event_time TIME NULL,
gameNum VARCHAR(30) NULL,
[location_desc] VARCHAR(100) NULL,
[team] VARCHAR(200) NOT NULL,
opponent VARCHAR(200) NOT NULL,
team_score FLOAT NULL,
opponent_score FLOAT NULL,
score_differential FLOAT NULL,
win INT NULL,
loss INT NULL,
tie INT NULL,
cum_win INT NULL,
cum_loss INT NULL,
cum_tie INT NULL,
rolling_win_pct float NULL
)
 truncate table [dbo].[columnar_nlf_data]

; WITH CTE AS (
select tournament, [year], [event_date],[event_time], [gameNum], [location], hometeam AS team, awayteam, homescore, awayscore, (homescore - awayscore) AS [score_differential], homewin, homeloss, tie
from v_nlf_tournament_data
UNION
select tournament, [year], [event_date],[event_time], [gameNum], [location], awayteam AS team, hometeam, awayscore, homescore, (awayscore - homescore) AS [score_differential], awaywin, awayloss, tie
from v_nlf_tournament_data )
INSERT INTO [dbo].[columnar_nlf_data] ([tournament],[year],[event_date],[event_time],[gameNum],[location_desc], [team],[opponent],[team_score],[opponent_score],[score_differential],[win],[loss],[tie])
SELECT * from CTE
order by [year],[team], [event_date],[event_time]

SELECT		row_num,
			tournament, 
			[year], 
			event_date, 
			event_time, 
			gameNum, 
			[location_desc], 
			[team], 
			opponent, 
			team_score, 
			opponent_score, 
			score_differential, 
			win, 
			loss, 
			tie,
			SUM(win) OVER (PARTITION BY [year], team ORDER BY [year], team, event_date, event_time ROWS 20 PRECEDING) AS cum_wins,
			SUM(loss) OVER (PARTITION BY [year], team ORDER BY [year], team, event_date, event_time ROWS 20 PRECEDING) AS cum_loss,
			SUM(tie) OVER (PARTITION BY [year], team ORDER BY [year], team, event_date, event_time ROWS 20 PRECEDING) AS cum_tie
			into #temp2
 from [dbo].[columnar_nlf_data] 


 select *, ROUND(CAST(cum_wins AS FLOAT)/ CAST((cum_wins + cum_loss) AS FLOAT),2) as WP 
 from #temp2 
 --where team = 'Big 4 HHH' drop table #temp2

alter table [dbo].[columnar_nlf_data] add cum_win INT NULL, cum_loss INT NULL, cum_tie INT NULL, rolling_win_pct float NULL
GO
alter table [dbo].[columnar_nlf_data] add rolling_win_pct float NULL
GO


select * from [dbo].[columnar_nlf_data]