USE [BENZINEtanks]
GO

/****** Object:  UserDefinedFunction [dbo].[get_difference_value_tank2_of_interval]    Script Date: 13.12.2020 0:28:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE FUNCTION [dbo].[get_difference_value_tank2_of_interval]
 (
   @start datetime,
   @stop datetime
 )
	RETURNS 
	@difference_value_tank TABLE(
	[tank] [int] NOT NULL,
	[start_dt] [datetime] NULL,
	[stop_dt] [datetime] NULL,
	[start_dens] [float] NULL,
	[stop_dens] [float] NULL,
	[start_dens15] [float] NULL,
	[stop_dens15] [float] NULL,
	[start_level] [float] NULL,
	[stop_level] [float] NULL,
	[start_mass] [float] NULL,
	[stop_mass] [float] NULL,
	[start_volume] [float] NULL,
	[stop_volume] [float] NULL,
	[start_volume15] [float] NULL,
	[stop_volume15] [float] NULL,
	[start_temp] [float] NULL,
	[stop_temp] [float] NULL,
	[start_water_level] [float] NULL,
	[stop_water_level] [float] NULL
	)
	AS
	BEGIN
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
select top (1) * from [dbo].[get_value_tank2_of_interval](@start, @stop) order by dt
insert into @value_tank_stop
select top (1) * from [dbo].[get_value_tank2_of_interval](@start, @stop) order by dt desc

	insert into @difference_value_tank
	select 
		tank = 2
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
  RETURN
 END




GO


