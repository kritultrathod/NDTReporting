CREATE PROCEDURE [NDTUAT].[prc_UpdateCustomReportTemplate]  
(  
 @CustomReportTemplateId int,  
 --@SubTestId int,  
 --@BaseReportTemplateId int,  
 @TemplateName nvarchar(max),  
 --@AppId int,  
 --@ClientId int,  
 @UpdatedBy int  
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
   
   DECLARE @ExistanceCustomReportTemplateId int
		SET @ExistanceCustomReportTemplateId = -1;
		
		SELECT @ExistanceCustomReportTemplateId = CustomReportTemplateId 
		FROM [NDTUAT].[CustomReportTemplate] 
		WHERE 
		[TemplateName] = @TemplateName		
		AND [DeletedStatus] = 0
		AND CustomReportTemplateId <> @CustomReportTemplateId  
		
		IF @ExistanceCustomReportTemplateId <> -1 
		BEGIN
			RAISERROR(@CurrentErrorMessage,16,1);
		END
   
  UPDATE [NDTUAT].[CustomReportTemplate]  
     SET  -- [SubTestId] =@SubTestId  
    --,[BaseReportTemplateId] =@BaseReportTemplateId  
     [TemplateName] =@TemplateName  
    --,[AppId] =@AppId  
    --,[ClientId] =@ClientId  
    ,[UpdatedBy] =@UpdatedBy  
    ,[UpdatedDate] =GETDATE()  
    --,[DeletedStatus] =@DeletedStatus  
   WHERE CustomReportTemplateId=@CustomReportTemplateId  
   PRINT 1  
   END TRY  
   BEGIN CATCH  
      --LOG ERROR IN DB  
       
 IF (ERROR_MESSAGE() = @CurrentErrorMessage) 
    Begin   
      RAISERROR(@CurrentErrorMessage,16,1);  
    END       
            EXEC [NDTUAT].[usp_GetErrorInfo]  
        
   END CATCH  
END -- END PROC  