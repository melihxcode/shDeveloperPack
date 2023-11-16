SELECT 
 GuildName
 ,i.ItemName 
 ,l1.ItemName as 'Lapis1'
 ,L2.ItemName as 'Lapis2'
 ,L3.ItemName as 'Lapis3'
 ,L4.ItemName as 'Lapis4'
 ,L5.ItemName as 'Lapis5'
 ,L6.ItemName as 'Lapis6'
 ,SUBSTRING(Craftname,1,2) as 'Str'
 ,SUBSTRING(Craftname,3,2) as 'Dex'
 ,SUBSTRING(Craftname,5,2) as 'Rec'
 ,SUBSTRING(Craftname,7,2) as 'Int'
 ,SUBSTRING(Craftname,9,2) as 'Wis'
 ,SUBSTRING(Craftname,11,2) as 'Luc'
 ,SUBSTRING(Craftname,13,2)+'00' as 'HP'
 ,SUBSTRING(Craftname,15,2)+'00' as 'SP'
 ,SUBSTRING(Craftname,17,2)+'00' as 'MP'
 ,case when cast(SUBSTRING(Craftname,19,2) as int) >= 50
   then cast(SUBSTRING(Craftname,19,2) as int) - 50
   else cast(SUBSTRING(Craftname,19,2) as int)
   end as 'Enchant'
-- ,*
FROM [PS_GameData].[dbo].[GuildStoredItems] ci with (nolock)
 inner join [PS_GameData].[dbo].[Guilds] c with (nolock)
  on c.GuildID = ci.GuildID
 inner join [PS_GameDefs].[dbo].[Items] i with (nolock)
  on i.ItemID = ci.ItemID
 left join [PS_GameDefs].[dbo].[Items] L1 with (nolock)
  on L1.TypeID = ci.Gem1
  and L1.Type = 30
 left join [PS_GameDefs].[dbo].[Items] L2 with (nolock)
  on L2.TypeID = ci.Gem2
  and L2.Type = 30
 left join [PS_GameDefs].[dbo].[Items] L3 with (nolock)
  on L3.TypeID = ci.Gem3
  and L3.Type = 30
 left join [PS_GameDefs].[dbo].[Items] L4 with (nolock)
  on L4.TypeID = ci.Gem4
  and L4.Type = 30
 left join [PS_GameDefs].[dbo].[Items] L5 with (nolock)
  on L5.TypeID = ci.Gem5
  and L5.Type = 30
 left join [PS_GameDefs].[dbo].[Items] L6 with (nolock)
  on L6.TypeID = ci.Gem6
  and L6.Type = 30

where 
 c.GuildName = 'xxx' -- guild name in ''
 and len(Craftname) > 0
order by 
 c.GuildName, i.ItemName