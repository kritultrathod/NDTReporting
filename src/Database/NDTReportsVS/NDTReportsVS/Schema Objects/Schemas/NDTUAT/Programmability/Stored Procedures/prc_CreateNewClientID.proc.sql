CREATE PROCEDURE [NDTUAT].[prc_CreateNewClientID]
(
	 @SubTestId int
	,@ReportTemplateName nvarchar(max)
)
AS
BEGIN -- BEGIN PROC
   --<VALIDATE INPUT PARAMS> IF INVALID RETURN <CUSTOM_ERROR_CODE>
   --<CHECK EXISTANCE IN DB>
   BEGIN TRY
	IF EXISTS (
		SELECT TOP 1 1 
		FROM NDTUAT.CustomReportTemplates 
		WHERE
			ReportTemplateName=@ReportTemplateName
		AND SubTestId=@SubTestId
		AND DeletedStatus=0
	)
	BEGIN
		SELECT -9 --Template Name Exists for current SubTestId
	END
	ELSE
	BEGIN
		SELECT (MAX(ClientId) + 1) FROM [NDTUAT].[CustomReportTemplates]
	END
   END TRY
   BEGIN CATCH
      --LOG ERROR IN DB
      EXEC [NDTUAT].[usp_GetErrorInfo]
      RETURN
   END CATCH
END -- END PROC
