/*
Author:        ProfNerwosol
Date:        20-X-2010
Purpose:    Global server Status & Skill Point reset.
*/

DECLARE @Stat_NM tinyint, @Stat_HM tinyint, @Stat_UM tinyint, @Stat_EM tinyint;
DECLARE @Skill_NM tinyint, @Skill_HM tinyint, @Skill_UM tinyint, @Skill_EM tinyint;

    -- set your custom Status Points gained per level here
SET @Stat_NM = 1;
SET @Stat_HM = 2;
SET @Stat_UM = 5;
    -- set your custom Skill Points gained per level here
SET @Skill_NM = 1;
SET @Skill_HM = 2;
SET @Skill_UM = 20;

/* Let's not forget to clear the skills! */
DELETE FROM PS_GameData.dbo.CharSkills