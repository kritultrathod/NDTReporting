CREATE PROCEDURE [NDTUAT].[prc_InsertCustomReportTemplateDetails]
(
	 @CustomReportTemplateId int
	,@ReportTemplate nvarchar(max)
	,@SectionsID int
	,@AppID int
	,@ClientId int
	,@CreatedBy int
)
AS
BEGIN -- BEGIN PROC
   --<VALIDATE INPUT PARAMS> IF INVALID RETURN <CUSTOM_ERROR_CODE>
   --<CHECK EXISTANCE IN DB>
   BEGIN TRY
		--IF @ClientId=0
		--BEGIN
		--	SELECT @ClientId = (MAX(ClientId) + 1) FROM [NDTUAT].[CustomReportTemplates]
		--END -- Moved to code
	 INSERT INTO [NDTUAT].[CustomReportTemplateDetails]
           ([CustomReportTemplateId]
           ,[ReportTemplate]
           ,[SectionsId]
           ,[AppId]
           ,[ClientId]
           ,[CreatedBy]
           ,[CreatedDate]
           ,[DeletedStatus])
     VALUES
           ( @CustomReportTemplateId 
			,@ReportTemplate 
			,@SectionsId 
			,@AppId 
			,@ClientId 
			,@CreatedBy 
			,GETDATE() 
			,0)

   END TRY
   BEGIN CATCH
      --LOG ERROR IN DB
      EXEC [NDTUAT].[usp_GetErrorInfo]
      RETURN
   END CATCH
END -- END PROC


