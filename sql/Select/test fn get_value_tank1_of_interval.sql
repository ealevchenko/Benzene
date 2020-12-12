use [BENZINEtanks]
declare @start datetime = CONVERT(datetime, '2020-11-26 14:30:19.447' ,120)

declare @stop datetime = CONVERT(datetime, '2020-11-26 14:30:39.390' ,120)

select * from [dbo].[get_value_tank1_of_interval](@start, @stop) order by dt
select * from [dbo].[get_value_tank2_of_interval](@start, @stop) order by dt

select * from [dbo].[get_difference_value_tank1_of_interval](@start, @stop)
select * from [dbo].[get_difference_value_tank2_of_interval](@start, @stop)
select * from [dbo].[get_difference_value_tanks_of_interval](@start, @stop)

