declare @tank int = 1
declare @start datetime = CONVERT(datetime, '2020-11-24 00:00:00' ,120)
declare @stop datetime = CONVERT(datetime, '2020-11-24 23:59:59' ,120)

SELECT TOP 1000 [ID]
      ,[ResponsPerson]
      ,[TaraNumber]
      ,[OUTStartDT]
      ,[StartCounterVolume]
      ,[StartCounterMass]
      ,[StartT1Temperature]
      ,[StartT2Temperature]
      ,[StartT1Lvl]
      ,[StartT2Lvl]
      ,[StartT1Volume]
      ,[StartT2Volume]
      ,[StartT1Volume15]
      ,[StartT2Volume15]
      ,[StartT1Mass]
      ,[StartT2Mass]
      ,[OUTEndDT]
      ,[EndCounterVolume]
      ,[EndCounterMass]
      ,[EndT1Lvl]
      ,[EndT2Lvl]
      ,[EndT1Volume]
      ,[EndT2Volume]
      ,[EndT1Volume15]
      ,[EndT2Volume15]
      ,[EndT1Mass]
      ,[EndT2Mass]
      ,[EndT1Temperature]
      ,[EndT2Temperature]
      ,[ThisEmergencyStopped]
      ,[OutedVolume]
      ,[OutedVolume15]
      ,[OutedMass]
      ,[OutedTemp]
      ,[SAPsupply]
      ,[closeDT]
      ,[SAPsend]
  FROM [BENZINEweb].[dbo].[BenzineSales]
  where [OUTStartDT] >= @start and [OUTStartDT] <= @stop

SELECT [ID] as id
      ,[ResponsPerson] as 'user'
      ,[TaraNumber] as 'tara_number'
	  ,[SAPsupply] as 'sap_supply'
      ,[OUTStartDT] as 'start'
	  ,[OUTEndDT] as 'stop'
	  ,[volume] = [EndCounterVolume]-[StartCounterVolume]
	  ,[mass] = [EndCounterMass]-[StartCounterMass]
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
      ,[ThisEmergencyStopped] as stoped
      ,[OutedVolume] as outed_volume
      ,[OutedVolume15] as outed_volume15
      ,[OutedMass] as outed_mass
      ,[OutedTemp] as outed_temp
      ,[closeDT] as 'close'
      ,[SAPsend] as 'send'
	  into sales
  FROM [BENZINEweb].[dbo].[BenzineSales]
  where [OUTStartDT] >= @start and [OUTStartDT] <= @stop