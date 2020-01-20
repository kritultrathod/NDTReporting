CREATE PROCEDURE [NDTUAT].[prc_getReportTemplateById]
	@TemplateId AS INT
AS
/*
	EXEC [NDTUAT].[prc_getReportTemplateById] '154'
*/
BEGIN
	BEGIN TRY
		BEGIN TRAN
			SELECT * 
			FROM [NDTUAT].[CustomReportTemplates] A 
			WHERE A.Id = @TemplateId
			ORDER BY A.SectionsID
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN
		--LOG ERROR IN DB
		EXEC [NDTUAT].[usp_GetErrorInfo]
		RETURN
	END CATCH
END
