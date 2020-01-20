/****** Script for SelectTopNRows command from SSMS  ******/
CREATE Function [dbo].[getWeekdays](
@FromDt datetime
) RETURNS int
AS
BEGIN
	declare @from_date datetime
	declare @to_date datetime
	declare @totaldays int
	declare @totalholidays int
	declare @totalworkingdays int
	declare @week int
	
	set @totalholidays=0
	set @from_date=@FromDt
	set @to_date=getdate()

	set @totaldays=datediff(day,@from_date,@to_date)
	--select ' total number of days :',@totaldays
	
	while @from_date<=@to_date
	begin
		set @week=datepart(dw,@from_date)
		if (@week in(1,7))
		begin
			set @totalholidays=@totalholidays+1
		end
		set @from_date=@from_date+1
	end
	
	set @totalworkingdays=@totaldays-@totalholidays
	--select ' total number of working days :',@totalworkingdays
	return @totalworkingdays
end
