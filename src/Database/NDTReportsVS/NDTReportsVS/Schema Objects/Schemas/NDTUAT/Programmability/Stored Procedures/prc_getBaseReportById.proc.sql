CREATE PROCEDURE [NDTUAT].[prc_getBaseReportById]
 @SubTestId AS INT,
 @ClientID AS INT
AS
/*
EXEC [NDTUAT].[prc_getBaseReportById] '1'
*/
BEGIN
   BEGIN TRY
         SELECT *
         FROM [NDTUAT].ReportTemplates A
         WHERE A.SubTestId = @SubTestId 
         AND A.ClientID = @ClientID
         ORDER BY A.SectionsID
   END TRY
   BEGIN CATCH
      --LOG ERROR IN DB
      EXEC [NDTUAT].[usp_GetErrorInfo]
      RETURN
   END CATCH
END
