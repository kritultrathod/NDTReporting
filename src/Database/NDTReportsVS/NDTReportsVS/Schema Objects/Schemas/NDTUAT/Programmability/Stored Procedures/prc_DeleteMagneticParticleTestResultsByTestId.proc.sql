CREATE PROCEDURE [NDTUAT].[prc_DeleteMagneticParticleTestResultsByTestId]
(
	@ReportId varchar(10),
	@TestId varchar(50)
)
AS
BEGIN -- BEGIN PROC
	--<VALIDATE INPUT PARAMS> IF INVALID RETURN <CUSTOM_ERROR_CODE>
	--<CHECK EXISTANCE IN DB>
	BEGIN TRY
	
			print @TestId
	
	DECLARE @sql nvarchar(max)
	SET @sql = 'UPDATE NDTUAT.MagneticParticleExaminationTestResults 
			SET DeletedStatus=1 
			WHERE TestId not in ('+@TestId+') 
			AND ReportId=' + @ReportId
	EXEC (@sql)			
			--DELETE FROM  NDTUAT.MagneticParticleExaminationTestResults 
			--WHERE TestId not in ( @TestId ) and ReportId=@ReportId
	END TRY
	BEGIN CATCH
		--LOG ERROR IN DB
		EXEC [NDTUAT].[usp_GetErrorInfo]  
		RETURN		
	END CATCH
END -- END PROC
