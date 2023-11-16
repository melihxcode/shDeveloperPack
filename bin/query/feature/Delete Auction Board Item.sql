declare @MarketID as int
set @MarketID = '150709'
UPDATE PS_GameData.dbo.Market
SET EndDate = '2012-01-01 00:00:00.000'
WHERE MarketID = @MarketID

UPDATE PS_GameData.dbo.Market
SET Del = '1'
WHERE MarketID = @MarketID

UPDATE PS_GameData.dbo.MarketItems
SET Count = '0'
WHERE MarketID = @MarketID

Delete 
From PS_GameData.dbo.Market
Where MarketID = @MarketID

Delete
From PS_GameData.dbo.MarketItems
Where MarketID = @MarketID

Select *
From PS_GameData.dbo.Market
Where MarketID = @MarketID

Select *
From PS_GameData.dbo.MarketItems
Where MarketID = @MarketID