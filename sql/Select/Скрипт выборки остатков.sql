use [BENZINEtanks]
declare @date datetime = CONVERT(datetime, '2020-11-27 00:00:00' ,120)

	SELECT top(1)
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
		  --into remains
	FROM [BENZINEtanks].[dbo].[T1]
	where [SIEMENS1200_PLC1_DATA_TANKS_Tank1ProductMass_TIMESTAMP] <= @date
	order by  [SIEMENS1200_PLC1_DATA_TANKS_Tank1ProductMass_TIMESTAMP] desc