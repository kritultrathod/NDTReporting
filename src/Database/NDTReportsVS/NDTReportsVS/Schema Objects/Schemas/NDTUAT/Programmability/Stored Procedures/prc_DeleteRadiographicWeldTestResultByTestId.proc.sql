CREATE PROCEDURE [NDTUAT].[prc_DeleteRadiographicWeldTestResultByTestId]
(
    @ReportId varchar(10),
    @TestIds varchar(50)
)
AS
BEGIN -- BEGIN PROC
   --<VALIDATE INPUT PARAMS> IF INVALID RETURN <CUSTOM_ERROR_CODE>
   --<CHECK EXISTANCE IN DB>
   BEGIN TRY
   
   print @TestIds
	
	DECLARE @sql nvarchar(max)
	SET @sql = 'UPDATE NDTUAT.RadiographicWeldTestResult 
			SET DeletedStatus=1 
			WHERE TestId not in ('+@TestIds+') 
			AND ReportId=' + @ReportId
	EXEC (@sql)			
			
   
		 --DECLARE @SQL AS NVARCHAR(MAX)
		 --SET @SQL = 'Delete From NDTUAT.RadiographicWeldTestResult Where TestId not in (' + @TestIds + ') and ReportId=''' + @ReportId + '''';
		 --SELECT @sql
		 --exec(@SQL)
   END TRY
   BEGIN CATCH
      --LOG ERROR IN DB
      EXEC [NDTUAT].[usp_GetErrorInfo]
      RETURN
   END CATCH
END -- END PROC
