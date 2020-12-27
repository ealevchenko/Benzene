use [BENZINEtanks]
declare @start datetime = CONVERT(datetime, '2020-11-26 00:00:00' ,120)

declare @stop datetime = CONVERT(datetime, '2020-11-26 14:30:39' ,120)

select * from [dbo].[get_value_tank1_of_interval](@start, @stop) order by dt
select * from [dbo].[get_value_tank2_of_interval](@start, @stop) order by dt

select * from [dbo].[get_difference_value_tank1_of_interval](@start, @stop)
select * from [dbo].[get_difference_value_tank2_of_interval](@start, @stop)
select * from [dbo].[get_difference_value_tanks_of_interval](@start, @stop)
--select * from [dbo].[get_remains_tank1](@stop)
--select * from [dbo].[get_remains_tank2](@stop)
--select * from [dbo].[get_remains_tanks](@stop)


go


--use [BENZINEweb]
--declare @start datetime = CONVERT(datetime, '2020-11-24 00:00:00' ,120)
--declare @stop datetime = CONVERT(datetime, '2020-11-24 23:59:59' ,120)

--select * from [dbo].[get_sales_of_interval](@start, @stop)