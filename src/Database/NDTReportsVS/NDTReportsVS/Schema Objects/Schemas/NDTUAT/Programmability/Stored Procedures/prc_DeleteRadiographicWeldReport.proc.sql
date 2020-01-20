﻿
CREATE PROCEDURE [NDTUAT].[prc_DeleteRadiographicWeldReport]
(
    @ReportId int
)
AS
BEGIN -- BEGIN PROC
 --<VALIDATE INPUT PARAMS> IF INVALID RETURN <CUSTOM_ERROR_CODE>
 --<CHECK EXISTANCE IN DB>
 BEGIN TRY
	UPDATE NDTUAT.RadiographicWeld
	SET DeletedStatus=1
	WHERE ReportId=@ReportId
	
	UPDATE NDTUAT.RadiographicWeldTestResult
		   SET DeletedStatus=1     
		 WHERE ReportId=@ReportId 
	
 END TRY
 BEGIN CATCH
  --LOG ERROR IN DB
  EXEC [NDTUAT].[usp_GetErrorInfo]
  RETURN
 END CATCH
END -- END PROC


