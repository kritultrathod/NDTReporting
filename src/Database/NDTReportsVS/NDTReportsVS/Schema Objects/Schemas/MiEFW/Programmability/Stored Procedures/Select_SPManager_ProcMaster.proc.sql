
CREATE PROCEDURE [MiEFW].[Select_SPManager_ProcMaster] 

AS
BEGIN 
		BEGIN TRAN				 
				SELECT * FROM [MiEFW].[SPManager_ProcMaster]  WHERE  deleted = 'N'
		COMMIT TRAN
END 