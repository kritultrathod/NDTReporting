
CREATE PROCEDURE [NDTUAT].[prc_GetLiquidPenetrantTestResultsReportById]
(
	@ReportId AS INT
)
AS
BEGIN -- BEGIN PROC
	--<VALIDATE INPUT PARAMS> IF INVALID RETURN <CUSTOM_ERROR_CODE>
	--<CHECK EXISTANCE IN DB>
	BEGIN TRY
		SELECT * 
		FROM [NDTUAT].[LiquidPenetrantExaminationTestResults] 
		WHERE ReportId = @ReportId AND Deletedstatus=0
	END TRY
	BEGIN CATCH
		--LOG ERROR IN DB
		EXEC [NDTUAT].[usp_GetErrorInfo]  
		RETURN		
	END CATCH
END -- END PROC


