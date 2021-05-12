USE [BENZINEtanks]
GO
/****** Object:  UserDefinedFunction [dbo].[get_remains_tanks]    Script Date: 12.05.2021 20:38:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[get_remains_tanks]
 (
   @date datetime
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
	select * from [dbo].[get_remains_tank1](@date)
	union
	select * from [dbo].[get_remains_tank2](@date)
  RETURN
 END



GO
