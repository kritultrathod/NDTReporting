CREATE PROCEDURE [NDTUAT].[prc_UpdateCustomReportTemplateRecord]
(
	 @CustomReportTemplateId int
	--,@SubTestId int
	,@ReportTemplateName nvarchar(max) 
	,@ReportTemplate nvarchar(max) 
	,@SectionsID int 
	--,@ClientId int 
	--,@AppID int 
	,@UpdatedBy int 
)
AS
BEGIN -- BEGIN PROC
   --<VALIDATE INPUT PARAMS> IF INVALID RETURN <CUSTOM_ERROR_CODE>
   --<CHECK EXISTANCE IN DB>
   BEGIN TRY
	EXEC [NDTUAT].[prc_UpdateCustomReportTemplate]
			@CustomReportTemplateId,
			@ReportTemplateName,
			@UpdatedBy
	
	EXEC [NDTUAT].[prc_UpdateCustomReportTemplateDetails]
			@CustomReportTemplateId,
			@ReportTemplate,
			@SectionsID,
			@UpdatedBy

	SELECT 1 --
	PRINT 'SUCESS'
   END TRY
   BEGIN CATCH
      --LOG ERROR IN DB
       IF (ERROR_NUMBER() = 50000)
    Begin 
      RAISERROR('Template Name already exists.',16,1);
    END
      EXEC [NDTUAT].[usp_GetErrorInfo]
      
   END CATCH
END -- END PROC
