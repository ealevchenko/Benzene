USE [BENZINEweb]
GO

/****** Object:  UserDefinedFunction [dbo].[get_daily_tank1_of_interval]    Script Date: 20.04.2021 0:28:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE FUNCTION [dbo].[get_daily_tank1_of_interval]
 (
   @start datetime,
   @stop datetime
 )
	RETURNS 
	@daily TABLE(
		[tank] [int] NOT NULL,
		[start_dt] [datetime] NULL,
		[stop_dt] [datetime] NULL,
		[start_volume] [float] NULL,
		[start_volume15] [float] NULL,
		[start_mass] [float] NULL,
		[start_dens] [float] NULL,
		[start_dens15] [float] NULL,
		[stop_volume] [float] NULL,
		[stop_volume15] [float] NULL,
		[stop_mass] [float] NULL,
		[stop_dens] [float] NULL,
		[stop_dens15] [float] NULL,
		[dispensing_volume] [float] NULL,
		[dispensing_volume15] [float] NULL,
		[dispensing_mass] [float] NULL,
		[dispensing_dens] [float] NULL,
		[dispensing_dens15] [float] NULL,
		[deliverys_volume] [float] NULL,
		[deliverys_volume15] [float] NULL,
		[deliverys_mass] [float] NULL,
		[deliverys_dens] [float] NULL,
		[deliverys_dens15] [float] NULL
	)
	AS
	BEGIN
--> таблица вначале и в конце
declare  @difference_value_tank TABLE(
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
--> выдачи
declare @sales TABLE(
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

insert @difference_value_tank
select * from [BENZINEtanks].[dbo].[get_difference_value_tank1_of_interval](@start,@stop);
insert @sales
select * from [dbo].[get_sales_of_interval](@start,@stop) where outed_tank = N'T1';

-- В начале
declare @start_volume float = (select start_volume from @difference_value_tank)
declare @start_volume15 float = (select start_volume15 from @difference_value_tank)
declare @start_mass float = (select start_mass from @difference_value_tank)
declare @start_dens float = (select start_dens from @difference_value_tank)
declare @start_dens15 float = (select start_dens15 from @difference_value_tank)
-- В конце
declare @stop_volume float = (select stop_volume from @difference_value_tank)
declare @stop_volume15 float = (select stop_volume15 from @difference_value_tank)
declare @stop_mass float = (select stop_mass from @difference_value_tank)
declare @stop_dens float = (select stop_dens from @difference_value_tank)
declare @stop_dens15 float = (select stop_dens15 from @difference_value_tank)
-- Расчет выдачи
declare @dispensing_volume float = (select sum([outed_volume]) from @sales);
set @dispensing_volume = CASE WHEN @dispensing_volume is not null THEN (@dispensing_volume) ELSE 0 END
declare @dispensing_volume15 float = (select sum([outed_volume15]) from @sales);
set @dispensing_volume15 = CASE WHEN @dispensing_volume15 is not null THEN (@dispensing_volume15) ELSE 0 END
declare @dispensing_mass float = (select sum([outed_mass]) from @sales);
set @dispensing_mass = CASE WHEN @dispensing_mass is not null THEN (@dispensing_mass) ELSE 0 END
declare @dispensing_dens float = CASE WHEN @dispensing_volume>0 THEN (@dispensing_mass / @dispensing_volume) ELSE 0 END
declare @dispensing_dens15 float = CASE WHEN @dispensing_volume15>0 THEN (@dispensing_mass / @dispensing_volume15) ELSE 0 END
-- Расчет приема
declare @deliverys_volume float  = (@stop_volume - @start_volume) + @dispensing_volume
declare @deliverys_volume15 float  = (@stop_volume15 - @start_volume15) + @dispensing_volume15
declare @deliverys_mass float  = (@stop_mass - @start_mass) + @dispensing_mass
declare @deliverys_dens float  = CASE WHEN @deliverys_volume>0 AND @deliverys_mass >0 THEN (@deliverys_mass/@deliverys_volume) ELSE 0 END
declare @deliverys_dens15 float  = CASE WHEN @deliverys_volume15>0 AND @deliverys_mass >0 THEN (@deliverys_mass/@deliverys_volume15) ELSE 0 END

insert @daily
select 
	[tank] =1
	,@start
	,@stop
	,start_volume = @start_volume
	,start_volume15 =@start_volume15
	,start_mass =@start_mass
	,start_dens =@start_dens
	,start_dens15 =@start_dens15
	,stop_volume =@stop_volume
	,stop_volume15 =@stop_volume15
	,stop_mass =@stop_mass
	,stop_dens =@stop_dens
	,stop_dens15 =@stop_dens15
	,dispensing_volume = CASE WHEN @dispensing_volume is not null  THEN @dispensing_volume ELSE 0 END
	,dispensing_volume15 = CASE WHEN @dispensing_volume15 is not null  THEN @dispensing_volume15 ELSE 0 END
	,dispensing_mass = CASE WHEN @dispensing_mass is not null  THEN @dispensing_mass ELSE 0 END
	,dispensing_dens = @dispensing_dens
	,dispensing_dens15 = @dispensing_dens15
	--
	,deliverys_volume = CASE WHEN @deliverys_volume is not null THEN @deliverys_volume ELSE 0 END
	,deliverys_volume15 = CASE WHEN @deliverys_volume15 is not null  THEN @deliverys_volume15 ELSE 0 END
	,deliverys_mass = CASE WHEN @deliverys_mass is not null  THEN @deliverys_mass ELSE 0 END
	,deliverys_dens = @deliverys_dens
	,deliverys_dens15 = @deliverys_dens15
from @difference_value_tank
	RETURN
 END




GO


