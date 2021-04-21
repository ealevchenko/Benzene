USE [KRR-PA-CNT-Oil]
GO

/****** Object:  Table [dbo].[Daily_Report_Benzene]    Script Date: 21.04.2021 20:18:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Daily_Report_Benzene](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tank] [int] NOT NULL,
	[start_dt] [datetime] NULL,
	[stop_dt] [datetime] NULL,
	[start_volume] [float] NULL,
	[start_volume15] [float] NULL,
	[start_mass] [float] NULL,
	[start_dens] [float] NULL,
	[start_dens15] [float] NULL,
	[stop_volume] [float] NULL,
	[stop_volume15] [float] NULL,
	[stop_mass] [float] NULL,
	[stop_dens] [float] NULL,
	[stop_dens15] [float] NULL,
	[dispensing_volume] [float] NULL,
	[dispensing_volume15] [float] NULL,
	[dispensing_mass] [float] NULL,
	[dispensing_dens] [float] NULL,
	[dispensing_dens15] [float] NULL,
	[deliverys_volume] [float] NULL,
	[deliverys_volume15] [float] NULL,
	[deliverys_mass] [float] NULL,
	[deliverys_dens] [float] NULL,
	[deliverys_dens15] [float] NULL,
 CONSTRAINT [PK_Daily_Report_Benzene] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO