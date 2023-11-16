SELECT 
	UserUID
	,i.ItemID
	,i.ItemName
	,SUM(ci.Count)	as 'TotalCountOfItem'
--	select *
FROM [PS_GameData].[dbo].[UserStoredItems] ci with (nolock)
	inner join [PS_GameDefs].[dbo].[Items] i with (nolock)
		on i.ItemID = ci.ItemID
where 
	i.ItemName like '%Ventus Alea Guild Goldbar%' -- Insert part of item name here 
group by 
	UserUID
	,i.ItemID
	,i.ItemName
order by 
	i.ItemName asc, TotalCountOfItem desc --, c.UserID asc, c.CharName asc