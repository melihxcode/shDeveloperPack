USE [PS_GameData]
GO
/****** Object:  Table [dbo].[Chars]    Script Date: 09/05/2011 13:22:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Chars](
	[ServerID] [tinyint] NOT NULL,
	[UserID] [varchar](12) NOT NULL,
	[UserUID] [int] NOT NULL,
	[CharID] [int] IDENTITY(1,1) NOT NULL,
	[CharName] [varchar](30) NOT NULL,
	[New] [tinyint] NOT NULL CONSTRAINT [DF_Chars_New]  DEFAULT (1),
	[Del] [tinyint] NOT NULL CONSTRAINT [DF_Chars_Del]  DEFAULT (0),
	[Slot] [tinyint] NOT NULL,
	[Family] [tinyint] NOT NULL,
	[Grow] [tinyint] NOT NULL,
	[Hair] [tinyint] NOT NULL,
	[Face] [tinyint] NOT NULL,
	[Size] [tinyint] NOT NULL,
	[Job] [tinyint] NOT NULL,
	[Sex] [tinyint] NOT NULL,
	[Level] [smallint] NOT NULL CONSTRAINT [DF_Chars_level]  DEFAULT (0),
	[StatPoint] [smallint] NOT NULL CONSTRAINT [DF_Chars_StatPoint]  DEFAULT (0),
	[SkillPoint] [smallint] NOT NULL CONSTRAINT [DF_Chars_SkillPoint]  DEFAULT (0),
	[Str] [smallint] NOT NULL,
	[Dex] [smallint] NOT NULL,
	[Rec] [smallint] NOT NULL,
	[Int] [smallint] NOT NULL,
	[Luc] [smallint] NOT NULL,
	[Wis] [smallint] NOT NULL,
	[HP] [smallint] NOT NULL,
	[MP] [smallint] NOT NULL,
	[SP] [smallint] NOT NULL,
	[Map] [smallint] NOT NULL CONSTRAINT [DF_Chars_map]  DEFAULT (0),
	[Dir] [smallint] NOT NULL CONSTRAINT [DF_Chars_dir]  DEFAULT (0),
	[Exp] [int] NOT NULL CONSTRAINT [DF_Chars_exp]  DEFAULT (0),
	[Money] [int] NOT NULL CONSTRAINT [DF_Chars_money]  DEFAULT (0),
	[PosX] [real] NOT NULL CONSTRAINT [DF_Chars_posx]  DEFAULT (674.442),
	[PosY] [real] NOT NULL CONSTRAINT [DF_Chars_posy]  DEFAULT (3.640),
	[Posz] [real] NOT NULL CONSTRAINT [DF_Chars_posz]  DEFAULT (1000.924),
	[Hg] [smallint] NOT NULL,
	[Vg] [smallint] NOT NULL,
	[Cg] [tinyint] NOT NULL,
	[Og] [tinyint] NOT NULL,
	[Ig] [tinyint] NOT NULL,
	[K1] [int] NOT NULL CONSTRAINT [DF_Chars_K1]  DEFAULT ((0)),
	[K2] [int] NOT NULL CONSTRAINT [DF_Chars_K2]  DEFAULT (0),
	[K3] [int] NOT NULL CONSTRAINT [DF_Chars_K3]  DEFAULT (0),
	[K4] [int] NOT NULL CONSTRAINT [DF_Chars_K4]  DEFAULT (0),
	[KillLevel] [tinyint] NOT NULL CONSTRAINT [DF_Chars_KillLevel]  DEFAULT (0),
	[DeadLevel] [tinyint] NOT NULL CONSTRAINT [DF_Chars_DeadLevel]  DEFAULT (0),
	[RegDate] [datetime] NOT NULL CONSTRAINT [DF_Chars_RegDate]  DEFAULT (getdate()),
	[DeleteDate] [datetime] NULL,
	[JoinDate] [datetime] NULL,
	[LeaveDate] [datetime] NULL,
	[RenameCnt] [tinyint] NOT NULL,
	[OldCharName] [varchar](30) NULL,
	[RemainTime] [int] NOT NULL CONSTRAINT [DF_Chars_RemainTime]  DEFAULT (0),
 CONSTRAINT [PK_Chars] PRIMARY KEY CLUSTERED 
(
	[CharID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF