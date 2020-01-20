-- =============================================
-- Author:		Kalpesh
-- Create date: 23 May 2011
-- Description:	get the SP Name from the Store
-- =============================================
create  PROCEDURE [MiEFW].[getSPParametersFromStoreID] 
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
	select autoid, storeid, paraname, paradatatype, paradatasize, paradirection, paradefaultval,paradescr, modifiedby, modifieddt, deleted
	from mief.DyEXT_ParameterMaster where deleted = 'N' and storeID = @StoreID
	order by ParaName
	
	-- select * from mief.DyEXT_ParameterMaster
END
