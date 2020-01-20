
CREATE PROCEDURE [NDTUAT].[usp_InsertNdtAppExecutionLog]
(
 @StackTrace nvarchar(MAX),
 @Message nvarchar(MAX),
 @InnerException nvarchar(MAX),
 @AppID int=null,
 @ClientID int=null,
 @CreatedBy int=null
)
AS
BEGIN -- BEGIN PROC
 --<VALIDATE INPUT PARAMS> IF INVALID RETURN <CUSTOM_ERROR_CODE>
 --<CHECK EXISTANCE IN DB>
 BEGIN TRY
 INSERT INTO [NDTUAT].[NdtExceptionLog]
      ([StackTrace]
      ,[Message]
      ,[InnerException]
      ,[AppID]
      ,[ClientID]
      ,[CreatedBy]
      ,[CreatedDate]
      ,[DeletedStatus])
   VALUES
      ( @StackTrace
    ,@Message
    ,@InnerException
    ,@AppID
    ,@ClientID
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



