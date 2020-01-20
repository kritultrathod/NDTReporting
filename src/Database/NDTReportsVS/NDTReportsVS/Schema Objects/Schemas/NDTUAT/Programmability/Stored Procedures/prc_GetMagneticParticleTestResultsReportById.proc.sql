CREATE PROCEDURE [NDTUAT].[prc_GetMagneticParticleTestResultsReportById]  
(  
 @ReportId AS INT  
)  
AS  
BEGIN -- BEGIN PROC  
 --<VALIDATE INPUT PARAMS> IF INVALID RETURN <CUSTOM_ERROR_CODE>  
 --<CHECK EXISTANCE IN DB>  
 BEGIN TRY  
  SELECT *   
  FROM [NDTUAT].[MagneticParticleExaminationTestResults]   
  WHERE ReportId = @ReportId  AND DeletedStatus=0
 END TRY  
 BEGIN CATCH  
  --LOG ERROR IN DB  
  EXEC [NDTUAT].[usp_GetErrorInfo]    
  RETURN    
 END CATCH  
END -- END PROC  
  