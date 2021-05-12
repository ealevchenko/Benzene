USE [BENZINEtanks]
GO
/****** Object:  StoredProcedure [dbo].[Transfer_Remains_Benzene]    Script Date: 12.05.2021 20:38:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Transfer_Remains_Benzene]
AS
BEGIN

	declare @start_report datetime
	declare @stop_report datetime
	declare @date_start datetime
	--declare @date_stop datetime

	-- Проверим наличие таблицы [KRR-PA-CNT-Oil].[dbo].[Remains_Benzene] если нет создадим
		--if OBJECT_ID(N'[10.21.4.168].[KRR-PA-CNT-Oil].[dbo].[Remains_Benzene]',N'U') is null
		--begin
		--	CREATE TABLE [10.21.4.168].[KRR-PA-CNT-Oil].[dbo].[Remains_Benzene](
		--	[id] [int] IDENTITY(1,1) NOT NULL,
		--	[tank] [int] NOT NULL,
		--	[dt] [datetime] NULL,
		--	[dens] [float] NULL,
		--	[dens15] [float] NULL,
		--	[level] [float] NULL,
		--	[mass] [float] NULL,
		--	[volume] [float] NULL,
		--	[volume15] [float] NULL,
		--	[temp] [float] NULL,
		--	[total_level] [float] NULL,
		--	[water_level] [float] NULL
		-- CONSTRAINT [PK_Remains_Benzene] PRIMARY KEY CLUSTERED 
		--(
		--	[id] ASC
		--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
		--) ON [PRIMARY]
		--end;

	-- Получим время начала запроса и конца
	set @start_report = (select top(1) [dt] from [10.21.4.168].[KRR-PA-CNT-Oil].[dbo].[Remains_Benzene] order by [dt] desc);
	Set @stop_report = CONVERT(DATETIME, CONVERT(char(11), getdate() ,20) + '00:00:00', 102);

	-- Проверим в таблице есть данные
	if (@start_report is null) begin 
		-- данных нет начнем с начала месяца
		set @start_report = CONVERT(DATETIME, CONVERT(char(8), getdate(),20) + '01 00:00:00', 102)
		--set @start_report = (SELECT top(1) [dt] FROM [ASU_AZSoperations].[dbo].[RemainsTanks] order by [dt])
		end else begin
		set @start_report = DATEADD(HOUR,+1,CONVERT(DATETIME, CONVERT(char(13), @start_report ,20) + ':00:00', 102))
		end;
	--Проверим диапазон запроса
	if (@start_report<@stop_report)
	begin
	 set @date_start = @start_report;
	 declare @row int
	 set @row =0;
	 WHILE @date_start < @stop_report
		BEGIN
			--** НАЧАЛО ВЫБОРКИ СУТОЧНОГО РАПОРТА ********************************
			insert into openquery([10.21.4.168],'select 
			   [tank]
			  ,[dt]
			  ,[dens]
			  ,[dens15]
			  ,[level]
			  ,[mass]
			  ,[volume]
			  ,[volume15]
			  ,[temp]
			  ,[total_level]
			  ,[water_level] FROM [KRR-PA-CNT-Oil].[dbo].[Remains_Benzene]' ) 


--select column1, column2 from msServerTableName


			--insert into [10.21.4.168].[KRR-PA-CNT-Oil].[dbo].[Remains_Benzene]
			--   ([tank]
			--   ,[dt]
			--   ,[dens]
			--   ,[dens15]
			--   ,[level]
			--   ,[mass]
			--   ,[volume]
			--   ,[volume15]
			--   ,[temp]
			--   ,[total_level]
			--   ,[water_level])
			select 
			   [tank]
			  ,[dt]
			  ,[dens]
			  ,[dens15]
			  ,[level]
			  ,[mass]
			  ,[volume]
			  ,[volume15]
			  ,[temp]
			  ,[total_level]
			  ,[water_level]
			from [BENZINEtanks].[dbo].[get_remains_tanks](DATEADD(MINUTE,+1,@date_start))
			--** КОНЕЦ ВЫБОРКИ СУТОЧНОГО РАПОРТА *********************************
			set @date_start = DATEADD(HOUR,+1,@date_start);
			set @row =@row+1;
		END;
		return @row;
	end;
END
GO
