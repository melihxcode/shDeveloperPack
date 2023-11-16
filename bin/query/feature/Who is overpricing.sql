SELECT 
 *
FROM [PS_GameData].[dbo].[Market] m
 inner join PS_GameData.dbo._CreatedChars c
  on m.[CharID] = c.[CharID]
where 
 MarketID in ( SELECT 
      MarketID
     FROM 
      [PS_GameData].[dbo].[MarketItems]
     where 
      right([Craftname],2) in ('00','') 
      and Gem1 = 0
      and Gem2 = 0
      and Gem3 = 0
      and Gem4 = 0
      and Gem5 = 0
      and Gem6 = 0
      )
  and MinMoney > 150000000 -- change min money here (min money= asking price for bid)