CREATE PROCEDURE [NDTUAT].[GetCompanyName]
(
    @UserId  INT,
    @CompanyName NVARCHAR(50) OUTPUT
)
AS
/*
DECLARE @CompanyName NVARCHAR(50)
EXEC [NDTUAT].[GetCompanyName] '75',@CompanyName out
SELECT @CompanyName
*/
SET NOCOUNT ON;
BEGIN TRY
   SELECT @CompanyName as CompanyName
   FROM [NDTUAT].[Registration]
   WHERE @UserId = UserId
END TRY
BEGIN CATCH 
	EXEC [NDTUAT].[usp_GetErrorInfo]  
END CATCH
RETURN

