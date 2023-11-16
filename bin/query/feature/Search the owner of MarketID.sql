SELECT 
UserUID
,UserID
,CharName
,MarketID
,MinMoney
,DirectMoney
,CreateDate
,EndDate
,Del
FROM [PS_GameData].[dbo].[Market] m
 inner join PS_GameData.dbo._CreatedChars c
  on m.[CharID] = c.[CharID]
where 
 MarketID='xxx' --market id here