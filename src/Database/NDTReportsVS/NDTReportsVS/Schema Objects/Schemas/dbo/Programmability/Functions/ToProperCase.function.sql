

CREATE FUNCTION [dbo].[ToProperCase](@string VARCHAR(255)) RETURNS VARCHAR(255)
AS
BEGIN


/*
Created by Kalpesh.

    "Proper Cases" all "UPPER CASE" words that are delimited by white space
    leaves "lower case words" alone
    is working properly even for non-English alphabets
    is portable in that it does not use fancy features of recent SQL server versions
    you can easily change it to use NCHAR and NVARCHAR for unicode support,as well as any parameter length you see fit
    white space definition is configurable


*/



/*

select dbo.ToProperCase ('KalpeSJ MISHEAR') as 'Proper Case'
*/




  DECLARE @i INT           -- index
  DECLARE @l INT           -- input length
  DECLARE @c NCHAR(1)      -- current char
  DECLARE @f INT           -- first letter flag (1/0)
  DECLARE @o VARCHAR(255)  -- output string
  DECLARE @w VARCHAR(10)   -- characters considered as white space

  SET @w = '[' + CHAR(13) + CHAR(10) + CHAR(9) + CHAR(160) + ' ' + ']'
  SET @i = 0
  SET @l = LEN(@string)
  SET @f = 1
  SET @o = ''

  WHILE @i <= @l
  BEGIN
    SET @c = SUBSTRING(@string, @i, 1)
    IF @f = 1 
    BEGIN
     SET @o = @o + @c
     SET @f = 0
    END
    ELSE
    BEGIN
     SET @o = @o + LOWER(@c)
    END

    IF @c LIKE @w SET @f = 1

    SET @i = @i + 1
  END

  RETURN @o
END


