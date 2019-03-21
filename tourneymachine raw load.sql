INSERT INTO [stg].[tourney_machine_cleaned]
           ([keyword],[title]
           ,[date],[location]
		   ,[icon],[link])
SELECT		[keyword],[title]
           ,[date],[location]
		   ,[icon],[link] FROM [stg].[tourneymachine_rawload]
		   GO



UPDATE [stg].[tourney_machine_cleaned] SET keyword = SUBSTRING(keyword,1,(CHARINDEX('ƒ?',keyword,1)-2)) WHERE CHARINDEX('ƒ?',keyword) > 0

/* START THE TRIMMING PROCESS */
update [stg].[tourney_machine_cleaned] SET keyword = TRIM(keyword), title = TRIM(title), [date] = TRIM([date]), [location] = TRIM([location]), icon = TRIM(icon), link = TRIM(link)
DELETE FROM [stg].[tourney_machine_cleaned] WHERE keyword LIKE '%cancelled%'
DELETE FROM [stg].[tourney_machine_cleaned] WHERE keyword LIKE '%template%'
DELETE FROM [stg].[tourney_machine_cleaned] WHERE keyword LIKE '%practice%'
DELETE FROM [stg].[tourney_machine_cleaned] WHERE keyword LIKE '% test %'

UPDATE [stg].[tourney_machine_cleaned] set keyword = SUBSTRING(keyword,1,(CHARINDEX(' dec ',keyword,1)-1)) WHERE keyword like '% jan %'
UPDATE [stg].[tourney_machine_cleaned] set keyword = SUBSTRING(keyword,1,(CHARINDEX(' dec ',keyword,1)-1)) WHERE keyword like '% feb %'
UPDATE [stg].[tourney_machine_cleaned] set keyword = SUBSTRING(keyword,1,(CHARINDEX(' dec ',keyword,1)-1)) WHERE keyword like '% mar %'
UPDATE [stg].[tourney_machine_cleaned] set keyword = SUBSTRING(keyword,1,(CHARINDEX(' dec ',keyword,1)-1)) WHERE keyword like '% apr %'
UPDATE [stg].[tourney_machine_cleaned] set keyword = SUBSTRING(keyword,1,(CHARINDEX(' dec ',keyword,1)-1)) WHERE keyword like '% may %'
UPDATE [stg].[tourney_machine_cleaned] set keyword = SUBSTRING(keyword,1,(CHARINDEX(' dec ',keyword,1)-1)) WHERE keyword like '% jun %'
UPDATE [stg].[tourney_machine_cleaned] set keyword = SUBSTRING(keyword,1,(CHARINDEX(' dec ',keyword,1)-1)) WHERE keyword like '% jul %'
UPDATE [stg].[tourney_machine_cleaned] set keyword = SUBSTRING(keyword,1,(CHARINDEX(' dec ',keyword,1)-1)) WHERE keyword like '% aug %'
UPDATE [stg].[tourney_machine_cleaned] set keyword = SUBSTRING(keyword,1,(CHARINDEX(' dec ',keyword,1)-1)) WHERE keyword like '% sep %'
UPDATE [stg].[tourney_machine_cleaned] set keyword = SUBSTRING(keyword,1,(CHARINDEX(' dec ',keyword,1)-1)) WHERE keyword like '% oct %'
UPDATE [stg].[tourney_machine_cleaned] set keyword = SUBSTRING(keyword,1,(CHARINDEX(' dec ',keyword,1)-1)) WHERE keyword like '% nov %'
UPDATE [stg].[tourney_machine_cleaned] set keyword = SUBSTRING(keyword,1,(CHARINDEX(' dec ',keyword,1)-1)) WHERE keyword like '% dec %'







