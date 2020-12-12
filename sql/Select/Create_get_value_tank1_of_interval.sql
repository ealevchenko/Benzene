USE [BENZINEtanks]
GO

/****** Object:  UserDefinedFunction [dbo].[get_value_tank1_of_interval]    Script Date: 11.12.2020 20:37:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








CREATE FUNCTION [dbo].[get_value_tank1_of_interval]
 (
   @start datetime,
   @stop datetime
 )
	RETURNS 
	@value_tank TABLE(
	[tank] [int] NOT NULL,
	[dt] [datetime] NULL,
	[dens] [float] NULL,
	[dens15] [float] NULL,
	[level] [float] NULL,
	[mass] [float] NULL,
	[volume] [float] NULL,
	[volume15] [float] NULL,
	[temp] [float] NULL,
	[total_level] [float] NULL,
	[water_level] [float] NULL
	)
	AS
	BEGIN
	insert @value_tank
	SELECT
		   [tank] =1
		  ,[SIEMENS1200_PLC1_DATA_TANKS_Tank1ProductMass_TIMESTAMP] as dt
		  ,[SIEMENS1200_PLC1_DATA_TANKS_Tank1ProductDensity_VALUE] as dens
		  ,[SIEMENS1200_PLC1_DATA_TANKS15_T1Density_VALUE] as dens15
		  ,[SIEMENS1200_PLC1_DATA_TANKS_Tank1ProductLevel_VALUE] as [level]
		  ,[SIEMENS1200_PLC1_DATA_TANKS_Tank1ProductMass_VALUE] as mass
		  ,[SIEMENS1200_PLC1_DATA_TANKS_Tank1ProductVolume_VALUE] as volume
		  ,[SIEMENS1200_PLC1_DATA_TANKS15_T1Volume_VALUE] as volume15
		  ,[SIEMENS1200_PLC1_DATA_TANKS_Tank1Temperature_VALUE] as temp
		  ,[SIEMENS1200_PLC1_DATA_TANKS_Tank1TotalLevel_VALUE] as total_level
		  ,[SIEMENS1200_PLC1_DATA_TANKS_Tank1WaterLevel_VALUE] as water_level
	FROM [BENZINEtanks].[dbo].[T1]
	where [SIEMENS1200_PLC1_DATA_TANKS_Tank1ProductMass_TIMESTAMP] >=@start 
	and [SIEMENS1200_PLC1_DATA_TANKS_Tank1ProductMass_TIMESTAMP] <=@stop
	order by  [SIEMENS1200_PLC1_DATA_TANKS_Tank1ProductMass_TIMESTAMP]
  RETURN
 END


GO


