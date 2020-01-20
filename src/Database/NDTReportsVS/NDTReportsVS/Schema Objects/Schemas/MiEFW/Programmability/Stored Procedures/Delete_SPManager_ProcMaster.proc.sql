
CREATE PROCEDURE [MiEFW].[Delete_SPManager_ProcMaster] 
(
	@StoreID nvarchar(30)  
)
AS
BEGIN 
		BEGIN TRAN				 
			Update [MiEFW].[SPManager_ProcMaster] set deleted='Y' where StoreID = @StoreID
			
		COMMIT TRAN
END 