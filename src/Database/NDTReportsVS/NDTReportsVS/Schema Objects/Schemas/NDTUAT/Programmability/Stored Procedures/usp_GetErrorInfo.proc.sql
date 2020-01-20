CREATE PROCEDURE [NDTUAT].[usp_GetErrorInfo]  
AS  
BEGIN TRY
	IF (ERROR_NUMBER() is not null)
	BEGIN
		INSERT INTO [NDTUAT].[NdtDBExceptionLog]  
				   ([ErrorNumber],[ErrorSeverity],[ErrorState],  
				   [ErrorProcedure],[ErrorLine],[ErrorMessage],[ErrorDate],[Error])  
		SELECT   
				ERROR_NUMBER(),  
				ERROR_SEVERITY(),  
				ERROR_STATE(),  
				ERROR_PROCEDURE(),  
				ERROR_LINE(),  
				ERROR_MESSAGE(),
				GetDate(),
				@@ERROR  
                
	END 
END TRY 
BEGIN CATCH
--	PRINT -1
--	RETURN -1
END CATCH
