-- 1. First: Put Character Name in.
Declare @Name as varchar(255)
Set @Name='xxxx' --Place Character name of the person here.

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