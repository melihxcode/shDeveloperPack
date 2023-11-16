SELECT A.[UserUID], A.[UserID], B.[CharName] 
FROM [PS_userdata].[dbo].[Users_Master] A 
INNER JOIN [PS_GameData].[dbo].[Chars] B 
ON B.[UserUID] = A.[UserUID] 
ORDER BY A.[UserUID]