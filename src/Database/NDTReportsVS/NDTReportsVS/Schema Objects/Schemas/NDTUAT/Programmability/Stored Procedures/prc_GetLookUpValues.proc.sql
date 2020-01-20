CREATE PROCEDURE [NDTUAT].[prc_GetLookUpValues]
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
			ParamKey AS ID,
			ParamDesc1 AS Value
		FROM NDTUAT.LookUpMaster
		WHERE LookupCode = @LookupCode AND
			(@SubTestId IS NULL OR SubTestId = @SubTestId) AND
			ClientID = @ClientID AND
			DeletedStatus = 0
		ORDER BY SortOrder ASC

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


