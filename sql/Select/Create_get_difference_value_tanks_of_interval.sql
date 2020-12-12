USE [BENZINEtanks]
GO

/****** Object:  UserDefinedFunction [dbo].[get_difference_value_tanks_of_interval]    Script Date: 13.12.2020 0:28:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE FUNCTION [dbo].[get_difference_value_tanks_of_interval]
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
		insert into @difference_value_tank
		select * from [dbo].[get_difference_value_tank1_of_interval](@start, @stop)
		union
		select * from [dbo].[get_difference_value_tank2_of_interval](@start, @stop)  
	RETURN
 END




GO


