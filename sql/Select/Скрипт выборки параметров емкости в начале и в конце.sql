use [BENZINEtanks]
declare @start datetime = CONVERT(datetime, '2020-11-26 14:30:19.447' ,120)
declare @stop datetime = CONVERT(datetime, '2020-11-26 14:30:39.390' ,120)

declare @value_tank_start TABLE(
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

declare @value_tank_stop TABLE(
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

insert into @value_tank_start
select top (1) * from [dbo].[get_value_tank1_of_interval](@start, @stop) order by dt
insert into @value_tank_stop
select top (1) * from [dbo].[get_value_tank1_of_interval](@start, @stop) order by dt desc

select 
tank = 1
,start_dt = (select dt from @value_tank_start)
,stop_dt = (select dt from @value_tank_stop)
,start_dens = (select dens from @value_tank_start)
,stop_dens = (select dens from @value_tank_stop)
,start_dens15 = (select dens15 from @value_tank_start)
,stop_dens15 = (select dens15 from @value_tank_stop)
,start_level = (select level from @value_tank_start)
,stop_level = (select level from @value_tank_stop)
,start_mass = (select mass from @value_tank_start)
,stop_mass = (select mass from @value_tank_stop)
,start_volume = (select volume from @value_tank_start)
,stop_volume = (select volume from @value_tank_stop)
,start_volume15 = (select volume15 from @value_tank_start)
,stop_volume15 = (select volume15 from @value_tank_stop)
,start_temp = (select temp from @value_tank_start)
,stop_temp = (select temp from @value_tank_stop)
,start_water_level = (select water_level from @value_tank_start)
,stop_water_level = (select water_level from @value_tank_stop)

--select * from @value_tank_start

--select * from @value_tank_stop