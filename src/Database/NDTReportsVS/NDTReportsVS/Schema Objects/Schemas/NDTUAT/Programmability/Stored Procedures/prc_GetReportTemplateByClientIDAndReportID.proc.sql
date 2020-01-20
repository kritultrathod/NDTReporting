CREATE PROCEDURE [NDTUAT].[prc_GetReportTemplateByClientIDAndReportID]
(
   @CustomReportTemplateId AS INT,
   @ClientId AS INT
)
AS
/*
EXEC [NDTUAT].[prc_GetReportTemplateByClientIDAndReportID]  '1','1'
*/
BEGIN -- BEGIN PROC
   --<VALIDATE INPUT PARAMS> IF INVALID RETURN <CUSTOM_ERROR_CODE>
   --<CHECK EXISTANCE IN DB>
   BEGIN TRY
		SELECT		* 
		FROM		NDTUAT.CustomReportTemplate A
		INNER JOIN	NDTUAT.CustomReportTemplateDetails B
			ON		A.CustomReportTemplateId = B.CustomReportTemplateId
		WHERE		A.ClientId=@ClientId 
			AND		A.CustomReportTemplateId=@CustomReportTemplateId
		ORDER BY	B.SectionsId
   END TRY
   BEGIN CATCH
      --LOG ERROR IN DB
      EXEC [NDTUAT].[usp_GetErrorInfo]
      RETURN
   END CATCH
END -- END PROC
