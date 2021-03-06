/****** Скрипт для команды SelectTopNRows из среды SSMS  ******/
declare @tank int = 1
declare @start datetime = CONVERT(datetime, '2020-11-26 14:30:19.447' ,120)
declare @stop datetime = CONVERT(datetime, '2020-11-26 14:30:39.390' ,120)

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
	  --into value_tank1_of_interval
  FROM [BENZINEtanks].[dbo].[T1]
  where [SIEMENS1200_PLC1_DATA_TANKS_Tank1ProductMass_TIMESTAMP] >=@start 
  and [SIEMENS1200_PLC1_DATA_TANKS_Tank1ProductMass_TIMESTAMP] <=@stop
  order by  [SIEMENS1200_PLC1_DATA_TANKS_Tank1ProductMass_TIMESTAMP]
