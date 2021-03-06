USE [BENZINEweb]
GO
/****** Object:  Table [dbo].[BenzineOilSwitchPump]    Script Date: 11.12.2020 13:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BenzineOilSwitchPump](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[state] [bit] NULL,
	[volume_counter] [float] NULL,
	[mass_counter] [float] NULL,
	[changeDT] [datetime] NULL,
 CONSTRAINT [PK_BenzineOilSwitchPump] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BenzineOilSwitchPump] ON 

INSERT [dbo].[BenzineOilSwitchPump] ([id], [state], [volume_counter], [mass_counter], [changeDT]) VALUES (19, 0, 150.7, 138.5, CAST(N'2020-11-25T11:13:49.000' AS DateTime))
INSERT [dbo].[BenzineOilSwitchPump] ([id], [state], [volume_counter], [mass_counter], [changeDT]) VALUES (20, 1, 150.7, 138.5, CAST(N'2020-11-25T11:13:51.000' AS DateTime))
INSERT [dbo].[BenzineOilSwitchPump] ([id], [state], [volume_counter], [mass_counter], [changeDT]) VALUES (21, 0, 150.7, 138.5, CAST(N'2020-11-25T11:13:52.000' AS DateTime))
INSERT [dbo].[BenzineOilSwitchPump] ([id], [state], [volume_counter], [mass_counter], [changeDT]) VALUES (22, 1, 150.7, 138.5, CAST(N'2020-11-25T11:13:54.000' AS DateTime))
INSERT [dbo].[BenzineOilSwitchPump] ([id], [state], [volume_counter], [mass_counter], [changeDT]) VALUES (23, 0, 150.7, 138.5, CAST(N'2020-11-25T11:13:56.000' AS DateTime))
INSERT [dbo].[BenzineOilSwitchPump] ([id], [state], [volume_counter], [mass_counter], [changeDT]) VALUES (24, 1, 150.7, 138.5, CAST(N'2020-11-25T11:13:57.000' AS DateTime))
INSERT [dbo].[BenzineOilSwitchPump] ([id], [state], [volume_counter], [mass_counter], [changeDT]) VALUES (25, 0, 150.7, 138.5, CAST(N'2020-11-25T11:15:05.000' AS DateTime))
INSERT [dbo].[BenzineOilSwitchPump] ([id], [state], [volume_counter], [mass_counter], [changeDT]) VALUES (26, 1, 150.7, 138.5, CAST(N'2020-11-25T11:15:06.000' AS DateTime))
INSERT [dbo].[BenzineOilSwitchPump] ([id], [state], [volume_counter], [mass_counter], [changeDT]) VALUES (27, 0, 150.7, 138.5, CAST(N'2020-11-25T11:15:08.000' AS DateTime))
INSERT [dbo].[BenzineOilSwitchPump] ([id], [state], [volume_counter], [mass_counter], [changeDT]) VALUES (28, 1, 150.7, 138.5, CAST(N'2020-11-25T11:15:09.000' AS DateTime))
INSERT [dbo].[BenzineOilSwitchPump] ([id], [state], [volume_counter], [mass_counter], [changeDT]) VALUES (29, 1, 150.7, 138.5, CAST(N'2020-11-26T11:38:18.000' AS DateTime))
INSERT [dbo].[BenzineOilSwitchPump] ([id], [state], [volume_counter], [mass_counter], [changeDT]) VALUES (30, 1, 0, 0, CAST(N'2020-11-26T11:46:05.000' AS DateTime))
INSERT [dbo].[BenzineOilSwitchPump] ([id], [state], [volume_counter], [mass_counter], [changeDT]) VALUES (31, 1, 0, 0, CAST(N'2020-11-26T11:48:53.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[BenzineOilSwitchPump] OFF
/****** Object:  Index [UQ__BenzineO__1A3BCC817D01306F]    Script Date: 11.12.2020 13:23:56 ******/
ALTER TABLE [dbo].[BenzineOilSwitchPump] ADD UNIQUE NONCLUSTERED 
(
	[changeDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
