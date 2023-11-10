USE [PS_GameData]
GO

/****** Object: Index [IX_Chars_CharName] Script Date: 10/07/2011 17:15:26 ******/
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Chars]') AND name = N'IX_Chars_CharName')
DROP INDEX [IX_Chars_CharName] ON [dbo].[Chars] WITH ( ONLINE = OFF )
GO

USE [PS_GameData]
GO

/****** Object: Index [IX_Chars_CharName] Script Date: 10/07/2011 17:15:27 ******/
CREATE NONCLUSTERED INDEX [IX_Chars_CharName] ON [dbo].[Chars]
(
[CharName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY] 