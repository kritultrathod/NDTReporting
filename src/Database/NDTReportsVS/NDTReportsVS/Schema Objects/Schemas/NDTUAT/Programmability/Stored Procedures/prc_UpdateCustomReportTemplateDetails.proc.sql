CREATE PROCEDURE [NDTUAT].[prc_UpdateCustomReportTemplateDetails]
(
	@CustomReportTemplateId int,
	@ReportTemplate nvarchar(max),
	@SectionsId int,
	@UpdatedBy int
)
AS
BEGIN -- BEGIN PROC
   --<VALIDATE INPUT PARAMS> IF INVALID RETURN <CUSTOM_ERROR_CODE>
   --<CHECK EXISTANCE IN DB>
   BEGIN TRY
		UPDATE		[NDTUAT].[CustomReportTemplateDetails]
		   SET		[ReportTemplate] = @ReportTemplate
			  --,[SectionsId] = @SectionsId
			  --,[AppId] = @AppId
			  --,[ClientId] = @ClientId
			  --,[CreatedBy] = @CreatedBy
			  --,[CreatedDate] = @CreatedDate
					,[UpdatedBy] = @UpdatedBy
					,[UpdatedDate] = GETDATE()
			  --,[DeletedStatus] = @DeletedStatus
		 WHERE		[CustomReportTemplateId]=@CustomReportTemplateId 
			AND		[SectionsId]=@SectionsId
		PRINT -1
   END TRY
   BEGIN CATCH
      --LOG ERROR IN DB
      PRINT -9
      EXEC [NDTUAT].[usp_GetErrorInfo]
      RETURN
   END CATCH
END -- END PROC
