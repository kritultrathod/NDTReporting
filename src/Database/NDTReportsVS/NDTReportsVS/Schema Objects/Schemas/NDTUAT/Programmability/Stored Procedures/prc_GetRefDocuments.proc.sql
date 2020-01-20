
CREATE PROCEDURE [NDTUAT].[prc_GetRefDocuments]
(
    @SubTestId int,
    @ClientId int
)
AS
BEGIN -- BEGIN PROC
	--<VALIDATE INPUT PARAMS> IF INVALID RETURN <CUSTOM_ERROR_CODE>
	--<CHECK EXISTANCE IN DB>
	BEGIN TRY
		SELECT RefDocumentId, Code 
		FROM NDTUAT.RefDocuments 
		WHERE SubTestId=@SubTestId 
		AND DeletedStatus=0 
		AND ClientId=@ClientId
	END TRY
	BEGIN CATCH
		--LOG ERROR IN DB
		EXEC [NDTUAT].[usp_GetErrorInfo]  
		RETURN		
	END CATCH
END -- END PROC

