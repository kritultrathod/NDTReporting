﻿
CREATE PROCEDURE [NDTUAT].[prc_GetFilmMakeAndTypes]
(
@SubTestId int,
@ClientId int
)
AS
BEGIN -- BEGIN PROC
	--<VALIDATE INPUT PARAMS> IF INVALID RETURN <CUSTOM_ERROR_CODE>
	--<CHECK EXISTANCE IN DB>
	BEGIN TRY
		SELECT ParamKey As FilmTypeRateId, ParamDesc1 As FilmType
		FROM NDTUAT.LookUpMaster 
		WHERE LookupCode = 'FilmMakeAndType'
		AND SubTestId = @SubTestId
		AND ClientId = @ClientId 
		AND DeletedStatus = 0
	END TRY
	BEGIN CATCH
		--LOG ERROR IN DB
		EXEC [NDTUAT].[usp_GetErrorInfo]  
		RETURN		
	END CATCH
END -- END PROC
