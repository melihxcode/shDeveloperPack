-- 1. First: Put Character Name in.
Declare @Name as varchar(255)
Set @Name='xxx' --Place Character name of the person here.

-- This searches for their Current Family and Job (and to see if it is the right person) when script is Executed.
--(Theres after change checkup too, to see if the Family and Job changed to right ones.)
Select UserID, UserUID, CharID, CharName, Del, Family, Job, Level, LoginStatus From PS_GameData.dbo.Chars Where CharName=@Name and Del='0'

-- 2. Second: Put the New Family Value they want.
Update PS_GameData.dbo.Chars
Set Family='0' -- Warning:If runned empty then changes value to 0.
-- For Family: 0 Human / 1 Elves / 2 Vail / 3 Nordein
Where CharName=@Name and Del='0'

-- 3. Third: Put the New Job Value they want.
Update PS_GameData.dbo.Chars
Set Job='0' -- Warning:If runned empty then changes value to 0.
-- For Job: 0 Warrior-Fighter / 1 Guardian-Defender / 2 Assassin-Ranger
-- 3 Hunter-Archer / 4 Pagan-Mage / 5 Oracle-Priest
Where CharName=@Name and Del='0'

-- This is the After change checkup to compare Old Family and Job to New values when script is Executed.
Select UserID, UserUID, CharID, CharName, Del, Family, Job, Level, LoginStatus From PS_GameData.dbo.Chars Where CharName=@Name and Del='0'

--When Script is Executed, This will show items they had in Inventory before change. 
--(Theres same chekup after Script too to get new Values and to compare them 2 to look for possible errors.)
Select CharID, ci.Type, ci.TypeID, i.ItemName, Bag, ci.Slot from PS_GameData.dbo.CharItems ci
                                       inner join PS_GameDefs.dbo.Items i
									   on ci.Type=i.Type and ci.TypeID = i.TypeID
  WHERE 
     CharID in ( SELECT
     CharID
     FROM 
     PS_GameData.dbo.Chars
     Where 
     CharName=@Name 
     and Del='0')

-- 4. Forth: Start Changing items - Please read all green notes and place right numbers where they belong.
Update PS_GameData.dbo.CharItems
Set Type='16' -- Changing Helmet> New Helmet Type.
    WHERE
    Type='31' and TypeID='37' -- Person's Current Helmet Type and TypeID.
    and CharID in ( SELECT
      CharID
      FROM 
      PS_GameData.dbo.Chars
      Where 
      CharName=@Name 
      and Del='0')
Update PS_GameData.dbo.CharItems
Set TypeID='36' -- Changing Helmet> New Helmet TypeID. 
    WHERE -- Next Row's Type has to Match with The Type of New Item (aka the item that it is changed to.)
    Type='16' and TypeID='37' -- Person's New Helmet Type and Current Helmet TypeID. 
    and CharID in ( SELECT
      CharID
      FROM 
      PS_GameData.dbo.Chars
      Where 
      CharName=@Name 
      and Del='0')

Update PS_GameData.dbo.CharItems
Set Type='17' -- Changing Top> New Protector Type.
    WHERE
    Type='32' and TypeID='37' -- Person's Current Protector Type and TypeID.
    and CharID in ( SELECT
      CharID
      FROM 
      PS_GameData.dbo.Chars
      Where 
      CharName=@Name 
      and Del='0')
Update PS_GameData.dbo.CharItems
Set TypeID='36' -- Changing Top> New Protector TypeID.
    WHERE -- Next Row's Type has to Match with The Type of New Item (aka the item that it is changed to.)
    Type='17' and TypeID='37' -- Person's New Protector Type and Current Protector TypeID.
    and CharID in ( SELECT
      CharID
      FROM 
      PS_GameData.dbo.Chars
      Where 
      CharName=@Name 
      and Del='0')

Update PS_GameData.dbo.CharItems
Set Type='18' -- Changing Leggings> New Leggings Type.
    WHERE
    Type='33' and TypeID='37' -- Person's Current Leggings Type and TypeID.
    and CharID in ( SELECT
      CharID
      FROM 
      PS_GameData.dbo.Chars
      Where 
      CharName=@Name 
      and Del='0')
Update PS_GameData.dbo.CharItems
Set TypeID='36' -- Changing Leggings> New Leggings TypeID.
    WHERE -- Next Row's Type has to Match with The Type of New Item (aka the item that it is changed to.)
    Type='18' and TypeID='37' -- Person's New Leggings Type and Current Leggings TypeID.
    and CharID in ( SELECT
      CharID
      FROM 
      PS_GameData.dbo.Chars
      Where 
      CharName=@Name 
      and Del='0')

Update PS_GameData.dbo.CharItems
Set Type='20' -- Changing Mufflers> New Muffler Type.
    WHERE
    Type='35' and TypeID='37' -- Person's Current Muffler Type and TypeID.
    and CharID in ( SELECT
      CharID
      FROM 
      PS_GameData.dbo.Chars
      Where 
      CharName=@Name 
      and Del='0')
Update PS_GameData.dbo.CharItems
Set TypeID='36' -- Changing Mufflers> New Muffler TypeID.
    WHERE -- Next Row's Type has to Match with The Type of New Item (aka the item that it is changed to.)
    Type='20' and TypeID='37' -- Person's New Muffler Type and Current Muffler TypeID.
    and CharID in ( SELECT
      CharID
      FROM 
      PS_GameData.dbo.Chars
      Where 
      CharName=@Name 
      and Del='0')

Update PS_GameData.dbo.CharItems
Set Type='21' -- Changing Walkers> New Walker Type.
    WHERE
    Type='36' and TypeID='37' -- Person's Current Walker Type and TypeID.
    and CharID in ( SELECT
      CharID
      FROM 
      PS_GameData.dbo.Chars
      Where 
      CharName=@Name 
      and Del='0')
Update PS_GameData.dbo.CharItems
Set TypeID='36' -- Changing Walkers> New Walker TypeID.
    WHERE -- Next Row's Type has to Match with The Type of New Item (aka the item that it is changed to.)
    Type='21' and TypeID='37' -- Person's New Walker Type and Current Walker TypeID.
    and CharID in ( SELECT
      CharID
      FROM 
      PS_GameData.dbo.Chars
      Where 
      CharName=@Name 
      and Del='0')

Update PS_GameData.dbo.CharItems
Set Type='19' -- Changing Shield> New Shield Type.
    WHERE
    Type='34' and TypeID='102' -- Person's Current Shield Type and TypeID.
    and CharID in ( SELECT
      CharID
      FROM 
      PS_GameData.dbo.Chars
      Where 
      CharName=@Name 
      and Del='0')
Update PS_GameData.dbo.CharItems
Set TypeID='87' -- Changing Shield> New Shield TypeID.
    WHERE -- Next Row's Type has to Match with The Type of New Item (aka the item that it is changed to.)
    Type='19' and TypeID='102' -- Person's New Shield Type and Current Shield TypeID.
    and CharID in ( SELECT
      CharID
      FROM 
      PS_GameData.dbo.Chars
      Where 
      CharName=@Name 
      and Del='0')

Update PS_GameData.dbo.CharItems
Set Type='24' -- Changing Cape> New Cape Type.
    WHERE
    Type='39' and TypeID='110' -- Person's Current Cape Type and TypeID.
    and CharID in ( SELECT
      CharID
      FROM 
      PS_GameData.dbo.Chars
      Where 
      CharName=@Name 
      and Del='0')
Update PS_GameData.dbo.CharItems
Set TypeID='195' -- Changing Cape> New Cape TypeID.
    WHERE -- Next Row's Type has to Match with The Type of New Item (aka the item that it is changed to.)
    Type='24' and TypeID='110' -- Person's New Cape Type and Current Cape TypeID.
    and CharID in ( SELECT
      CharID
      FROM 
      PS_GameData.dbo.Chars
      Where 
      CharName=@Name 
      and Del='0')

Update PS_GameData.dbo.CharItems
Set Type='2' -- Changing Weapons> New Weapon Type.
    WHERE
    Type='7' and TypeID='101' -- Person's Current Weapon Type and TypeID.
    and CharID in ( SELECT
      CharID
      FROM 
      PS_GameData.dbo.Chars
      Where 
      CharName=@Name 
      and Del='0')
Update PS_GameData.dbo.CharItems
Set TypeID='86' -- Changing Weapon> New Weapon TypeID.
    WHERE -- Next Row's Type has to Match with The Type of New Item (aka the item that it is changed to.)
    Type='2' and TypeID='101' -- Person's New Weapon Type and Current Weapon TypeID.
    and CharID in ( SELECT
      CharID
      FROM 
      PS_GameData.dbo.Chars
      Where 
      CharName=@Name 
      and Del='0')

--When Script is Executed, This will show the new items they have now after the change. 
Select CharID, ci.Type, ci.TypeID, i.ItemName, Bag, ci.Slot from PS_GameData.dbo.CharItems ci
                                       inner join PS_GameDefs.dbo.Items i
									   on ci.Type=i.Type and ci.TypeID = i.TypeID
  WHERE 
     CharID in ( SELECT
     CharID
     FROM 
     PS_GameData.dbo.Chars
     Where 
     CharName=@Name 
     and Del='0')