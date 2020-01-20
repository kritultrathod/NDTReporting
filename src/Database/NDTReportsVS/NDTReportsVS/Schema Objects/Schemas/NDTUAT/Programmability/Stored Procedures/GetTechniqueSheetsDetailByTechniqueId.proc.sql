CREATE PROCEDURE [NDTUAT].[GetTechniqueSheetsDetailByTechniqueId]
	@TechniqueId AS [INT]
AS
/*
EXEC [NDTUAT].[GetTechniqueSheetsDetailByTechniqueId] '1'
*/
BEGIN
	SELECT *
	FROM [NDTUAT].[TechniqueSheetDetails]
	WHERE [TechniqueId] = @TechniqueId
END
