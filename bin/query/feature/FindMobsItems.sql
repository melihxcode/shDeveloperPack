DECLARE @MobName varchar(60);
    
    SET @MobName = '%%';

    SELECT M.MobName, I.ItemName, MI.Grade, MI.DropRate
    FROM PS_GameDefs.dbo.Mobs AS M INNER JOIN PS_GameDefs.dbo.MobItems AS MI
    ON M.MobID = MI.MobID AND MI.Grade<>0 LEFT OUTER JOIN PS_GameDefs.dbo.Items AS I
    ON MI.Grade = I.Grade
    WHERE M.MobName LIKE @MobName
    ORDER BY I.Grade, I.ItemName;