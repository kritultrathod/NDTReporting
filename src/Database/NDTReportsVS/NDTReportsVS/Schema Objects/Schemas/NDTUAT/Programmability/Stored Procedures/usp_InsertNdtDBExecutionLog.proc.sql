CREATE PROCEDURE [NDTUAT].[usp_InsertNdtDBExecutionLog]    
		@ProcedureName nvarchar(MAX),
		@Parameters nvarchar(MAX)
AS    
BEGIN TRY  
	INSERT INTO [NDTUAT].[NdtDBExecutionLog]
	(
		ProcedureName,
		Parameters,
		ExecutionTime
	)    
	SELECT 
		@ProcedureName,
		@Parameters,
		GETDATE()
END TRY   
BEGIN CATCH  
 PRINT -1  
 RETURN -1  
END CATCH  
