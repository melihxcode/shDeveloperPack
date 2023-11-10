 -- StoredProcedure [dbo].[usp_Create_Char_R] -- Modify---- 


DECLARE @Ret int
SET @CharName = LTRIM(RTRIM(@CharName))
SET @Ret = 0
DECLARE @charcheck AS INT

SET @NameCnt = (SELECT ISNULL(COUNT(*),0) FROM Chars WHERE CharName=@CharName AND Del=0)
SET @charcheck = PATINDEX('%[^a-zA-Z0-9]%',@CharName)
IF @charcheck > 0
RETURN -1
 