
SELECT UserUID
into #UserUIDs
FROM [PS_UserData].[dbo].[Users_Master]
where AdminLevel = 0
	and UserID not like '%%' -- userid inside %% you want to keep that is above 180 day's old
	and LeaveDate <= GETDATE()-180 -- change how many day's inactivity 

select CharID
into #CharIDs
from PS_GameData.dbo.Chars
where UserUID in (select UserUID from #UserUIDs)

delete 
from PS_UserData.dbo.Users_Master
where UserUID in (select UserUID from #UserUIDs)

delete 
from PS_GameData.dbo.Chars
where CharID in (select CharID from #CharIDs)

delete 
from PS_GameData.dbo.CharItems
where CharID in (select CharID from #CharIDs)

delete 
from PS_GameData.dbo.CharRenameLog
where CharID in (select CharID from #CharIDs)

delete 
from PS_GameData.dbo.CharSavePoint
where CharID in (select CharID from #CharIDs)

delete 
from PS_GameData.dbo.CharSkills
where CharID in (select CharID from #CharIDs)

delete 
from PS_GameData.dbo.FriendChars
where CharID in (select CharID from #CharIDs)

delete 
from PS_GameData.dbo.GuildChars
where CharID in (select CharID from #CharIDs)

delete 
from PS_GameData.dbo.Market
where CharID in (select CharID from #CharIDs)

delete 
from PS_GameData.dbo.MarketCharConcern
where CharID in (select CharID from #CharIDs)

delete 
from PS_GameData.dbo.MarketCharResultItems
where CharID in (select CharID from #CharIDs)

delete 
from PS_GameData.dbo.MarketCharResultItems_DelLog
where CharID in (select CharID from #CharIDs)

delete 
from PS_GameData.dbo.MarketCharResultMoney
where CharID in (select CharID from #CharIDs)

delete 
from PS_GameData.dbo.MarketCharResultMoney_DelLog
where CharID in (select CharID from #CharIDs)

delete 
from PS_GameData.dbo.ProductLog
where CharID in (select CharID from #CharIDs)

delete 
from PS_GameData.dbo.UserMaxGrow
where UserUID in (select UserUID from #UserUIDs)

delete 
from PS_GameData.dbo.UserStoredItems
where UserUID in (select UserUID from #UserUIDs)


drop table #CharIDs
drop table #UserUIDs