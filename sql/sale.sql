USE [BENZINEweb]
GO

/****** Object:  Table [dbo].[BenzineSales]    Script Date: 26.11.2020 14:35:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[BenzineSales](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ResponsPerson] [nvarchar](50) NULL,/*ответсвенное лицо от цеха*/
	[TaraNumber] [nvarchar](20) NULL,/*номер тары для налива*/
	[OUTStartDT] [datetime] NOT NULL,/*дата время начала выдачи*/
	[StartCounterVolume] [float] NULL,/*накопленный счетчик обьема расходомера в начале выдачи*/
	[StartCounterMass] [float] NULL,/*накопленный счетчик массы расходомера */
	[StartT1Temperature] [float] NULL,/*температура в емкости 1 в начале выдачи*/
	[StartT2Temperature] [float] NULL,/*температура в емкости 2*/
	[StartT1Lvl] [int] NULL,/*уровень в емкости 1, начало выдачи*/
	[StartT2Lvl] [int] NULL,/*уровень в 2 емкости*/
	[StartT1Volume] [float] NULL,/*обьем БЕНЗОЛА в емкости 1, начало выдачи литры*/
	[StartT2Volume] [float] NULL,/*обьем в емкости 2*/
	[StartT1Volume15] [float] NULL,/*температура в емкости 1,начало выдачи*/
	[StartT2Volume15] [float] NULL,/*температура в емкости 2*/
	[StartT1Mass] [float] NULL,/*масса бензола в емкости1,начало выдачи кг*/
	[StartT2Mass] [float] NULL,/*масса в емкости 2*/
	[OUTEndDT] [datetime] NULL,/*время дата завершения выдачи*/
	[EndCounterVolume] [float] NULL,/*накопленный счетчик обьема расходомера в конце выдачи*/
	[EndCounterMass] [float] NULL,/*накопленный счетчик массы расходомера в конце выдачи*/
	[EndT1Lvl] [int] NULL,/*уровень в емкости 1, конец выдачи*/
	[EndT2Lvl] [int] NULL,/*уровень в 2 емкости, конец выдачи*/
	[EndT1Volume] [float] NULL,/*обьем БЕНЗОЛА в емкости 1, конец выдачи литры*/
	[EndT2Volume] [float] NULL,/*обьем в емкости 2, конец выдачи*/
	[EndT1Volume15] [float] NULL,/*обьем БЕНЗОЛА в емкости 1, конец выдачи литрыб к 15 гр*/
	[EndT2Volume15] [float] NULL,/*обьем в емкости 2, конец выдачи к 15 гр*/
	[EndT1Mass] [float] NULL,/*масса бензола в емкости1,конец выдачи кг*/
	[EndT2Mass] [float] NULL,/*масса в емкости 2,конец выдачи */
	[EndT1Temperature] [float] NULL,/*температура в емкости 1,конец выдачи*/
	[EndT2Temperature] [float] NULL,/*температура в емкости 2,конец выдачи*/
	[ThisEmergencyStopped] [bit] NULL,/*флаг аварийности выдачи (протечка)*/
	[OutedVolume] [float] NULL,/*выданно всего литров*/
	[OutedVolume15] [float] NULL,/*выданно всего, приведенные к 15*/
	[OutedMass] [float] NULL,/*выданно всего кг*/
	[OutedTemp] [float] NULL,/*усредненная температура жидкости за выдачу*/
	[SAPsupply] [nvarchar](50) NULL,/*номер поставки SAP*/
	[closeDT] [datetime] NULL,/*дата время присвоения номера поставки SAP*/
	[SAPsend] [datetime] NULL,/*дата время передачи данных в SAP*/
 CONSTRAINT [PK_BenzineSales] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[OUTStartDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


