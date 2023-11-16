SELECT 
	UserUID
	,UserID
	,c.CharID
	,c.CharName
	,i.ItemID
	,i.ItemName
	,SUM(ci.Count)	as 'TotalCountOfItem'
FROM [PS_GameData].[dbo].[CharItems] ci with (nolock)
	inner join [PS_GameDefs].[dbo].[Items] i with (nolock)
		on i.ItemID = ci.ItemID
	inner join [PS_GameData].[dbo].[Chars] c with (nolock)
		on c.CharID = ci.CharID
where 
	i.ItemName like '%Ventus Alea Guild Goldbar%' -- Insert part of item name here 
group by 
	UserUID
	,UserID
	,c.CharID
	,c.CharName
	,i.ItemID
	,i.ItemName
order by 
	i.ItemName asc, TotalCountOfItem desc, c.UserID asc, c.CharName asc