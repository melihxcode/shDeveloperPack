USE [PS_Billing]
GO
/****** Object:  StoredProcedure [dbo].[usp_Insert_AuctionProduct_User_E]    Script Date: 01/31/2012 22:16:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER  Proc [dbo].[usp_Insert_AuctionProduct_User_E]

@UserUID int,
@ProductCode varchar(20),
@SecurityCode varchar(16)


--@UserUID     => &#50976;????
--@ProductCode     => Item Code(GoodCode)
--@SecurityCode => Passphrase

-- RETURN
--  0 => Success.
-- -1 => Security code error.
-- -2 => &#51008;??? ??.
-- -3 => Add items in error.
-- -4 => Item code does not exist.
-- -5 => INSERT Error (DB error)

--WITH ENCRYPTION



AS

SET NOCOUNT ON

DECLARE @SlotCnt    int
DECLARE @SlotMax    int
DECLARE @SlotUse    int
DECLARE @I        int
DECLARE @J        int
DECLARE @StrItemID    varchar(20)
DECLARE @StrItemCount    varchar(20)
DECLARE @Query        nvarchar(1000)
DECLARE @ItemID        int
DECLARE @ItemCount    tinyint
DECLARE @Ret        int
DECLARE @OrderNumber    int
DECLARE @VerifyCode    bigint


SET @Ret = 0
SET @SlotMax = 240

SET @OrderNumber = 9999
SET @VerifyCode = 9999

BEGIN TRANSACTION

CREATE TABLE #SlotList( SlotNum int NOT NULL )

INSERT INTO #SlotList SELECT Slot FROM Users_Product WHERE UserUID=@UserUID ORDER BY Slot

SET @SlotCnt = ( SELECT ISNULL(COUNT(*),0) FROM #SlotList )

IF( @SlotCnt >= @SlotMax )
BEGIN
    -- Item has exceeded number (bank slots kkwakcham)
    SET @Ret = -2
    GOTO ERROR_RETURN
END

SET @I = 1

WHILE( @I <= 24 )
BEGIN
    SET @StrItemID = 'ItemID' + CAST( @I AS varchar(5) )
    SET @StrItemCount = 'ItemCount' + CAST( @I AS varchar(5) )

    SET @Query = 'SELECT @ItemID='+@StrItemID+', @ItemCount='+@StrItemCount+' FROM AuctionProductList WHERE ProductCode='''+@ProductCode+''''

    EXEC sp_executesql @Query, N'@ItemID int OUTPUT, @ItemCount tinyint OUTPUT', @ItemID OUTPUT, @ItemCount OUTPUT

    IF( (@ItemID IS NOT NULL) AND (@ItemCount IS NOT NULL) AND (@ItemID <> 0) ) 
    BEGIN
        SET @J = 0

        WHILE( @J < @SlotMax )
        BEGIN
            SET @SlotUse = ( SELECT ISNULL(COUNT(*),0) FROM #SlotList WHERE SlotNum=@J )
            IF( @SlotUse = 0 )
            BEGIN
                INSERT INTO Users_Product(UserUID,Slot,ItemID,ItemCount,ProductCode,OrderNumber,VerifyCode,BuyDate) VALUES(@UserUID,@J,@ItemID,@ItemCount,@ProductCode,@OrderNumber,@VerifyCode,GETDATE())
                IF( @@ERROR = 0 )
                BEGIN
                    INSERT INTO #SlotList(SlotNum) VALUES(@J)
                    BREAK
                END
                ELSE
                BEGIN
                    -- Insert error
                    SET @Ret = -5
                    GOTO ERROR_RETURN
                END
            END
            
            SET @J = @J + 1
        END

        IF( @J >= @SlotMax )
        BEGIN
            -- Lack of slots (not add the item)
            SET @Ret = -3
            GOTO ERROR_RETURN
        END
    END
    ELSE IF( @I = 1 )
    BEGIN
        -- Product table data error (the product code does not exist)
        SET @Ret = -4
        GOTO ERROR_RETURN
    END

    SET @I = @I + 1
END

ERROR_RETURN:

DROP TABLE #SlotList

IF( @@ERROR = 0 AND @Ret = 0 )
BEGIN
    COMMIT TRAN
    RETURN 0
END
ELSE
BEGIN
    ROLLBACK TRAN
    RETURN @Ret
END

SET NOCOUNT OFF 