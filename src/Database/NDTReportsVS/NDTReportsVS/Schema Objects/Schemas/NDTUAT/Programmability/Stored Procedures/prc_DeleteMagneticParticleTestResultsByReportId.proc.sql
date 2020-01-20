CREATE PROCEDURE [NDTUAT].[prc_DeleteMagneticParticleTestResultsByReportId]
(
	@ReportId int
)
AS
BEGIN -- BEGIN PROC
	--<VALIDATE INPUT PARAMS> IF INVALID RETURN <CUSTOM_ERROR_CODE>
	--<CHECK EXISTANCE IN DB>
	BEGIN TRY
			UPDATE NDTUAT.MagneticParticleExaminationTestResults 
			SET DeletedStatus=1 
			WHERE ReportId=@ReportId

	
		--DELETE FROM  NDTUAT.MagneticParticleExaminationTestResults 
		--WHERE ReportId=@ReportId
	END TRY
	BEGIN CATCH
		--LOG ERROR IN DB
		EXEC [NDTUAT].[usp_GetErrorInfo]  
		RETURN		
	END CATCH
END -- END PROC

