Declare @Name as varchar(255)
Set @Name='Character Name Here' --Place Character name of the person here.

SELECT
ci.CharID
,ci.Type
,ci.TypeID
,i.ItemName
,ci.Bag
,ci.Slot
,ci.ItemUID
,ci.Craftname
,ci.Gem1
,ci.Gem2
,ci.Gem3
,ci.Gem4
,ci.Gem5
,ci.Gem6
,ci.Quality
,ci.Count
,ci.Del
	From PS_GameData.dbo.CharItems ci
	inner join PS_GameDefs.dbo.Items i
	on ci.Type=i.Type and ci.TypeID = i.TypeID
  WHERE 
     CharID in ( SELECT
     CharID
     FROM 
     PS_GameData.dbo.Chars
     Where 
     CharName=@Name 
     and Del='0')
	 And ci.Type='2' -- Item Type here
	 And ci.TypeID='86' -- Item TypeID here