CREATE PROCEDURE [NDTUAT].[ResetPassword] 
(
	@resetpassword nvarchar(50) ,
	@userid int
)
AS
BEGIN -- BEGIN PROC
	--<VALIDATE INPUT PARAMS> IF INVALID RETURN <CUSTOM_ERROR_CODE>
	--<CHECK EXISTANCE IN DB>
	BEGIN TRY
		UPDATE [NDTUAT].Users 
		SET UserPassword=@resetpassword
		WHERE UserId = @userid 
	END TRY
	BEGIN CATCH
		--LOG ERROR IN DB
		EXEC [NDTUAT].[usp_GetErrorInfo]  
		RETURN		
	END CATCH
END -- END PROC