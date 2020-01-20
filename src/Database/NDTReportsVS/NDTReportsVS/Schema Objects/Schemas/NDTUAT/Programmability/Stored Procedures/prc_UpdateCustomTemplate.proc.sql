CREATE PROCEDURE [NDTUAT].[prc_UpdateCustomTemplate]  
(  
	@ClientId int,
	@SectionsID int,
	@SubTestId int,
	@ReportTemplateName nvarchar(max),
	@ReportTemplate nvarchar(max),
	@Status varchar(10),
	@AppID int,
	@CreatedBy int,
	@UpdatedBy int,
	@DeletedStatus smallint
)  
AS  
BEGIN -- BEGIN PROC  
 --<VALIDATE INPUT PARAMS> IF INVALID RETURN <CUSTOM_ERROR_CODE>  
 --<CHECK EXISTANCE IN DB>  
 BEGIN TRY  
	UPDATE [NDTUAT].[CustomReportTemplates]
	   SET [SubTestId] = @SubTestId
		  ,[ReportTemplateName] = @ReportTemplateName
		  ,[ReportTemplate] = @ReportTemplate
		  --,[SectionsID] = @SectionsID
		  --,[ClientId] = @ClientId
		  ,[Status] = @Status
		  ,[AppID] = @AppID
		  --,[CreatedBy] = @CreatedBy
		  --,[CreatedDate] = GETDATE()
		  ,[UpdatedBy] = @UpdatedBy
		  ,[UpdatedDate] = GETDATE()
		  ,[DeletedStatus] = @DeletedStatus
	 WHERE	ClientId = @ClientId
		AND	SectionsID=@SectionsId 
 END TRY  
 BEGIN CATCH  
  --LOG ERROR IN DB  
  declare @ErrorMessage nvarchar(max)
	IF (ERROR_NUMBER() = 2627)
    Begin 
      RAISERROR('Template Name already exists.',16,1);
    END        
      EXEC [NDTUAT].[usp_GetErrorInfo]
  EXEC [NDTUAT].[usp_GetErrorInfo]    
  RETURN    
 END CATCH  
END -- END PROC  
