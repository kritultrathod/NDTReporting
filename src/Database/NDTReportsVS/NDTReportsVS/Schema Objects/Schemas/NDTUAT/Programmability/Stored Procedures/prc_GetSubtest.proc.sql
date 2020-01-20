﻿
CREATE PROCEDURE [NDTUAT].[prc_GetSubtest]

AS
BEGIN -- BEGIN PROC
	--<VALIDATE INPUT PARAMS> IF INVALID RETURN <CUSTOM_ERROR_CODE>
	--<CHECK EXISTANCE IN DB>
	BEGIN TRY
		Select SubTestId, SubTestName
		FROM NDTUAT.SubTest
		WHERE DeletedStatus=0
		
		
	END TRY
	BEGIN CATCH
		--LOG ERROR IN DB
		EXEC [NDTUAT].[usp_GetErrorInfo]  
		RETURN		
	END CATCH
END -- END PROC
