USE [PS_GameData]
GO
/****** Object:  StoredProcedure [dbo].[usp_Save_Char_Product_Item_E]    Script Date: 01/31/2012 22:23:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Proc [dbo].[usp_Save_Char_Product_Item_E]

@ServerID tinyint,
@UserUID int,
@BankSlot tinyint,
@CharID int,
@ItemUID bigint,
@Bag tinyint,
@Slot tinyint,
@ItemID int,
@Type tinyint,
@TypeID tinyint,
@Quality smallint,    --int
@Gem1 tinyint,
@Gem2 tinyint,
@Gem3 tinyint,
@Gem4 tinyint,
@Gem5 tinyint,
@Gem6 tinyint,
@Craftname varchar(20) = '', 
@Count tinyint,
@Maketime datetime,
@Maketype varchar(1)    --char(1)

AS

--SET NOCOUNT ON
SET XACT_ABORT ON

DECLARE @ProductCode varchar(20)
DECLARE @OrderNumber int
DECLARE @VerifyCode bigint
DECLARE @BuyDate datetime

IF(@Quality >= 5000)
BEGIN
    SET @Quality=0
END

BEGIN DISTRIBUTED TRANSACTION

-- Add inventory
INSERT INTO CharItems(CharID,Bag,Slot,ItemID,Type,TypeID,ItemUID,Quality,Gem1,Gem2,Gem3,Gem4, 
Gem5,Gem6,CraftName,[Count],Maketime,Maketype)
VALUES(@CharID,@Bag,@Slot,@ItemID,@Type,@TypeID,@ItemUID,@Quality,@Gem1,@Gem2,@Gem3,@Gem4, 
@Gem5,@Gem6,@Craftname,@Count,@Maketime,@Maketype)

-- Logging receipt of goods
SELECT @ProductCode=ProductCode,@OrderNumber=OrderNumber,@VerifyCode=VerifyCode,@BuyDate=BuyDate
FROM PS_Billing.dbo.Users_Product 
WHERE UserUID=@UserUID AND Slot=@BankSlot

INSERT INTO ProductLog(ServerID,UserUID,CharID,ItemID,ItemUID,Quality,ItemCount,ProductCode,OrderNumber,VerifyCode,BuyDate,ReceiveDate)
VALUES(@ServerID,@UserUID,@CharID,@ItemID,@ItemUID,@Quality,@Count,@ProductCode,@OrderNumber,@VerifyCode,@BuyDate,@Maketime)

-- Deleting the bank storage
DELETE FROM PS_Billing.dbo.Users_Product WHERE UserUID=@UserUID AND Slot=@BankSlot

IF( @@ERROR=0 AND @@ROWCOUNT=1)
BEGIN
    COMMIT TRAN
    RETURN 1
END
ELSE
BEGIN
    ROLLBACK TRAN
    RETURN -1
END

SET XACT_ABORT OFF
--SET NOCOUNT OFF 