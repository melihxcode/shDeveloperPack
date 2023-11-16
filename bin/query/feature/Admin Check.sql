USE PS_UserData;

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO
/****** Object:  Table [dbo].[usp_AdminCheck]   Script Date: 12/17/2010 by Killsteal 22:00:00 ******/
CREATE PROCEDURE [dbo].[usp_AdminCheck]@Check int AS
DECLARE 
@UUID 	int,
@UID 	varchar(18),
@Status smallint,
@Admin smallint,
@TodayTime datetime
SET @TodayTime =  getdate()
If   (@Check = 1)
begin
print CONVERT(VARCHAR, @TodayTime, 109) + ' - START CHECK ADMIN HACKERS'


declare cur_event cursor for
SELECT     UserID
FROM         Users_Master
WHERE     (Admin > 0) AND (NOT (UserID = 'GM-NAME')) AND (NOT (UserID = 'GM-NAME')) AND (Status = 16 OR
                            Status = 32 OR
                            Status = 48 OR
                            Status = 64 OR
                            Status = 80) AND (AdminLevel = 255)
declare @i int
open cur_event
Fetch next from cur_event into @UID
set @i = 0 
while(@@fetch_status = 0  )
BEGIN
--BLOCK ADMIN HACKERS UserID
print CONVERT(VARCHAR, @TodayTime, 109) + ' BLOCK HACKER - ' + @UID
UPDATE Users_Master SET Status = 2 WHERE UserID = @UID
fetch next from cur_event into @UID
Set @i = @i + 1
END
close cur_Event
deallocate cur_Event
print CONVERT(VARCHAR, @TodayTime, 109) + ' - END CHECK ADMIN HACKERS'
end
else
begin 
print 'skip Check Admin Hackers'
End
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO