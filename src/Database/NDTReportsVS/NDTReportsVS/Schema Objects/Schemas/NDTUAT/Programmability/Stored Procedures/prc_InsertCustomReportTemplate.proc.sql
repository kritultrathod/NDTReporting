CREATE PROCEDURE [NDTUAT].[prc_InsertCustomReportTemplate]
(
	 @SubTestId int
	,@BaseReportTemplateId int
	,@TemplateName nvarchar(max)
	,@AppID int
	,@ClientId int
	,@CreatedBy int
)
AS
BEGIN -- BEGIN PROC
   --<VALIDATE INPUT PARAMS> IF INVALID RETURN <CUSTOM_ERROR_CODE>
   --<CHECK EXISTANCE IN DB>
   DECLARE @CurrentErrorMessage varchar(150)
   --*****************************************************
   --DO NOT CHANGE THE POSITION OF THIS VARIABLE.
   -- I REPEAT DO NOT CHANGE THE POSITION OF THIS VARIABLE.
   Set @CurrentErrorMessage ='Template Name already exists.'
   --*****************************************************
   BEGIN TRY
		--IF @ClientId=0
		--BEGIN
		--	SELECT @ClientId = (MAX(ClientId) + 1) FROM [NDTUAT].[CustomReportTemplates]
		--END -- Moved to code
				
		IF EXISTS( SELECT CustomReportTemplateId FROM [NDTUAT].[CustomReportTemplate] WHERE [SubTestId] = @SubTestId AND [TemplateName] = @TemplateName AND [ClientId] = @ClientId AND [DeletedStatus] = 0)
		BEGIN			
			RAISERROR (@CurrentErrorMessage, 16, 1) 
		END
		
		DECLARE @CustomReportTemplateId int
		INSERT INTO [NDTUAT].[CustomReportTemplate]
				   ([SubTestId]
				   ,[BaseReportTemplateId]
				   ,[TemplateName]
				   ,[AppId]
				   ,[ClientId]
				   ,[CreatedBy]
				   ,[CreatedDate]
				   ,[DeletedStatus])
			 VALUES
				   (
						@SubTestId
					   ,@BaseReportTemplateId
					   ,@TemplateName
					   ,@AppId
					   ,@ClientId
					   ,@CreatedBy
					   ,GETDATE()
					   ,0
				   )
		SELECT SCOPE_IDENTITY()
   END TRY
   BEGIN CATCH       
  
	IF (ERROR_MESSAGE() = @CurrentErrorMessage)
    Begin 
      RAISERROR(@CurrentErrorMessage,16,1);
    END        
      EXEC [NDTUAT].[usp_GetErrorInfo]      
   END CATCH
END -- END PROC

