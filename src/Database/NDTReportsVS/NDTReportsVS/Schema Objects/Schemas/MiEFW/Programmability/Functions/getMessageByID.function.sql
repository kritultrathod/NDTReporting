-- =============================================
-- Author:		Kalpesh
-- Create date: 5 March 2013
-- Description:	get message for display from database by ID
-- =============================================
CREATE FUNCTION MiEFW.getMessageByID 
(
	-- Add the parameters for the function here
	@MessageID int
	/*
	
	select miefw.getMessageByID(1) as 'Message'

	*/

)
RETURNS nvarchar(4000)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result nvarchar(4000)

	-- Add the T-SQL statements to compute the return value here
	SELECT @Result = displaymessage from  MiEFW.MessageResources where autoid = @MessageID

	-- Return the result of the function
	RETURN @Result

END
