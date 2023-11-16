USE [PS_GameData]
GO
/****** Object:  StoredProcedure [dbo].[ausp_Delete_Player]    Script Date: 07/07/2010 00:41:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ausp_Delete_Player]

@CharName varchar(50)

AS
BEGIN
SET NOCOUNT ON; 

DECLARE @UserUID int, @CharID int;

-- temporary table to store basic information about to be deleted characters
DECLARE @del_chars TABLE (UserUID int, UserID varchar(40), CharID int PRIMARY KEY CLUSTERED, CharName varchar(50));

    -- get UserUID of the player
    SELECT @UserUID=UM.UserUID
    FROM PS_GameData.dbo.Chars AS C INNER JOIN PS_UserData.dbo.Users_Master AS UM
    ON C.UserUID = UM.UserUID
    WHERE C.CharName = @CharName AND C.Del=0;

    -- no rows returned? player doesn't exist or invalid character name
    IF @@ROWCOUNT=0
     BEGIN
      PRINT 'Character not found.';
      return;
     END

    -- get all characters belonging to player and insert their CharID into temp table
    INSERT INTO @del_chars 
    SELECT UserUID, UserID, CharID, CharName 
        FROM PS_GameData.dbo.Chars 
        WHERE UserUID=@UserUID;

    BEGIN TRANSACTION;
    begin TRY
        -- all needed information gathered, it's time to delete
        -- let's begin with less important data
        DELETE FROM PS_GameData.dbo.CharItems WHERE CharID IN (SELECT CharID FROM @del_chars);
        DELETE FROM PS_GameData.dbo.CharQuests WHERE CharID IN (SELECT CharID FROM @del_chars);
        DELETE FROM PS_GameData.dbo.CharQuickSlots WHERE CharID IN (SELECT CharID FROM @del_chars);
        DELETE FROM PS_GameData.dbo.CharSavePoint WHERE CharID IN (SELECT CharID FROM @del_chars);
        DELETE FROM PS_GameData.dbo.CharSkills WHERE CharID IN (SELECT CharID FROM @del_chars);
        DELETE FROM PS_GameData.dbo.UserStoredItems WHERE UserUID = @UserUID;
        DELETE FROM PS_GameData.dbo.UserMaxGrow WHERE UserUID = @UserUID;
        DELETE FROM PS_GameData.dbo.GuildChars WHERE CharID IN (SELECT CharID FROM @del_chars);
        DELETE FROM PS_GameData.dbo.FriendChars WHERE CharID IN (SELECT CharID FROM @del_chars);
        DELETE FROM PS_GameData.dbo.FriendChars WHERE FriendID IN (SELECT CharID FROM @del_chars);
        
        DELETE PS_GameData.dbo.MarketItems
        FROM PS_GameData.dbo.MarketItems AS MID INNER JOIN PS_GameData.dbo.Market AS M
        ON M.MarketID = MID.MarketID
        WHERE M.CharID IN (SELECT CharID FROM @del_chars);
        
        DELETE FROM PS_GameData.dbo.Market WHERE CharID IN (SELECT CharID FROM @del_chars);
        DELETE FROM PS_GameData.dbo.Chars WHERE UserUID = @UserUID
        
        DELETE FROM PS_UserData.dbo.Users_Detail WHERE UserUID = @UserUID
        DELETE FROM PS_UserData.dbo.Users_Master WHERE UserUID = @UserUID    
        
        -- save changes to database
        COMMIT TRANSACTION;
    end TRY
    begin CATCH

        -- rollback on error
        ROLLBACK TRANSACTION;
        
        -- Raise the error with the appropriate message and error severity
        DECLARE @ErrMsg nvarchar(4000), @ErrSeverity int;
        SELECT @ErrMsg = ERROR_MESSAGE(), @ErrSeverity = ERROR_SEVERITY();
        PRINT @ErrMsg;
        PRINT @ErrSeverity;
    end CATCH

SET NOCOUNT OFF;
END

SET QUOTED_IDENTIFIER OFF;
SET ANSI_NULLS OFF;