-- =============================================
-- Author:		Kalpesh
-- Create date: 7 june 2011
-- Description:	get values from Config table
-- =============================================
CREATE PROCEDURE [MiEFW].[getConfig_ByValue] 
	-- Add the parameters for the stored procedure here
	@Category nvarchar(100) = '', 
	@ResType nvarchar(100) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from mief.resourcemetadata where 
	ResCategory = @Category and ResType = @ResType and deleted = 'N'
END