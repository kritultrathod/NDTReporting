﻿CREATE PROCEDURE [NDTUAT].[prc_GetAllMagneticParticleTestReport]
@CreatedBy as int
AS
BEGIN -- BEGIN PROC
	--<VALIDATE INPUT PARAMS> IF INVALID RETURN <CUSTOM_ERROR_CODE>
	--<CHECK EXISTANCE IN DB>
	BEGIN TRY
			SELECT *
			FROM NDTUAT.MagneticParticleExaminationTest
			WHERE CreatedBy=@CreatedBy 
			AND DeletedStatus=0
	END TRY
	BEGIN CATCH
		--LOG ERROR IN DB
		EXEC [NDTUAT].[usp_GetErrorInfo]  
		RETURN		
	END CATCH
END -- END PROC


