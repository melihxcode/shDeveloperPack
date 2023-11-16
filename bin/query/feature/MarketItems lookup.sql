SELECT c.MarketID,c.ItemUID,c.ItemID,c.Count,d.ItemName,c .Maketime,u.CharName,u.CharID,b.UserUID,
b.Status,b.UserIP
FROM PS_GameData.dbo.MarketItems as c
INNER JOIN PS_GameData.dbo.Market AS y ON c.MarketID=y.MarketID
INNER JOIN PS_GameData.dbo.Chars AS u ON y.CharID=u.CharID 
INNER JOIN PS_GameDefs.dbo.Items AS d ON c.ItemID=d.ItemID
INNER JOIN PS_UserData.dbo.Users_Master AS b ON u.UserUID=b.UserUID
where y.del=0 order by u.CharName,d.ItemName