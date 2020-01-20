
CREATE PROCEDURE [NDTUAT].[prc_GetConsumablesTypes]
(
    @SubTestId int,
    @ClientId int
)
AS
BEGIN -- BEGIN PROC
	--<VALIDATE INPUT PARAMS> IF INVALID RETURN <CUSTOM_ERROR_CODE>
	--<CHECK EXISTANCE IN DB>
	BEGIN TRY
		SELECT ParamKey, ParamDesc1 
		FROM NDTUAT.LookUpMaster 
		WHERE SubTestId=@SubTestId 
		AND DeletedStatus=0 
		AND ClientId=@ClientId AND LookupCode = 'ConsumablesType'
	END TRY
	BEGIN CATCH
		--LOG ERROR IN DB
		EXEC [NDTUAT].[usp_GetErrorInfo]  
		RETURN		
	END CATCH
END -- END PROC

