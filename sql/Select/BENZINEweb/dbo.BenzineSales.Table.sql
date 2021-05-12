USE [BENZINEweb]
GO
/****** Object:  Table [dbo].[BenzineSales]    Script Date: 12.05.2021 20:37:00 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[OUTStartDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
