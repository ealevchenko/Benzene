use [BENZINEweb]
declare @start datetime = CONVERT(datetime, '2021-04-01 00:00:00' ,120)
declare @stop datetime = CONVERT(datetime, '2021-04-15 00:00:00' ,120)

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
      ,outed_dens = [OutedMass]/[OutedVolume]*1000
      ,outed_dens15 = [OutedMass]/[OutedVolume15]*1000
	  ,outed_level_1 = [StartT1Lvl]-[EndT1Lvl]
	  ,outed_level_2 = [StartT2Lvl]-[EndT2Lvl]
      ,outed_tank = CASE  
         WHEN [StartT1Lvl]-[EndT1Lvl] > 10 AND [StartT2Lvl]-[EndT2Lvl] < 10 THEN 'T1'  
         WHEN [StartT2Lvl]-[EndT2Lvl] > 10 and [StartT1Lvl]-[EndT1Lvl] < 10 THEN 'T2' 
         WHEN [StartT2Lvl]-[EndT2Lvl] > 10 and [StartT1Lvl]-[EndT1Lvl] > 10 THEN 'T1,2' 
         ELSE ''  
      END
      ,[closeDT] as 'close'
      ,[SAPsend] as 'send'

  FROM [BENZINEweb].[dbo].[BenzineSales]
  where [OUTStartDT] >= @start and [OUTStartDT] <= @stop