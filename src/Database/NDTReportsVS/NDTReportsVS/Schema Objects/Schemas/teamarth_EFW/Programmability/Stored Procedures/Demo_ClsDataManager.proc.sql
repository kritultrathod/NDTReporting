-- =============================================
-- Author:		Kalpesh
-- Create date: 29 Sept 2012
-- Description:	demo sp to test the Cls Class Manager
-- exec Demo_ClsDataManager 'U' 
-- =============================================
CREATE PROCEDURE [teamarth_EFW].[Demo_ClsDataManager] 
	-- Add the parameters for the stored procedure here
	@OjectType nchar(2) = 'U'	
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from sysobjects where xtype = @OjectType 
	
	/*
	sp_help sysobjects
	select convert(datetime,crdate,104) as 'Create DAte' from sysobjects
	
	*/
	
END
