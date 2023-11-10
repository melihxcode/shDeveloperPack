USE [PS_GameData]
GO
DROP Proc [dbo].[usp_Save_Char_ApplySkill_Add_E2]
/****** Object:  StoredProcedure [dbo].[usp_Save_Char_ApplySkill_Add_E2]    Script Date: 02/28/2013 23:35:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE Proc [dbo].[usp_Save_Char_ApplySkill_Add_E2]

@CharID int,
@SkillID smallint,
@SkillLevel tinyint,
@LeftResetTime int

AS

SET NOCOUNT ON

INSERT INTO CharApplySkills(CharID,Skillid,SkillLevel,LeftResetTime) VALUES(@CharID,@SkillID,@SkillLevel,@LeftResetTime)

IF(@@ERROR = 0)
BEGIN
RETURN 1
END
ELSE
BEGIN
RETURN -1
END

SET NOCOUNT OFF 