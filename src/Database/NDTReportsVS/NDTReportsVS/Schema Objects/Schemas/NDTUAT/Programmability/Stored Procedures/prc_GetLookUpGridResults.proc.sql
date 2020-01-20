CREATE PROCEDURE [NDTUAT].[prc_GetLookUpGridResults]
(
	@LookupCode nvarchar(50) = NULL,
	@SubTestId int = NULL,
	@ClientID int = NULL
)
AS
BEGIN
 -- BEGIN PROC
   --<VALIDATE INPUT PARAMS> IF INVALID RETURN <CUSTOM_ERROR_CODE>
   --<CHECK EXISTANCE IN DB>
   BEGIN TRY
      BEGIN TRAN

		SELECT
			LookupCodeID,
			LookupCode AS Code,
			ParamKey AS Identifier,
			ParamDesc1 AS 'Description',
			ParamDesc2 AS 'AltDescription',
			SortOrder AS Sequence
		FROM [NDTUAT].[LookUpMaster]
		WHERE 
			LookupCode = @LookupCode AND 
			(@SubTestId IS NULL OR SubTestId = @SubTestId) AND
			ClientId = @ClientId AND 
			DeletedStatus = 0
		ORDER BY SortOrder

      COMMIT TRAN
   END TRY
   BEGIN CATCH
      ROLLBACK TRAN
--LOG ERROR IN DB
EXEC [NDTUAT].[usp_GetErrorInfo]
      RETURN
   END CATCH
END
 -- END PROC



