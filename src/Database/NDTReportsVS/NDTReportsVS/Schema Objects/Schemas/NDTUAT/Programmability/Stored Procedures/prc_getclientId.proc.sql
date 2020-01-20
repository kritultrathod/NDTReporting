CREATE PROCEDURE [NDTUAT].[prc_getclientId]
(
    @ReportId AS INT
)
AS
/*
EXEC [NDTUAT].[prc_getclientId] '120'
*/
DECLARE @ClientId INT
SELECT @ClientId = (
					SELECT ClientId 
					FROM [NDTUAT].[CustomReportTemplates] A 
					WHERE A.Id= @ReportId
				   )
IF @ClientId is NOT NULL
   BEGIN
      SELECT * 
      FROM [NDTUAT].[CustomReportTemplates] 
      WHERE ClientId=@ClientId
   END
ELSE
   BEGIN
      RETURN 0
   END

