
declare @Account as int
set @Account = xxxxxxx     -- Type the UserUID and hit F5 to delete that Account


delete 
from PS_UserData.dbo.Users_Master
where UserUID = @Account

select CharID
into #CharIDs
from PS_GameData.dbo.Chars
where UserUID = @Account

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
where UserUID = @Account

delete 
from PS_GameData.dbo.UserStoredItems
where UserUID = @Account


drop table #CharIDs