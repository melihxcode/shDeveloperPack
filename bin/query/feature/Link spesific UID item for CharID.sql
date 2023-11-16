Declare @UID as varchar(255)
Set @UID='ItemUID Here' --Place ItemUID here.

Declare @Char as varchar(255)
Set @Char='CharID Here' --Place CharID here.

UPDATE PS_GameData.dbo.CharItems
SET Gem1 = '49'
WHERE ItemUID = @UID and CharID=@Char

UPDATE PS_GameData.dbo.CharItems
SET Gem2 = '187'
WHERE ItemUID = @UID and CharID=@Char

UPDATE PS_GameData.dbo.CharItems
SET Gem3 = '178'
WHERE ItemUID = @UID and CharID=@Char

UPDATE PS_GameData.dbo.CharItems
SET Gem4 = '177'
WHERE ItemUID = @UID and CharID=@Char

UPDATE PS_GameData.dbo.CharItems
SET Gem5 = '124'
WHERE ItemUID = @UID and CharID=@Char

UPDATE PS_GameData.dbo.CharItems
SET Gem6 = '125'
WHERE ItemUID = @UID and CharID=@Char