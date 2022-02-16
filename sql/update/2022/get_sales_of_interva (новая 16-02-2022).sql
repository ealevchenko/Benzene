USE [BENZINEweb]
GO

/****** Object:  UserDefinedFunction [dbo].[get_sales_of_interval]    Script Date: 16.02.2022 14:08:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE FUNCTION [dbo].[get_sales_of_interval]
 (
   @start datetime,
   @stop datetime
 )
	RETURNS 
	@sales TABLE(
		[id] [int] NOT NULL,
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
		[send] [datetime] NULL
	)
	AS
	BEGIN
		insert into @sales
		SELECT [ID] as id
      ,[ResponsPerson] as 'user'
      ,[TaraNumber] as 'tara_number'
	  ,[SAPsupply] as 'sap_supply'
      ,[OUTStartDT] as 'start'
	  ,[OUTEndDT] as 'stop'
	  --,[volume] = [EndCounterVolume]-[StartCounterVolume]
	  --,[mass] = [EndCounterMass]-[StartCounterMass]

	  -- старт
      ,[StartT1Temperature] as start_temp_1
      ,[StartT2Temperature] as start_temp_2
      ,[StartT1Lvl] as start_level_1
      ,[StartT2Lvl] as start_level_2
      ,[StartT1Volume] as start_volume_1
      ,[StartT2Volume] as start_volume_2
      ,[StartT1Volume15] as start_volume15_1
      ,[StartT2Volume15] as start_volume15_2
      ,[StartT1Mass] as start_mass_1
      ,[StartT2Mass] as start_mass_2
	  -- стоп
      ,[EndT1Temperature] as stop_temp_1
      ,[EndT2Temperature] as stop_temp_2
      ,[EndT1Lvl] as stop_level_1
      ,[EndT2Lvl] as stop_level_2
      ,[EndT1Volume] as stop_volume_1
      ,[EndT2Volume] as stop_volume_2
      ,[EndT1Volume15] as stop_volume15_1
      ,[EndT2Volume15] as stop_volume15_2
      ,[EndT1Mass] as stop_mass_1
      ,[EndT2Mass] as stop_mass_2
	  --
      ,[ThisEmergencyStopped] as stoped
      ,[OutedVolume] as outed_volume
      ,[OutedVolume15] as outed_volume15
      ,[OutedMass] as outed_mass
      ,[OutedTemp] as outed_temp
      ,outed_dens = CASE WHEN [OutedVolume] is not null AND [OutedVolume]>0 THEN [OutedMass]/[OutedVolume]*1000 ELSE 0 END
      ,outed_dens15 = CASE WHEN [OutedVolume15] is not null AND [OutedVolume15]>0 THEN [OutedMass]/[OutedVolume15]*1000 ELSE 0 END	  
	  ,outed_level_1 = [StartT1Lvl]-[EndT1Lvl]
	  ,outed_level_2 = [StartT2Lvl]-[EndT2Lvl]
      ,outed_tank = CASE  
         WHEN [StartT1Lvl]-[EndT1Lvl] > 100 AND [StartT2Lvl]-[EndT2Lvl] < 100 THEN 'T1'  
         WHEN [StartT2Lvl]-[EndT2Lvl] > 100 and [StartT1Lvl]-[EndT1Lvl] < 100 THEN 'T2' 
         WHEN [StartT2Lvl]-[EndT2Lvl] > 100 and [StartT1Lvl]-[EndT1Lvl] > 100 and [StartT1Volume]>[StartT2Volume] THEN 'T1' 
         WHEN [StartT2Lvl]-[EndT2Lvl] > 100 and [StartT1Lvl]-[EndT1Lvl] > 100 and [StartT1Volume]<[StartT2Volume] THEN 'T2' 
         WHEN [StartT2Lvl]-[EndT2Lvl] < 100 and [StartT1Lvl]-[EndT1Lvl] < 100 and [StartT1Volume]>[StartT2Volume] THEN 'T1' 
         WHEN [StartT2Lvl]-[EndT2Lvl] < 100 and [StartT1Lvl]-[EndT1Lvl] < 100 and [StartT1Volume]<[StartT2Volume] THEN 'T2' 
         --ELSE 'T0'  
      END
      ,[closeDT] as 'close'
      ,[SAPsend] as 'send'

  FROM [BENZINEweb].[dbo].[BenzineSales]
  where [OUTStartDT] >= @start and [OUTStartDT] <= @stop
	RETURN
 END




GO


