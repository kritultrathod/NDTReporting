

CREATE function [dbo].[properCase](@string nvarchar(4000)) returns nvarchar(4000) as
begin
		
	set @string = lower(@string)
	
	declare @i int
	set @i = ascii('a')
	
	while @i <= ascii('z')
	begin
	
		set @string = replace( @string, ' ' + char(@i), ' ' + char(@i-32))
		set @i = @i + 1
	end
	
	set @string = char(ascii(left(@string, 1))-32) + right(@string, len(@string)-1)
	
	return @string
end

