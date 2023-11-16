SELECT 
	c.GuildID
	,c.GuildName
	,i.ItemID
	,i.ItemName
	,SUM(ci.Count)	as 'TotalCountOfItem'
--	select *
FROM [PS_GameData].[dbo].[GuildStoredItems] ci with (nolock)
	inner join [PS_GameData].[dbo].[Guilds] c with (nolock)
		on c.GuildID = ci.GuildID
	inner join [PS_GameDefs].[dbo].[Items] i with (nolock)
		on i.ItemID = ci.ItemID
where 
	i.ItemName like '%Ventus Alea Guild Goldbar%' -- Insert part of item name here 
group by 
	c.GuildID
	,c.GuildName
	,i.ItemID
	,i.ItemName
order by 
	i.ItemName asc, TotalCountOfItem desc, GuildName asc