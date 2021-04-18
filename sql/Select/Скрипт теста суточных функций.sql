use [BENZINEweb]


declare @start datetime = CONVERT(datetime, '2021-04-16 00:00:00' ,120)
declare @stop datetime = CONVERT(datetime, '2021-04-16 23:59:59' ,120)

select * from [dbo].[get_daily_tank2_of_interval](@start,@stop)
select * from [dbo].[get_daily_tank1_of_interval](@start,@stop)

select * from [dbo].[get_daily_tanks_of_interval](@start,@stop)