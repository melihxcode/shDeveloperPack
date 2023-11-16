USE [PS_GameData]
GO
/****** Object:  StoredProcedure [dbo].[ausp_Check_PlayersEquipment]    Script Date: 06/13/2010 12:24:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:        Tomasz Wiacek
-- Create date: 12.I.2011
-- Description:    Lists equipment, lapis linked, current and added status points of a given character.
-- =============================================
CREATE PROCEDURE [dbo].[ausp_Read_PlayersEquipment_V2]
    
    @CharID int

AS
BEGIN

    SET NOCOUNT ON;

    -- first get player UserUID
    DECLARE @UserUID int;
    SELECT @UserUID = UserUID FROM PS_GameData.dbo.Chars WHERE CharID = @CharID;

    -- temp tables to store player items - equipped, in backpack, in warehouse
    DECLARE @items_equipped TABLE (ItemID int, ItemName varchar(30), Gem1 varchar(30), Gem2 varchar(30),
        Gem3 varchar(30), Gem4 varchar(30), Gem5 varchar(30), Gem6 varchar(30));
    DECLARE @items_backpack TABLE (ItemID int, ItemName varchar(30));
    DECLARE @items_warehouse TABLE (ItemID int, ItemName varchar(30));

    -- temp table to store lapis properties
    DECLARE @lapis_props TABLE (TypeID smallint, ItemName varchar(30), ConstStr tinyint, ConstDex tinyint,
        ConstRec tinyint, ConstInt tinyint, ConstWis tinyint, ConstLuc tinyint, ConstHP tinyint,
        ConstMP tinyint, ConstSP tinyint);

/*
    Now get all needed information about player's items and lapis linked in equipped gear.
    - get player's equiped items
*/
    INSERT @items_equipped
    SELECT CI.ItemID, I.ItemName, CI.Gem1, CI.Gem2, CI.Gem3, CI.Gem4, CI.Gem5, CI.Gem6
    FROM PS_GameData.dbo.CharItems AS CI INNER JOIN PS_gamedefs.dbo.Items AS I
    ON CI.ItemID = I.ItemID AND CI.Bag=0
    WHERE CI.CharID = @CharID
    ORDER BY CI.Bag, CI.Slot;

    -- get player's items from backpack
    INSERT INTO @items_backpack
    SELECT CI.ItemID, I.ItemName
    FROM PS_GameData.dbo.CharItems AS CI INNER JOIN PS_gamedefs.dbo.Items AS I
    ON CI.ItemID = I.ItemID
    WHERE CI.CharID = @CharID AND CI.Bag IN (1,2,3,4,5)
    ORDER BY CI.Bag, I.Slot;

    -- get player's items from warehouse
    INSERT INTO @items_warehouse
    SELECT USI.ItemID, I.ItemName
    FROM PS_GameData.dbo.UserStoredItems AS USI INNER JOIN PS_gamedefs.dbo.Items AS I
    ON USI.ItemID = I.ItemID
    WHERE USI.UserUID = @UserUID
    ORDER BY USI.Slot;

    /*
        Get lapis properties for each lapis linked to equipped gear.
        Info is stored by TypeID of lapis.
    */
    INSERT INTO @lapis_props
    SELECT TypeID, ItemName, ConstStr, ConstDex, ConstRec, ConstWis, ConstInt, ConstLuc, ConstHP, ConstMP, ConstSP
    FROM PS_gamedefs.dbo.Items
    WHERE [Type]=30 AND TypeID IN ( SELECT DISTINCT Gem.Gem1 FROM
        (SELECT DISTINCT Gem1 FROM @items_equipped UNION ALL Select DISTINCT Gem2 FROM @items_equipped UNION ALL
        SELECT DISTINCT Gem3 FROM @items_equipped UNION ALL SELECT DISTINCT Gem4 FROM @items_equipped UNION ALL
        SELECT DISTINCT Gem5 FROM @items_equipped UNION ALL SELECT DISTINCT Gem6 FROM @items_equipped) AS Gem)

    /*
        Create table to store player's status information.
        - without _p - characters current status points
        - with _p - status points added by lapis (summed)
    */
    DECLARE @player_stats TABLE (
        CharName varchar(60),
        [Str] smallint, Dex smallint, Rec smallint, [Int] smallint, Wis smallint, Luc smallint,
        Str_p smallint DEFAULT(0), Dex_p smallint DEFAULT(0), Rec_p smallint DEFAULT(0),
        Int_p smallint DEFAULT(0), Wis_p smallint DEFAULT(0), Luc_p smallint DEFAULT(0));

    -- fill above table with player's status information
    INSERT INTO @player_stats (CharName, [Str], Dex, Rec, [Int], Wis, Luc)
    SELECT CharName, [Str], Dex, Rec, [Int], Wis, Luc
    FROM PS_GameData.dbo.Chars
    WHERE CharID=@CharID;

    /*
        Add points added by lapis and store the result in _p fields in @player_stats table.
        Variables found below are used to collect data about the amount of status points added
        by lapis. It is used then to update @player_stats table _p fields.
    */
    DECLARE @Str smallint, @Dex smallint, @Rec smallint, @Int smallint, @Wis smallint, @Luc smallint,
            @Str_p smallint, @Dex_p smallint, @Rec_p smallint, @Int_p smallint, @Wis_p smallint, @Luc_p smallint;

    SELECT @Str = SUM(LP.ConstStr), @Dex = SUM(LP.ConstDex), @Rec = SUM(LP.ConstRec),
        @Int = SUM(LP.ConstInt), @Wis = SUM(LP.ConstWis), @Luc = SUM(LP.ConstLuc)
    FROM @items_equipped AS IE INNER JOIN @lapis_props AS LP
    ON IE.Gem1 = LP.TypeID

    SET @Str_p=@Str;
    SET @Dex_p=@Dex;
    SET @Rec_p=@Rec;
    SET @Int_p=@Int;
    SET @Wis_p=@Wis;
    SET @Luc_p=@Luc;

    SELECT @Str = SUM(LP.ConstStr), @Dex = SUM(LP.ConstDex), @Rec = SUM(LP.ConstRec),
        @Int = SUM(LP.ConstInt), @Wis = SUM(LP.ConstWis), @Luc = SUM(LP.ConstLuc)
    FROM @items_equipped AS IE INNER JOIN @lapis_props AS LP
    ON IE.Gem2 = LP.TypeID

    SET @Str_p = @Str_p + @Str;
    SET @Dex_p = @Dex_p + @Dex;
    SET @Rec_p = @Rec_p + @Rec;
    SET @Int_p = @Int_p + @Int;
    SET @Wis_p = @Wis_p + @Wis;
    SET @Luc_p = @Luc_p + @Luc;

    SELECT @Str = SUM(LP.ConstStr), @Dex = SUM(LP.ConstDex), @Rec = SUM(LP.ConstRec),
        @Int = SUM(LP.ConstInt), @Wis = SUM(LP.ConstWis), @Luc = SUM(LP.ConstLuc)
    FROM @items_equipped AS IE INNER JOIN @lapis_props AS LP
    ON IE.Gem3 = LP.TypeID

    SET @Str_p = @Str_p + @Str;
    SET @Dex_p = @Dex_p + @Dex;
    SET @Rec_p = @Rec_p + @Rec;
    SET @Int_p = @Int_p + @Int;
    SET @Wis_p = @Wis_p + @Wis;
    SET @Luc_p = @Luc_p + @Luc;

    SELECT @Str = SUM(LP.ConstStr), @Dex = SUM(LP.ConstDex), @Rec = SUM(LP.ConstRec),
        @Int = SUM(LP.ConstInt), @Wis = SUM(LP.ConstWis), @Luc = SUM(LP.ConstLuc)
    FROM @items_equipped AS IE INNER JOIN @lapis_props AS LP
    ON IE.Gem4 = LP.TypeID

    SET @Str_p = @Str_p + @Str;
    SET @Dex_p = @Dex_p + @Dex;
    SET @Rec_p = @Rec_p + @Rec;
    SET @Int_p = @Int_p + @Int;
    SET @Wis_p = @Wis_p + @Wis;
    SET @Luc_p = @Luc_p + @Luc;

    SELECT @Str = SUM(LP.ConstStr), @Dex = SUM(LP.ConstDex), @Rec = SUM(LP.ConstRec),
        @Int = SUM(LP.ConstInt), @Wis = SUM(LP.ConstWis), @Luc = SUM(LP.ConstLuc)
    FROM @items_equipped AS IE INNER JOIN @lapis_props AS LP
    ON IE.Gem5 = LP.TypeID

    SET @Str_p = @Str_p + @Str;
    SET @Dex_p = @Dex_p + @Dex;
    SET @Rec_p = @Rec_p + @Rec;
    SET @Int_p = @Int_p + @Int;
    SET @Wis_p = @Wis_p + @Wis;
    SET @Luc_p = @Luc_p + @Luc;

    SELECT @Str = SUM(LP.ConstStr), @Dex = SUM(LP.ConstDex), @Rec = SUM(LP.ConstRec),
        @Int = SUM(LP.ConstInt), @Wis = SUM(LP.ConstWis), @Luc = SUM(LP.ConstLuc)
    FROM @items_equipped AS IE INNER JOIN @lapis_props AS LP
    ON IE.Gem6 = LP.TypeID

    SET @Str_p = @Str_p + @Str;
    SET @Dex_p = @Dex_p + @Dex;
    SET @Rec_p = @Rec_p + @Rec;
    SET @Int_p = @Int_p + @Int;
    SET @Wis_p = @Wis_p + @Wis;
    SET @Luc_p = @Luc_p + @Luc;

    UPDATE @player_stats SET Str_p=@Str_p, Dex_p=@Dex_p, Rec_p=@Rec_p, Int_p=@Int_p, Wis_p=@Wis_p, Luc_p=@Luc_p;

    /*
        Because of small error when declaring @items_equipped table (Gem1-6 is varchar instead of tinyint),
        all TypeID's of lapis will be updated to LapisName.
    */
    UPDATE @items_equipped SET Gem1 = LP.ItemName
        FROM @items_equipped AS IE INNER JOIN @lapis_props AS LP
        ON IE.Gem1=LP.TypeID
    UPDATE @items_equipped SET Gem2 = LP.ItemName
        FROM @items_equipped AS IE INNER JOIN @lapis_props AS LP
        ON IE.Gem2=LP.TypeID
    UPDATE @items_equipped SET Gem3 = LP.ItemName
        FROM @items_equipped AS IE INNER JOIN @lapis_props AS LP
        ON IE.Gem3=LP.TypeID
    UPDATE @items_equipped SET Gem4 = LP.ItemName
        FROM @items_equipped AS IE INNER JOIN @lapis_props AS LP
        ON IE.Gem4=LP.TypeID
    UPDATE @items_equipped SET Gem5 = LP.ItemName
        FROM @items_equipped AS IE INNER JOIN @lapis_props AS LP
        ON IE.Gem5=LP.TypeID
    UPDATE @items_equipped SET Gem6 = LP.ItemName
        FROM @items_equipped AS IE INNER JOIN @lapis_props AS LP
        ON IE.Gem6=LP.TypeID

    /*
        Select all the data for the PHP script to process.
    */
    SELECT CharName, [Str], Dex, Rec, [Int], Wis, Luc, Str_p, Dex_p, Rec_p, Int_p, Wis_p, Luc_p FROM @player_stats;
    SELECT ItemName, Gem1, Gem2, Gem3, Gem4, Gem5, Gem6 FROM @items_equipped;
    SELECT ItemName FROM @items_backpack;
    SELECT ItemName FROM @items_warehouse;

SET NOCOUNT OFF;
END

SET ANSI_NULLS OFF;
SET QUOTED_IDENTIFIER OFF;