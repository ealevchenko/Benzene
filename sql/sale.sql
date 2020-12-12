USE [BENZINEweb]
GO

/****** Object:  Table [dbo].[BenzineSales]    Script Date: 26.11.2020 14:35:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[BenzineSales](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ResponsPerson] [nvarchar](50) NULL,/*������������ ���� �� ����*/
	[TaraNumber] [nvarchar](20) NULL,/*����� ���� ��� ������*/
	[OUTStartDT] [datetime] NOT NULL,/*���� ����� ������ ������*/
	[StartCounterVolume] [float] NULL,/*����������� ������� ������ ����������� � ������ ������*/
	[StartCounterMass] [float] NULL,/*����������� ������� ����� ����������� */
	[StartT1Temperature] [float] NULL,/*����������� � ������� 1 � ������ ������*/
	[StartT2Temperature] [float] NULL,/*����������� � ������� 2*/
	[StartT1Lvl] [int] NULL,/*������� � ������� 1, ������ ������*/
	[StartT2Lvl] [int] NULL,/*������� � 2 �������*/
	[StartT1Volume] [float] NULL,/*����� ������� � ������� 1, ������ ������ �����*/
	[StartT2Volume] [float] NULL,/*����� � ������� 2*/
	[StartT1Volume15] [float] NULL,/*����������� � ������� 1,������ ������*/
	[StartT2Volume15] [float] NULL,/*����������� � ������� 2*/
	[StartT1Mass] [float] NULL,/*����� ������� � �������1,������ ������ ��*/
	[StartT2Mass] [float] NULL,/*����� � ������� 2*/
	[OUTEndDT] [datetime] NULL,/*����� ���� ���������� ������*/
	[EndCounterVolume] [float] NULL,/*����������� ������� ������ ����������� � ����� ������*/
	[EndCounterMass] [float] NULL,/*����������� ������� ����� ����������� � ����� ������*/
	[EndT1Lvl] [int] NULL,/*������� � ������� 1, ����� ������*/
	[EndT2Lvl] [int] NULL,/*������� � 2 �������, ����� ������*/
	[EndT1Volume] [float] NULL,/*����� ������� � ������� 1, ����� ������ �����*/
	[EndT2Volume] [float] NULL,/*����� � ������� 2, ����� ������*/
	[EndT1Volume15] [float] NULL,/*����� ������� � ������� 1, ����� ������ ������ � 15 ��*/
	[EndT2Volume15] [float] NULL,/*����� � ������� 2, ����� ������ � 15 ��*/
	[EndT1Mass] [float] NULL,/*����� ������� � �������1,����� ������ ��*/
	[EndT2Mass] [float] NULL,/*����� � ������� 2,����� ������ */
	[EndT1Temperature] [float] NULL,/*����������� � ������� 1,����� ������*/
	[EndT2Temperature] [float] NULL,/*����������� � ������� 2,����� ������*/
	[ThisEmergencyStopped] [bit] NULL,/*���� ����������� ������ (��������)*/
	[OutedVolume] [float] NULL,/*������� ����� ������*/
	[OutedVolume15] [float] NULL,/*������� �����, ����������� � 15*/
	[OutedMass] [float] NULL,/*������� ����� ��*/
	[OutedTemp] [float] NULL,/*����������� ����������� �������� �� ������*/
	[SAPsupply] [nvarchar](50) NULL,/*����� �������� SAP*/
	[closeDT] [datetime] NULL,/*���� ����� ���������� ������ �������� SAP*/
	[SAPsend] [datetime] NULL,/*���� ����� �������� ������ � SAP*/
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


