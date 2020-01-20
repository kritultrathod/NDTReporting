CREATE PROCEDURE [NDTUAT].[GetUserName]
(
    @UserId  INT,
    @UserName NVARCHAR(50) OUTPUT
)
AS
/*
DECLARE @CompanyName NVARCHAR(50)
EXEC [NDTUAT].[GetCompanyName] '75',@CompanyName out
SELECT @CompanyName
*/

BEGIN TRY
   SELECT @UserName = Name
   FROM [NDTUAT].[Registration]
   WHERE @UserId = UserId
END TRY
BEGIN CATCH 
	EXEC [NDTUAT].[usp_GetErrorInfo]  
END CATCH
RETURN
