
declare @start_report datetime
declare @stop_report datetime
declare @date_start datetime
declare @date_stop datetime
-- Проверим наличие таблицы [KRR-PA-CNT-Oil].[dbo].[Daily_Report_Benzene] если нет создадим
if OBJECT_ID(N'[KRR-PA-CNT-Oil].[dbo].[Daily_Report_Benzene]',N'U') is null
begin
	CREATE TABLE [KRR-PA-CNT-Oil].[dbo].[Daily_Report_Benzene](
		[id] [int] IDENTITY(1,1) NOT NULL,
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
		[deliverys_dens15] [float] NULL,
	 CONSTRAINT [PK_daily] PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
end;
-- Получим время начала запроса и конца
set @start_report = (select top(1) [start_dt] from [KRR-PA-CNT-Oil].[dbo].[Daily_Report_Benzene] order by [start_dt] desc);
Set @stop_report = CONVERT(DATETIME, CONVERT(char(11), getdate() ,20) + '00:00:00', 102);

-- Проверим в таблице есть данные
if (@start_report is null) begin 
	-- данных нет начнем с начала месяца
	set @start_report = CONVERT(DATETIME, CONVERT(char(8), getdate(),20) + '01 00:00:00', 102)
	--set @start_report = (SELECT top(1) [dt] FROM [ASU_AZSoperations].[dbo].[RemainsTanks] order by [dt])
	end else begin
	set @start_report = DATEADD(DAY,+1,@start_report)
	end;

	select @start_report, @stop_report

	 --Проверим диапазон запроса
if (@start_report<@stop_report)
begin
 set @date_start = @start_report;
 declare @row int
 set @row =0;
 WHILE @date_start < @stop_report
    BEGIN
		set @date_stop = DATEADD(SECOND,-1,DATEADD(DAY,+1,@date_start));
		
		--** НАЧАЛО ВЫБОРКИ СУТОЧНОГО РАПОРТА ********************************
		--select @date_start, @date_stop
		insert into [KRR-PA-CNT-Oil].[dbo].[Daily_Report_Benzene]
		select * from [dbo].[get_daily_tank1_of_interval](@date_start,@date_stop)
		insert into [KRR-PA-CNT-Oil].[dbo].[Daily_Report_Benzene]
		select * from [dbo].[get_daily_tank2_of_interval](@date_start,@date_stop)
		--** КОНЕЦ ВЫБОРКИ СУТОЧНОГО РАПОРТА *********************************
		set @date_start = DATEADD(DAY,+1,@date_start);
		set @row =@row+1;
    END;
	return @row;
end;