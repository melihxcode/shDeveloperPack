

select 
	*
from 
	PS_GameData.dbo.Chars with (nolock)
where CharID in (	SELECT 
						gc.CharID
					FROM [PS_GameData].[dbo].[GuildChars] gc with (nolock) 
						inner join [PS_GameData].[dbo].[Guilds] g with (nolock)
							on gc.GuildID = g.GuildID
					where GuildName = 'xxxx' -- guildname here in ''
					)
order by 
	UserID