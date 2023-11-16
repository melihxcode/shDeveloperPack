
/* Changes Char Items, it's for changing the game how you like it but you have to know what your doing  */
update a
set CraftName =		case when cast(SUBSTRING(Craftname,1,2) as int) > 30 then '30' else SUBSTRING(Craftname,1,2) end +
					case when cast(SUBSTRING(Craftname,3,2) as int) > 30 then '30' else SUBSTRING(Craftname,3,2) end +
					case when cast(SUBSTRING(Craftname,5,2) as int) > 30 then '30' else SUBSTRING(Craftname,5,2) end +
					case when cast(SUBSTRING(Craftname,7,2) as int) > 30 then '30' else SUBSTRING(Craftname,7,2) end +
					case when cast(SUBSTRING(Craftname,9,2) as int) > 30 then '30' else SUBSTRING(Craftname,9,2) end +
					case when cast(SUBSTRING(Craftname,11,2) as int) > 30 then '30' else SUBSTRING(Craftname,11,2) end +
					case when cast(SUBSTRING(Craftname,13,2) as int) > 30 then '30' else SUBSTRING(Craftname,13,2) end +
					case when cast(SUBSTRING(Craftname,15,2) as int) > 30 then '30' else SUBSTRING(Craftname,15,2) end +
					case when cast(SUBSTRING(Craftname,17,2) as int) > 30 then '30' else SUBSTRING(Craftname,17,2) end +
					SUBSTRING(Craftname,19,2) 
FROM [PS_GameData].[dbo].[CharItems] a
where LEN(Craftname) >= 20

/* Changes Guild Items */
update a
set CraftName =		case when cast(SUBSTRING(Craftname,1,2) as int) > 30 then '30' else SUBSTRING(Craftname,1,2) end +
					case when cast(SUBSTRING(Craftname,3,2) as int) > 30 then '30' else SUBSTRING(Craftname,3,2) end +
					case when cast(SUBSTRING(Craftname,5,2) as int) > 30 then '30' else SUBSTRING(Craftname,5,2) end +
					case when cast(SUBSTRING(Craftname,7,2) as int) > 30 then '30' else SUBSTRING(Craftname,7,2) end +
					case when cast(SUBSTRING(Craftname,9,2) as int) > 30 then '30' else SUBSTRING(Craftname,9,2) end +
					case when cast(SUBSTRING(Craftname,11,2) as int) > 30 then '30' else SUBSTRING(Craftname,11,2) end +
					case when cast(SUBSTRING(Craftname,13,2) as int) > 30 then '30' else SUBSTRING(Craftname,13,2) end +
					case when cast(SUBSTRING(Craftname,15,2) as int) > 30 then '30' else SUBSTRING(Craftname,15,2) end +
					case when cast(SUBSTRING(Craftname,17,2) as int) > 30 then '30' else SUBSTRING(Craftname,17,2) end +
					SUBSTRING(Craftname,19,2) 
FROM [PS_GameData].[dbo].[GuildStoredItems] a
where LEN(Craftname) >= 20

/* Changes Warehouse Items */
update a
set CraftName =		case when cast(SUBSTRING(Craftname,1,2) as int) > 30 then '30' else SUBSTRING(Craftname,1,2) end +
					case when cast(SUBSTRING(Craftname,3,2) as int) > 30 then '30' else SUBSTRING(Craftname,3,2) end +
					case when cast(SUBSTRING(Craftname,5,2) as int) > 30 then '30' else SUBSTRING(Craftname,5,2) end +
					case when cast(SUBSTRING(Craftname,7,2) as int) > 30 then '30' else SUBSTRING(Craftname,7,2) end +
					case when cast(SUBSTRING(Craftname,9,2) as int) > 30 then '30' else SUBSTRING(Craftname,9,2) end +
					case when cast(SUBSTRING(Craftname,11,2) as int) > 30 then '30' else SUBSTRING(Craftname,11,2) end +
					case when cast(SUBSTRING(Craftname,13,2) as int) > 30 then '30' else SUBSTRING(Craftname,13,2) end +
					case when cast(SUBSTRING(Craftname,15,2) as int) > 30 then '30' else SUBSTRING(Craftname,15,2) end +
					case when cast(SUBSTRING(Craftname,17,2) as int) > 30 then '30' else SUBSTRING(Craftname,17,2) end +
					SUBSTRING(Craftname,19,2) 
FROM [PS_GameData].[dbo].[UserStoredItems] a
where LEN(Craftname) >= 20


/* Changes Warehouse Items */
update a
set CraftName =		case when cast(SUBSTRING(Craftname,1,2) as int) > 30 then '30' else SUBSTRING(Craftname,1,2) end +
					case when cast(SUBSTRING(Craftname,3,2) as int) > 30 then '30' else SUBSTRING(Craftname,3,2) end +
					case when cast(SUBSTRING(Craftname,5,2) as int) > 30 then '30' else SUBSTRING(Craftname,5,2) end +
					case when cast(SUBSTRING(Craftname,7,2) as int) > 30 then '30' else SUBSTRING(Craftname,7,2) end +
					case when cast(SUBSTRING(Craftname,9,2) as int) > 30 then '30' else SUBSTRING(Craftname,9,2) end +
					case when cast(SUBSTRING(Craftname,11,2) as int) > 30 then '30' else SUBSTRING(Craftname,11,2) end +
					case when cast(SUBSTRING(Craftname,13,2) as int) > 30 then '30' else SUBSTRING(Craftname,13,2) end +
					case when cast(SUBSTRING(Craftname,15,2) as int) > 30 then '30' else SUBSTRING(Craftname,15,2) end +
					case when cast(SUBSTRING(Craftname,17,2) as int) > 30 then '30' else SUBSTRING(Craftname,17,2) end +
					SUBSTRING(Craftname,19,2) 
FROM [PS_GameData].dbo.MarketCharResultMoney a
where LEN(Craftname) >= 20


/* Changes Warehouse Items */
update a
set CraftName =		case when cast(SUBSTRING(Craftname,1,2) as int) > 30 then '30' else SUBSTRING(Craftname,1,2) end +
					case when cast(SUBSTRING(Craftname,3,2) as int) > 30 then '30' else SUBSTRING(Craftname,3,2) end +
					case when cast(SUBSTRING(Craftname,5,2) as int) > 30 then '30' else SUBSTRING(Craftname,5,2) end +
					case when cast(SUBSTRING(Craftname,7,2) as int) > 30 then '30' else SUBSTRING(Craftname,7,2) end +
					case when cast(SUBSTRING(Craftname,9,2) as int) > 30 then '30' else SUBSTRING(Craftname,9,2) end +
					case when cast(SUBSTRING(Craftname,11,2) as int) > 30 then '30' else SUBSTRING(Craftname,11,2) end +
					case when cast(SUBSTRING(Craftname,13,2) as int) > 30 then '30' else SUBSTRING(Craftname,13,2) end +
					case when cast(SUBSTRING(Craftname,15,2) as int) > 30 then '30' else SUBSTRING(Craftname,15,2) end +
					case when cast(SUBSTRING(Craftname,17,2) as int) > 30 then '30' else SUBSTRING(Craftname,17,2) end +
					SUBSTRING(Craftname,19,2) 
FROM [PS_GameData].[dbo].MarketCharResultMoney_DelLog a
where LEN(Craftname) >= 20



/* Changes Warehouse Items */
update a
set CraftName =		case when cast(SUBSTRING(Craftname,1,2) as int) > 30 then '30' else SUBSTRING(Craftname,1,2) end +
					case when cast(SUBSTRING(Craftname,3,2) as int) > 30 then '30' else SUBSTRING(Craftname,3,2) end +
					case when cast(SUBSTRING(Craftname,5,2) as int) > 30 then '30' else SUBSTRING(Craftname,5,2) end +
					case when cast(SUBSTRING(Craftname,7,2) as int) > 30 then '30' else SUBSTRING(Craftname,7,2) end +
					case when cast(SUBSTRING(Craftname,9,2) as int) > 30 then '30' else SUBSTRING(Craftname,9,2) end +
					case when cast(SUBSTRING(Craftname,11,2) as int) > 30 then '30' else SUBSTRING(Craftname,11,2) end +
					case when cast(SUBSTRING(Craftname,13,2) as int) > 30 then '30' else SUBSTRING(Craftname,13,2) end +
					case when cast(SUBSTRING(Craftname,15,2) as int) > 30 then '30' else SUBSTRING(Craftname,15,2) end +
					case when cast(SUBSTRING(Craftname,17,2) as int) > 30 then '30' else SUBSTRING(Craftname,17,2) end +
					SUBSTRING(Craftname,19,2) 
FROM [PS_GameData].[dbo].MarketItems a
where LEN(Craftname) >= 20



/* Changes Warehouse Items */
update a
set CraftName =		case when cast(SUBSTRING(Craftname,1,2) as int) > 30 then '30' else SUBSTRING(Craftname,1,2) end +
					case when cast(SUBSTRING(Craftname,3,2) as int) > 30 then '30' else SUBSTRING(Craftname,3,2) end +
					case when cast(SUBSTRING(Craftname,5,2) as int) > 30 then '30' else SUBSTRING(Craftname,5,2) end +
					case when cast(SUBSTRING(Craftname,7,2) as int) > 30 then '30' else SUBSTRING(Craftname,7,2) end +
					case when cast(SUBSTRING(Craftname,9,2) as int) > 30 then '30' else SUBSTRING(Craftname,9,2) end +
					case when cast(SUBSTRING(Craftname,11,2) as int) > 30 then '30' else SUBSTRING(Craftname,11,2) end +
					case when cast(SUBSTRING(Craftname,13,2) as int) > 30 then '30' else SUBSTRING(Craftname,13,2) end +
					case when cast(SUBSTRING(Craftname,15,2) as int) > 30 then '30' else SUBSTRING(Craftname,15,2) end +
					case when cast(SUBSTRING(Craftname,17,2) as int) > 30 then '30' else SUBSTRING(Craftname,17,2) end +
					SUBSTRING(Craftname,19,2) 
FROM [PS_GameData].dbo.MarketItems_DelLog a
where LEN(Craftname) >= 20


