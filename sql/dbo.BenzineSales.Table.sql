USE [BENZINEweb]
GO
/****** Object:  Table [dbo].[BenzineSales]    Script Date: 11.12.2020 13:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BenzineSales](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ResponsPerson] [nvarchar](50) NULL,
	[TaraNumber] [nvarchar](20) NULL,
	[OUTStartDT] [datetime] NOT NULL,
	[StartCounterVolume] [float] NULL,
	[StartCounterMass] [float] NULL,
	[StartT1Temperature] [float] NULL,
	[StartT2Temperature] [float] NULL,
	[StartT1Lvl] [int] NULL,
	[StartT2Lvl] [int] NULL,
	[StartT1Volume] [float] NULL,
	[StartT2Volume] [float] NULL,
	[StartT1Volume15] [float] NULL,
	[StartT2Volume15] [float] NULL,
	[StartT1Mass] [float] NULL,
	[StartT2Mass] [float] NULL,
	[OUTEndDT] [datetime] NULL,
	[EndCounterVolume] [float] NULL,
	[EndCounterMass] [float] NULL,
	[EndT1Lvl] [int] NULL,
	[EndT2Lvl] [int] NULL,
	[EndT1Volume] [float] NULL,
	[EndT2Volume] [float] NULL,
	[EndT1Volume15] [float] NULL,
	[EndT2Volume15] [float] NULL,
	[EndT1Mass] [float] NULL,
	[EndT2Mass] [float] NULL,
	[EndT1Temperature] [float] NULL,
	[EndT2Temperature] [float] NULL,
	[ThisEmergencyStopped] [bit] NULL,
	[OutedVolume] [float] NULL,
	[OutedVolume15] [float] NULL,
	[OutedMass] [float] NULL,
	[OutedTemp] [float] NULL,
	[SAPsupply] [nvarchar](50) NULL,
	[closeDT] [datetime] NULL,
	[SAPsend] [datetime] NULL,
 CONSTRAINT [PK_BenzineSales] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BenzineSales] ON 

INSERT [dbo].[BenzineSales] ([ID], [ResponsPerson], [TaraNumber], [OUTStartDT], [StartCounterVolume], [StartCounterMass], [StartT1Temperature], [StartT2Temperature], [StartT1Lvl], [StartT2Lvl], [StartT1Volume], [StartT2Volume], [StartT1Volume15], [StartT2Volume15], [StartT1Mass], [StartT2Mass], [OUTEndDT], [EndCounterVolume], [EndCounterMass], [EndT1Lvl], [EndT2Lvl], [EndT1Volume], [EndT2Volume], [EndT1Volume15], [EndT2Volume15], [EndT1Mass], [EndT2Mass], [EndT1Temperature], [EndT2Temperature], [ThisEmergencyStopped], [OutedVolume], [OutedVolume15], [OutedMass], [OutedTemp], [SAPsupply], [closeDT], [SAPsend]) VALUES (7, N'responseUser', N'258', CAST(N'2020-11-24T12:02:26.000' AS DateTime), 0, 0, 0, 0, 5694, 1, 249112.5, 118.125, 253635.52, 120.26974, 0, 0, CAST(N'2020-11-24T12:02:34.000' AS DateTime), 0, 0, 5694, 1, 249112.5, 118.125, 253635.52, 120.26974, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'4343876', CAST(N'2020-11-24T14:05:20.000' AS DateTime), CAST(N'2020-11-24T14:05:21.000' AS DateTime))
INSERT [dbo].[BenzineSales] ([ID], [ResponsPerson], [TaraNumber], [OUTStartDT], [StartCounterVolume], [StartCounterMass], [StartT1Temperature], [StartT2Temperature], [StartT1Lvl], [StartT2Lvl], [StartT1Volume], [StartT2Volume], [StartT1Volume15], [StartT2Volume15], [StartT1Mass], [StartT2Mass], [OUTEndDT], [EndCounterVolume], [EndCounterMass], [EndT1Lvl], [EndT2Lvl], [EndT1Volume], [EndT2Volume], [EndT1Volume15], [EndT2Volume15], [EndT1Mass], [EndT2Mass], [EndT1Temperature], [EndT2Temperature], [ThisEmergencyStopped], [OutedVolume], [OutedVolume15], [OutedMass], [OutedTemp], [SAPsupply], [closeDT], [SAPsend]) VALUES (9, N'responseUser', N'258', CAST(N'2020-11-24T12:17:51.000' AS DateTime), 0, 0, 0, 0, 5694, 1, 249112.5, 118.125, 253635.52, 120.26974, 0, 0, CAST(N'2020-11-24T12:20:08.000' AS DateTime), 0, 0, 5694, 1, 249112.5, 118.125, 253635.52, 120.26974, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'5555', CAST(N'2020-11-24T14:20:27.000' AS DateTime), CAST(N'2020-11-24T14:20:27.000' AS DateTime))
INSERT [dbo].[BenzineSales] ([ID], [ResponsPerson], [TaraNumber], [OUTStartDT], [StartCounterVolume], [StartCounterMass], [StartT1Temperature], [StartT2Temperature], [StartT1Lvl], [StartT2Lvl], [StartT1Volume], [StartT2Volume], [StartT1Volume15], [StartT2Volume15], [StartT1Mass], [StartT2Mass], [OUTEndDT], [EndCounterVolume], [EndCounterMass], [EndT1Lvl], [EndT2Lvl], [EndT1Volume], [EndT2Volume], [EndT1Volume15], [EndT2Volume15], [EndT1Mass], [EndT2Mass], [EndT1Temperature], [EndT2Temperature], [ThisEmergencyStopped], [OutedVolume], [OutedVolume15], [OutedMass], [OutedTemp], [SAPsupply], [closeDT], [SAPsend]) VALUES (11, N'responseUser', N'258', CAST(N'2020-11-24T13:08:18.000' AS DateTime), 150.7, 138.5, 0, 0, 5694, 1, 249112.5, 118.125, 253635.52, 120.26974, 0, 0, CAST(N'2020-11-24T13:08:51.000' AS DateTime), 150.7, 138.5, 5694, 1, 249112.5, 118.125, 253635.52, 120.26974, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'34567', CAST(N'2020-11-24T15:10:01.000' AS DateTime), CAST(N'2020-11-24T15:10:02.000' AS DateTime))
INSERT [dbo].[BenzineSales] ([ID], [ResponsPerson], [TaraNumber], [OUTStartDT], [StartCounterVolume], [StartCounterMass], [StartT1Temperature], [StartT2Temperature], [StartT1Lvl], [StartT2Lvl], [StartT1Volume], [StartT2Volume], [StartT1Volume15], [StartT2Volume15], [StartT1Mass], [StartT2Mass], [OUTEndDT], [EndCounterVolume], [EndCounterMass], [EndT1Lvl], [EndT2Lvl], [EndT1Volume], [EndT2Volume], [EndT1Volume15], [EndT2Volume15], [EndT1Mass], [EndT2Mass], [EndT1Temperature], [EndT2Temperature], [ThisEmergencyStopped], [OutedVolume], [OutedVolume15], [OutedMass], [OutedTemp], [SAPsupply], [closeDT], [SAPsend]) VALUES (13, N'responseUser', N'259', CAST(N'2020-11-24T13:11:24.000' AS DateTime), 150.7, 138.5, 0, 0, 5694, 1, 249112.5, 118.125, 253635.52, 120.26974, 0, 0, CAST(N'2020-11-24T13:11:34.000' AS DateTime), 150.7, 138.5, 5694, 1, 249112.5, 118.125, 253635.52, 120.26974, 0, 0, 0, 0, 1, 0, 0, 0, 0, N'00000', CAST(N'2020-11-24T15:12:44.000' AS DateTime), CAST(N'2020-11-24T15:12:44.000' AS DateTime))
INSERT [dbo].[BenzineSales] ([ID], [ResponsPerson], [TaraNumber], [OUTStartDT], [StartCounterVolume], [StartCounterMass], [StartT1Temperature], [StartT2Temperature], [StartT1Lvl], [StartT2Lvl], [StartT1Volume], [StartT2Volume], [StartT1Volume15], [StartT2Volume15], [StartT1Mass], [StartT2Mass], [OUTEndDT], [EndCounterVolume], [EndCounterMass], [EndT1Lvl], [EndT2Lvl], [EndT1Volume], [EndT2Volume], [EndT1Volume15], [EndT2Volume15], [EndT1Mass], [EndT2Mass], [EndT1Temperature], [EndT2Temperature], [ThisEmergencyStopped], [OutedVolume], [OutedVolume15], [OutedMass], [OutedTemp], [SAPsupply], [closeDT], [SAPsend]) VALUES (17, N'admin', N'369', CAST(N'2020-11-26T09:49:20.000' AS DateTime), 0, 0, 0, 0, 3672, 1, 160650, 118.125, 163566.84, 120.26974, 0, 0, CAST(N'2020-11-26T09:49:26.000' AS DateTime), 0, 0, 3672, 1, 160650, 118.125, 163566.84, 120.26974, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'987654', CAST(N'2020-11-26T11:49:52.000' AS DateTime), CAST(N'2020-11-26T11:49:53.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[BenzineSales] OFF
/****** Object:  Index [UQ__BenzineS__E2EA4BE3B2C35A37]    Script Date: 11.12.2020 13:23:56 ******/
ALTER TABLE [dbo].[BenzineSales] ADD UNIQUE NONCLUSTERED 
(
	[OUTStartDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
