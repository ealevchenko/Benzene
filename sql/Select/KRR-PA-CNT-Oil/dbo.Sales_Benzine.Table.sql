USE [KRR-PA-CNT-Oil]
GO
/****** Object:  Table [dbo].[Sales_Benzine]    Script Date: 12.05.2021 20:43:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales_Benzine](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user] [nvarchar](50) NULL,
	[tara_number] [nvarchar](20) NULL,
	[sap_supply] [nvarchar](50) NULL,
	[start] [datetime] NOT NULL,
	[stop] [datetime] NULL,
	[start_temp_1] [float] NULL,
	[start_temp_2] [float] NULL,
	[start_level_1] [int] NULL,
	[start_level_2] [int] NULL,
	[start_volume_1] [float] NULL,
	[start_volume_2] [float] NULL,
	[start_volume15_1] [float] NULL,
	[start_volume15_2] [float] NULL,
	[start_mass_1] [float] NULL,
	[start_mass_2] [float] NULL,
	[stop_temp_1] [float] NULL,
	[stop_temp_2] [float] NULL,
	[stop_level_1] [int] NULL,
	[stop_level_2] [int] NULL,
	[stop_volume_1] [float] NULL,
	[stop_volume_2] [float] NULL,
	[stop_volume15_1] [float] NULL,
	[stop_volume15_2] [float] NULL,
	[stop_mass_1] [float] NULL,
	[stop_mass_2] [float] NULL,
	[stoped] [bit] NULL,
	[outed_volume] [float] NULL,
	[outed_volume15] [float] NULL,
	[outed_mass] [float] NULL,
	[outed_temp] [float] NULL,
	[outed_dens] [float] NULL,
	[outed_dens15] [float] NULL,
	[outed_level_1] [int] NULL,
	[outed_level_2] [int] NULL,
	[outed_tank] [varchar](4) NOT NULL,
	[close] [datetime] NULL,
	[send] [datetime] NULL,
 CONSTRAINT [PK_Sales_Benzine] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
