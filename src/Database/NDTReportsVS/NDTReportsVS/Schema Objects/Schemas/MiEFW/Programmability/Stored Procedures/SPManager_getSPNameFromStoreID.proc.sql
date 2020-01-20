
-- =============================================
-- Author:		Kalpesh
-- Create date: 23 May 2011
-- Description:	get the SP Name from the Store
-- =============================================
create  PROCEDURE [MiEFW].[SPManager_getSPNameFromStoreID] 
	-- Add the parameters for the stored procedure here
	@StoreID nvarchar(300) = ''
	
/*
getSPNameFromStoreID 'test123'
*/
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select autoid, StoreID, SPName, ReportName, ReportDescr, modifiedby, modifiedDt, deleted 
	from miefw.SPManager_ProcMaster where deleted = 'N' and storeID = @StoreID
	order by SPName
	
	
END

