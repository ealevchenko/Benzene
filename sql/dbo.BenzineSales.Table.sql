USE [BENZINEweb]
GO
/****** Object:  Table [dbo].[BenzineSales]    Script Date: 17.04.2021 17:53:21 ******/
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
INSERT [dbo].[BenzineSales] ([ID], [ResponsPerson], [TaraNumber], [OUTStartDT], [StartCounterVolume], [StartCounterMass], [StartT1Temperature], [StartT2Temperature], [StartT1Lvl], [StartT2Lvl], [StartT1Volume], [StartT2Volume], [StartT1Volume15], [StartT2Volume15], [StartT1Mass], [StartT2Mass], [OUTEndDT], [EndCounterVolume], [EndCounterMass], [EndT1Lvl], [EndT2Lvl], [EndT1Volume], [EndT2Volume], [EndT1Volume15], [EndT2Volume15], [EndT1Mass], [EndT2Mass], [EndT1Temperature], [EndT2Temperature], [ThisEmergencyStopped], [OutedVolume], [OutedVolume15], [OutedMass], [OutedTemp], [SAPsupply], [closeDT], [SAPsend]) VALUES (18, N'admin', N'59', CAST(N'2021-02-24T12:29:47.000' AS DateTime), 46452.9194129095, 46557.168247025889, 0, 4.2916665, -1, 2504, -20, 114200.57, -20.36313, 115694.08, -452.20227, 101422.445, CAST(N'2021-02-24T13:41:47.000' AS DateTime), 46452.9194129095, 46557.168247025889, -1, 2307, -20, 105220.72, -20.36313, 106663.22, -452.20227, 93400.94, 0, 3.6458333, 0, 0, 0, 0, 0, N'444222', CAST(N'2021-04-16T10:58:17.000' AS DateTime), CAST(N'2021-04-16T10:58:17.000' AS DateTime))
INSERT [dbo].[BenzineSales] ([ID], [ResponsPerson], [TaraNumber], [OUTStartDT], [StartCounterVolume], [StartCounterMass], [StartT1Temperature], [StartT2Temperature], [StartT1Lvl], [StartT2Lvl], [StartT1Volume], [StartT2Volume], [StartT1Volume15], [StartT2Volume15], [StartT1Mass], [StartT2Mass], [OUTEndDT], [EndCounterVolume], [EndCounterMass], [EndT1Lvl], [EndT2Lvl], [EndT1Volume], [EndT2Volume], [EndT1Volume15], [EndT2Volume15], [EndT1Mass], [EndT2Mass], [EndT1Temperature], [EndT2Temperature], [ThisEmergencyStopped], [OutedVolume], [OutedVolume15], [OutedMass], [OutedTemp], [SAPsupply], [closeDT], [SAPsend]) VALUES (25, N'admin', N'853', CAST(N'2021-02-26T07:56:44.000' AS DateTime), 110467.80198791369, 110572.05082203008, 0, 8.666667, 0, 2268, -20, 103993.41, -20.36313, 104834.94, -421.37036, 91508.45, CAST(N'2021-02-26T17:41:47.000' AS DateTime), 110467.80198791369, 174579.233234643, 0, 751, -20, 34469.066, -20.36313, 34576.26, -421.37036, 32371.936, 0, 12.875, 0, 145263.05, 147802.97, 64007.184, 0, N'444222', CAST(N'2021-04-16T10:58:17.000' AS DateTime), NULL)
INSERT [dbo].[BenzineSales] ([ID], [ResponsPerson], [TaraNumber], [OUTStartDT], [StartCounterVolume], [StartCounterMass], [StartT1Temperature], [StartT2Temperature], [StartT1Lvl], [StartT2Lvl], [StartT1Volume], [StartT2Volume], [StartT1Volume15], [StartT2Volume15], [StartT1Mass], [StartT2Mass], [OUTEndDT], [EndCounterVolume], [EndCounterMass], [EndT1Lvl], [EndT2Lvl], [EndT1Volume], [EndT2Volume], [EndT1Volume15], [EndT2Volume15], [EndT1Mass], [EndT2Mass], [EndT1Temperature], [EndT2Temperature], [ThisEmergencyStopped], [OutedVolume], [OutedVolume15], [OutedMass], [OutedTemp], [SAPsupply], [closeDT], [SAPsend]) VALUES (26, N'admin', N'', CAST(N'2021-03-02T09:57:15.187' AS DateTime), 174534.37176978588, 174638.62060390227, 0, 8.125, 0, 1591, -20, 73210.65, -20.36313, 73849.414, -453.2072, 63819.617, CAST(N'2021-03-02T09:58:59.100' AS DateTime), 174534.37176978588, 174638.62060390227, 0, 1592, -20, 73248.086, -20.36313, 73884.51, -453.2072, 63814.652, 0, 8.15625, 0, 0, 0, 0, 0, N'444222', CAST(N'2021-04-16T10:58:17.000' AS DateTime), NULL)
INSERT [dbo].[BenzineSales] ([ID], [ResponsPerson], [TaraNumber], [OUTStartDT], [StartCounterVolume], [StartCounterMass], [StartT1Temperature], [StartT2Temperature], [StartT1Lvl], [StartT2Lvl], [StartT1Volume], [StartT2Volume], [StartT1Volume15], [StartT2Volume15], [StartT1Mass], [StartT2Mass], [OUTEndDT], [EndCounterVolume], [EndCounterMass], [EndT1Lvl], [EndT2Lvl], [EndT1Volume], [EndT2Volume], [EndT1Volume15], [EndT2Volume15], [EndT1Mass], [EndT2Mass], [EndT1Temperature], [EndT2Temperature], [ThisEmergencyStopped], [OutedVolume], [OutedVolume15], [OutedMass], [OutedTemp], [SAPsupply], [closeDT], [SAPsend]) VALUES (27, N'marchenkoiv', N'1350', CAST(N'2021-04-12T15:05:36.287' AS DateTime), 174700.43773452516, 174804.68656864154, 0, 12.171875, 55, 4700, 2122.968, 214196.22, 2161.5137, 215049.72, 40877.055, 189996.94, CAST(N'2021-04-12T16:44:40.093' AS DateTime), 177086.93961450455, 177191.18844862093, 54, 3084, 2110.4614, 141127.62, 2148.78, 141476.47, 40615.168, 124969.59, 0, 13.458333, 0, 70380.28, 71610.88, 62671.55, 0, N'8002268497', CAST(N'2021-04-16T11:55:51.000' AS DateTime), NULL)
INSERT [dbo].[BenzineSales] ([ID], [ResponsPerson], [TaraNumber], [OUTStartDT], [StartCounterVolume], [StartCounterMass], [StartT1Temperature], [StartT2Temperature], [StartT1Lvl], [StartT2Lvl], [StartT1Volume], [StartT2Volume], [StartT1Volume15], [StartT2Volume15], [StartT1Mass], [StartT2Mass], [OUTEndDT], [EndCounterVolume], [EndCounterMass], [EndT1Lvl], [EndT2Lvl], [EndT1Volume], [EndT2Volume], [EndT1Volume15], [EndT2Volume15], [EndT1Mass], [EndT2Mass], [EndT1Temperature], [EndT2Temperature], [ThisEmergencyStopped], [OutedVolume], [OutedVolume15], [OutedMass], [OutedTemp], [SAPsupply], [closeDT], [SAPsend]) VALUES (28, N'admin', N'1350', CAST(N'2021-04-12T15:14:26.447' AS DateTime), 177086.93961450455, 177191.18844862093, 0, 12.265625, 56, 4637, 2160.4878, 211363.69, 2174.2473, 212182.61, 41664.363, 187510.52, CAST(N'2021-04-12T16:44:40.093' AS DateTime), 177086.93961450455, 177191.18844862093, 54, 3084, 2110.4614, 141127.62, 2148.78, 141476.47, 40615.168, 124969.59, 0, 13.458333, 0, 70380.28, 71610.88, 62671.55, 0, NULL, NULL, NULL)
INSERT [dbo].[BenzineSales] ([ID], [ResponsPerson], [TaraNumber], [OUTStartDT], [StartCounterVolume], [StartCounterMass], [StartT1Temperature], [StartT2Temperature], [StartT1Lvl], [StartT2Lvl], [StartT1Volume], [StartT2Volume], [StartT1Volume15], [StartT2Volume15], [StartT1Mass], [StartT2Mass], [OUTEndDT], [EndCounterVolume], [EndCounterMass], [EndT1Lvl], [EndT2Lvl], [EndT1Volume], [EndT2Volume], [EndT1Volume15], [EndT2Volume15], [EndT1Mass], [EndT2Mass], [EndT1Temperature], [EndT2Temperature], [ThisEmergencyStopped], [OutedVolume], [OutedVolume15], [OutedMass], [OutedTemp], [SAPsupply], [closeDT], [SAPsend]) VALUES (29, N'admin', N'1350', CAST(N'2021-04-13T11:26:36.857' AS DateTime), 239758.49549750454, 239862.74433162093, 0, 13.729167, 55, 3693, 2122.968, 168746.84, 2161.5137, 169097.64, 40877.055, 149670.11, CAST(N'2021-04-13T13:11:05.703' AS DateTime), 239758.49549750454, 239862.74433162093, 56, 2142, 2160.4878, 98250.266, 2212.4485, 98361.7, 41664.363, 87124.33, 0, 14.59375, 0, 70629.33, 71864.28, 62780.47, 0, NULL, NULL, NULL)
INSERT [dbo].[BenzineSales] ([ID], [ResponsPerson], [TaraNumber], [OUTStartDT], [StartCounterVolume], [StartCounterMass], [StartT1Temperature], [StartT2Temperature], [StartT1Lvl], [StartT2Lvl], [StartT1Volume], [StartT2Volume], [StartT1Volume15], [StartT2Volume15], [StartT1Mass], [StartT2Mass], [OUTEndDT], [EndCounterVolume], [EndCounterMass], [EndT1Lvl], [EndT2Lvl], [EndT1Volume], [EndT2Volume], [EndT1Volume15], [EndT2Volume15], [EndT1Mass], [EndT2Mass], [EndT1Temperature], [EndT2Temperature], [ThisEmergencyStopped], [OutedVolume], [OutedVolume15], [OutedMass], [OutedTemp], [SAPsupply], [closeDT], [SAPsend]) VALUES (30, N'admin', N'51182459', CAST(N'2021-04-16T09:51:40.713' AS DateTime), 302539.35982972896, 302643.60866384534, 14.25, 11.5625, 1824, 2281, 82707.99, 104581.35, 82835.31, 105072.91, 73421.41, 93121.32, CAST(N'2021-04-16T11:47:54.447' AS DateTime), 366758.65909742354, 366862.90793153993, 1870, 699, 84787.83, 32443.285, 84930.84, 32595.777, 75215.83, 29048.736, 14.125, 11.5625, 0, 71981.83, 73240.43, 64219.3, 0, N'8002268497', CAST(N'2021-04-16T15:31:12.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[BenzineSales] OFF
GO
/****** Object:  Index [UQ__BenzineS__E2EA4BE3B2C35A37]    Script Date: 17.04.2021 17:53:21 ******/
ALTER TABLE [dbo].[BenzineSales] ADD UNIQUE NONCLUSTERED 
(
	[OUTStartDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
