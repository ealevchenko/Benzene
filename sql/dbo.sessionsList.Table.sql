USE [BENZINEweb]
GO
/****** Object:  Table [dbo].[sessionsList]    Script Date: 11.12.2020 13:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sessionsList](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [nvarchar](60) NULL,
	[token] [nchar](30) NULL,
	[sessionStart] [datetime] NULL,
	[sessionExpired] [datetime] NULL,
	[user_privilegie] [int] NULL,
 CONSTRAINT [PK_sessionsList] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[sessionsList] ON 

INSERT [dbo].[sessionsList] ([ID], [user_name], [token], [sessionStart], [sessionExpired], [user_privilegie]) VALUES (7, N'admin', N'>=/0MN/D/A_/60C4|TR00U00VN7VK2', CAST(N'2020-11-18T09:20:27.000' AS DateTime), CAST(N'2020-11-18T10:20:27.000' AS DateTime), 0)
INSERT [dbo].[sessionsList] ([ID], [user_name], [token], [sessionStart], [sessionExpired], [user_privilegie]) VALUES (8, N'admin', N'R>A__UH<16YQ77V4GL6ZT2LL1V7N!7', CAST(N'2020-11-18T11:46:06.000' AS DateTime), CAST(N'2020-11-18T11:46:17.000' AS DateTime), 0)
INSERT [dbo].[sessionsList] ([ID], [user_name], [token], [sessionStart], [sessionExpired], [user_privilegie]) VALUES (9, N'admin', N'/CA-Q<!!MW0NNUIFOYN74DA>MD>JRH', CAST(N'2020-11-18T11:49:03.000' AS DateTime), CAST(N'2020-11-18T12:49:03.000' AS DateTime), 0)
INSERT [dbo].[sessionsList] ([ID], [user_name], [token], [sessionStart], [sessionExpired], [user_privilegie]) VALUES (10, N'admin', N'2-U0JOC!83FOY>XLYA80/KMPRFID3!', CAST(N'2020-11-18T13:36:14.000' AS DateTime), CAST(N'2020-11-18T13:36:36.000' AS DateTime), 0)
INSERT [dbo].[sessionsList] ([ID], [user_name], [token], [sessionStart], [sessionExpired], [user_privilegie]) VALUES (11, N'admin', N'XQX_GP!QUF=|8Q8K1C6NS8!=G|F3*M', CAST(N'2020-11-18T13:45:46.000' AS DateTime), CAST(N'2020-11-18T13:45:52.000' AS DateTime), 0)
INSERT [dbo].[sessionsList] ([ID], [user_name], [token], [sessionStart], [sessionExpired], [user_privilegie]) VALUES (12, N'admin', N'M<MW|FVFQGQQ38GWL|8U+VAABO-3Q=', CAST(N'2020-11-18T14:10:00.000' AS DateTime), CAST(N'2020-11-18T15:10:00.000' AS DateTime), 0)
INSERT [dbo].[sessionsList] ([ID], [user_name], [token], [sessionStart], [sessionExpired], [user_privilegie]) VALUES (13, N'admin', N'JO<EUSZ8HAK61HAS7ZAM_A1Q=HVJ3R', CAST(N'2020-11-19T09:25:05.000' AS DateTime), CAST(N'2020-11-19T10:25:05.000' AS DateTime), 0)
INSERT [dbo].[sessionsList] ([ID], [user_name], [token], [sessionStart], [sessionExpired], [user_privilegie]) VALUES (14, N'admin', N'V7O34S<UTXEHB>T9_=K9GJC4<-QI|G', CAST(N'2020-11-20T09:58:56.000' AS DateTime), CAST(N'2020-11-20T10:01:05.000' AS DateTime), 0)
INSERT [dbo].[sessionsList] ([ID], [user_name], [token], [sessionStart], [sessionExpired], [user_privilegie]) VALUES (15, N'responseUser', N'N34>--RSCWUYJ|GWG9W/M3ICMRYDE>', CAST(N'2020-11-20T10:01:19.000' AS DateTime), CAST(N'2020-11-20T10:34:58.000' AS DateTime), 1)
INSERT [dbo].[sessionsList] ([ID], [user_name], [token], [sessionStart], [sessionExpired], [user_privilegie]) VALUES (16, N'responseUser', N'_*M0W=VQ|O_9ZKS8RF!RD*N4*2_JO+', CAST(N'2020-11-20T10:35:21.000' AS DateTime), CAST(N'2020-11-20T10:35:27.000' AS DateTime), 1)
INSERT [dbo].[sessionsList] ([ID], [user_name], [token], [sessionStart], [sessionExpired], [user_privilegie]) VALUES (17, N'admin', N'KZ=>ZWA9-3N6/RN*AG!ZGLGMCB1P5L', CAST(N'2020-11-20T10:35:36.000' AS DateTime), CAST(N'2020-11-20T10:36:00.000' AS DateTime), 0)
INSERT [dbo].[sessionsList] ([ID], [user_name], [token], [sessionStart], [sessionExpired], [user_privilegie]) VALUES (18, N'admin', N'CK!R++*CCH!7M9WWHBCULX482=XLM+', CAST(N'2020-11-20T10:40:56.000' AS DateTime), CAST(N'2020-11-20T10:41:22.000' AS DateTime), 0)
INSERT [dbo].[sessionsList] ([ID], [user_name], [token], [sessionStart], [sessionExpired], [user_privilegie]) VALUES (19, N'admin', N'<UZ*I4B!N*W9KA|C+0EH!8O2A>9ZCG', CAST(N'2020-11-20T10:41:29.000' AS DateTime), CAST(N'2020-11-20T12:41:29.000' AS DateTime), 0)
INSERT [dbo].[sessionsList] ([ID], [user_name], [token], [sessionStart], [sessionExpired], [user_privilegie]) VALUES (20, N'admin', N'T5B1SLQRXQ2LUX+Y-TZ848DK8T2F7U', CAST(N'2020-11-20T15:56:11.000' AS DateTime), CAST(N'2020-11-20T17:56:11.000' AS DateTime), 0)
INSERT [dbo].[sessionsList] ([ID], [user_name], [token], [sessionStart], [sessionExpired], [user_privilegie]) VALUES (21, N'admin', N'NT00VRIY8|G!6|U0=E|BSH96-C<P<S', CAST(N'2020-11-23T08:51:14.000' AS DateTime), CAST(N'2020-11-23T10:51:14.000' AS DateTime), 0)
INSERT [dbo].[sessionsList] ([ID], [user_name], [token], [sessionStart], [sessionExpired], [user_privilegie]) VALUES (22, N'admin', N'HI/5DU<G_8WX!OZBTU/LAWYO43WV7V', CAST(N'2020-11-23T10:58:24.000' AS DateTime), CAST(N'2020-11-23T12:58:24.000' AS DateTime), 0)
INSERT [dbo].[sessionsList] ([ID], [user_name], [token], [sessionStart], [sessionExpired], [user_privilegie]) VALUES (23, N'admin', N'GF>MCTAS2>R0|3W<0_80C!7BR6>1H!', CAST(N'2020-11-23T14:44:37.000' AS DateTime), CAST(N'2020-11-23T16:44:37.000' AS DateTime), 0)
INSERT [dbo].[sessionsList] ([ID], [user_name], [token], [sessionStart], [sessionExpired], [user_privilegie]) VALUES (1020, N'admin', N'3ZDFNOVY9OVG>3LZTWKE*S8S|2D>=W', CAST(N'2020-11-24T13:53:23.000' AS DateTime), CAST(N'2020-11-24T13:53:31.000' AS DateTime), 0)
INSERT [dbo].[sessionsList] ([ID], [user_name], [token], [sessionStart], [sessionExpired], [user_privilegie]) VALUES (1021, N'responseUser', N'M6>+72OOBI1CQ10_F18/5J/CHW04PI', CAST(N'2020-11-24T13:53:38.000' AS DateTime), CAST(N'2020-11-24T14:53:38.000' AS DateTime), 1)
INSERT [dbo].[sessionsList] ([ID], [user_name], [token], [sessionStart], [sessionExpired], [user_privilegie]) VALUES (1022, N'admin', N'LY95KCK-BZ63=DRRIRRS8F|VAETCTR', CAST(N'2020-11-24T15:09:36.000' AS DateTime), CAST(N'2020-11-24T15:09:46.000' AS DateTime), 0)
INSERT [dbo].[sessionsList] ([ID], [user_name], [token], [sessionStart], [sessionExpired], [user_privilegie]) VALUES (1023, N'responseUser', N'12_S8/-DLR|8E<8L=7YO7GK7/DBJLG', CAST(N'2020-11-24T15:09:54.000' AS DateTime), CAST(N'2020-11-24T16:09:54.000' AS DateTime), 1)
INSERT [dbo].[sessionsList] ([ID], [user_name], [token], [sessionStart], [sessionExpired], [user_privilegie]) VALUES (1024, N'admin', N'B!/5VSSRM3++!H>55+DCR6PN0I5!0-', CAST(N'2020-11-26T09:24:34.000' AS DateTime), CAST(N'2020-11-26T10:56:06.000' AS DateTime), 0)
INSERT [dbo].[sessionsList] ([ID], [user_name], [token], [sessionStart], [sessionExpired], [user_privilegie]) VALUES (1025, N'admin', N'S>MK0DKILWZQ>67B2>9GKNUELT99SV', CAST(N'2020-11-26T10:55:06.000' AS DateTime), CAST(N'2020-11-26T12:55:06.000' AS DateTime), 0)
INSERT [dbo].[sessionsList] ([ID], [user_name], [token], [sessionStart], [sessionExpired], [user_privilegie]) VALUES (1026, N'admin', N'|YLHJ94IGP-ILDTM4WQOD0EA!*0W+K', CAST(N'2020-11-26T10:57:29.000' AS DateTime), CAST(N'2020-11-26T12:57:29.000' AS DateTime), 0)
INSERT [dbo].[sessionsList] ([ID], [user_name], [token], [sessionStart], [sessionExpired], [user_privilegie]) VALUES (1027, N'admin', N'8M8QHEAK3G2FM9YLWCJFS3V*>6TRTR', CAST(N'2020-11-26T13:38:55.000' AS DateTime), CAST(N'2020-11-26T15:38:55.000' AS DateTime), 0)
INSERT [dbo].[sessionsList] ([ID], [user_name], [token], [sessionStart], [sessionExpired], [user_privilegie]) VALUES (1028, N'admin', N'W71CG=ZMEN|SDFH1X27MM!B856LQR=', CAST(N'2020-11-27T09:29:07.000' AS DateTime), CAST(N'2020-11-27T11:29:07.000' AS DateTime), 0)
INSERT [dbo].[sessionsList] ([ID], [user_name], [token], [sessionStart], [sessionExpired], [user_privilegie]) VALUES (1029, N'admin', N'TAEPUIKVC-A/4/S1Z<1LV1NRE!2PX+', CAST(N'2020-11-27T11:46:16.000' AS DateTime), CAST(N'2020-11-27T13:46:16.000' AS DateTime), 0)
INSERT [dbo].[sessionsList] ([ID], [user_name], [token], [sessionStart], [sessionExpired], [user_privilegie]) VALUES (1030, N'admin', N'TY=<J9D1CZ+9SX>2VIQP-6*7LX-/HI', CAST(N'2020-11-27T13:46:39.000' AS DateTime), CAST(N'2020-11-27T15:46:39.000' AS DateTime), 0)
INSERT [dbo].[sessionsList] ([ID], [user_name], [token], [sessionStart], [sessionExpired], [user_privilegie]) VALUES (1031, N'admin', N'0PX_|S8A|I9YBS8W!28P*70PMMI/6R', CAST(N'2020-11-27T15:59:09.000' AS DateTime), CAST(N'2020-11-27T17:59:09.000' AS DateTime), 0)
INSERT [dbo].[sessionsList] ([ID], [user_name], [token], [sessionStart], [sessionExpired], [user_privilegie]) VALUES (2031, N'admin', N'<O03EJZ3J32X8AMG!C8S<!+DRX1Z6H', CAST(N'2020-12-01T08:32:01.000' AS DateTime), CAST(N'2020-12-01T10:32:01.000' AS DateTime), 0)
INSERT [dbo].[sessionsList] ([ID], [user_name], [token], [sessionStart], [sessionExpired], [user_privilegie]) VALUES (2032, N'admin', N'BI+4|_DO*ULD9FKZZ*HYW|WRX>_*U0', CAST(N'2020-12-01T10:46:24.000' AS DateTime), CAST(N'2020-12-01T12:46:24.000' AS DateTime), 0)
INSERT [dbo].[sessionsList] ([ID], [user_name], [token], [sessionStart], [sessionExpired], [user_privilegie]) VALUES (2033, N'admin', N'KKX7>P!2+*NJ-489GW2O<ZTF7R<RDK', CAST(N'2020-12-01T15:11:27.000' AS DateTime), CAST(N'2020-12-01T17:11:27.000' AS DateTime), 0)
INSERT [dbo].[sessionsList] ([ID], [user_name], [token], [sessionStart], [sessionExpired], [user_privilegie]) VALUES (2034, N'admin', N'Q8D8D41-AKOWSX_D8C+BD6K60F68EW', CAST(N'2020-12-01T15:50:02.000' AS DateTime), CAST(N'2020-12-01T17:50:02.000' AS DateTime), 0)
INSERT [dbo].[sessionsList] ([ID], [user_name], [token], [sessionStart], [sessionExpired], [user_privilegie]) VALUES (2035, N'admin', N'VT>+89J9JYG-QEJ9L/QJIMK>HI<68J', CAST(N'2020-12-01T15:57:27.000' AS DateTime), CAST(N'2020-12-01T15:59:39.000' AS DateTime), 0)
INSERT [dbo].[sessionsList] ([ID], [user_name], [token], [sessionStart], [sessionExpired], [user_privilegie]) VALUES (2036, N'admin', N'<628OG591O1VXN=ZNNGJ244*AKY!W*', CAST(N'2020-12-08T08:40:11.000' AS DateTime), CAST(N'2020-12-08T10:40:11.000' AS DateTime), 0)
INSERT [dbo].[sessionsList] ([ID], [user_name], [token], [sessionStart], [sessionExpired], [user_privilegie]) VALUES (2037, N'admin', N'FDU9J7<F4ON3S9D<3O>BPL=EUZEUDH', CAST(N'2020-12-09T13:44:01.000' AS DateTime), CAST(N'2020-12-09T15:44:01.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[sessionsList] OFF
