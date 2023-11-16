
select *
into #char
from [PS_GameData].dbo.Chars 
where CharName = 'xxx'  -- Insert Player name between the ' '

update a
set PosX = 61.100
	,PosY = 1.892
	,Posz = 67.142
	,Map = 42
from [PS_GameData].dbo.Chars a
where a.UserUID in (select UserUID from #char)

/*
select *
from [PS_GameData].dbo.Chars a
where a.UserUID in (select UserUID from #char)
*/

drop table #char