/* Changes Char Items it's for changing the game how you like it but you have to know what your doing  */
update a
set	a.Gem1 = case when a.Gem1 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' ) then 0 else a.Gem1 end
	,a.Gem2 = case when a.Gem2 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' ) then 0 else a.Gem2 end
	,a.Gem3 = case when a.Gem3 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' ) then 0 else a.Gem3 end
	,a.Gem4 = case when a.Gem4 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' ) then 0 else a.Gem4 end
	,a.Gem5 = case when a.Gem5 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' ) then 0 else a.Gem5 end
	,a.Gem6 = case when a.Gem6 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' ) then 0 else a.Gem6 end
-- select *
FROM [PS_GameData].[dbo].[CharItems] a
where 
	ItemID in	(	SELECT ItemID from [PS_GameDefs].[dbo].[Items] i where i.Type in ('19','34') )
	and 
	(	Gem1 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' )
	or Gem2 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' )
	or Gem3 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' )
	or Gem4 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' )
	or Gem5 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' )
	or Gem6 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' )
	)


update a
set	a.Gem1 = case when a.Gem1 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' ) then 0 else a.Gem1 end
	,a.Gem2 = case when a.Gem2 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' ) then 0 else a.Gem2 end
	,a.Gem3 = case when a.Gem3 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' ) then 0 else a.Gem3 end
	,a.Gem4 = case when a.Gem4 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' ) then 0 else a.Gem4 end
	,a.Gem5 = case when a.Gem5 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' ) then 0 else a.Gem5 end
	,a.Gem6 = case when a.Gem6 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' ) then 0 else a.Gem6 end
-- select *
FROM [PS_GameData].[dbo].[GuildStoredItems] a
where 
	ItemID in	(	SELECT ItemID from [PS_GameDefs].[dbo].[Items] i where i.Type in ('19','34') )
	and 
	(	Gem1 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' )
	or Gem2 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' )
	or Gem3 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' )
	or Gem4 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' )
	or Gem5 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' )
	or Gem6 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' )
	)


update a
set	a.Gem1 = case when a.Gem1 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' ) then 0 else a.Gem1 end
	,a.Gem2 = case when a.Gem2 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' ) then 0 else a.Gem2 end
	,a.Gem3 = case when a.Gem3 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' ) then 0 else a.Gem3 end
	,a.Gem4 = case when a.Gem4 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' ) then 0 else a.Gem4 end
	,a.Gem5 = case when a.Gem5 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' ) then 0 else a.Gem5 end
	,a.Gem6 = case when a.Gem6 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' ) then 0 else a.Gem6 end
-- select *
FROM [PS_GameData].[dbo].[UserStoredItems] a
where 
	ItemID in	(	SELECT ItemID from [PS_GameDefs].[dbo].[Items] i where i.Type in ('19','34') )
	and 
	(	Gem1 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' )
	or Gem2 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' )
	or Gem3 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' )
	or Gem4 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' )
	or Gem5 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' )
	or Gem6 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' )
	)

update a
set	a.Gem1 = case when a.Gem1 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' ) then 0 else a.Gem1 end
	,a.Gem2 = case when a.Gem2 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' ) then 0 else a.Gem2 end
	,a.Gem3 = case when a.Gem3 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' ) then 0 else a.Gem3 end
	,a.Gem4 = case when a.Gem4 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' ) then 0 else a.Gem4 end
	,a.Gem5 = case when a.Gem5 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' ) then 0 else a.Gem5 end
	,a.Gem6 = case when a.Gem6 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' ) then 0 else a.Gem6 end
-- select *
FROM [PS_GameData].[dbo].MarketItems a
where 
	ItemID in	(	SELECT ItemID from [PS_GameDefs].[dbo].[Items] i where i.Type in ('19','34') )
	and 
	(	Gem1 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' )
	or Gem2 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' )
	or Gem3 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' )
	or Gem4 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' )
	or Gem5 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' )
	or Gem6 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' )
	)


update a
set	a.Gem1 = case when a.Gem1 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' ) then 0 else a.Gem1 end
	,a.Gem2 = case when a.Gem2 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' ) then 0 else a.Gem2 end
	,a.Gem3 = case when a.Gem3 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' ) then 0 else a.Gem3 end
	,a.Gem4 = case when a.Gem4 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' ) then 0 else a.Gem4 end
	,a.Gem5 = case when a.Gem5 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' ) then 0 else a.Gem5 end
	,a.Gem6 = case when a.Gem6 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' ) then 0 else a.Gem6 end
-- select *
FROM [PS_GameData].dbo.MarketItems_DelLog a
where 
	ItemID in	(	SELECT ItemID from [PS_GameDefs].[dbo].[Items] i where i.Type in ('19','34') )
	and 
	(	Gem1 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' )
	or Gem2 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' )
	or Gem3 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' )
	or Gem4 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' )
	or Gem5 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' )
	or Gem6 in (	select TypeID from PS_GameDefs.dbo.Items i where ItemName like 'Life %' )
	)

