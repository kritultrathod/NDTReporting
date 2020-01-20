CREATE Procedure [NDTUAT].[GetRegistrationDate]
(
    @UserId  int,
    @RegistrationDate date OUTPUT
)
AS
/*
DECLARE @RegistrationDate date 
EXEC [NDTUAT].[GetRegistrationDate] '75', @RegistrationDate out
SELECT @RegistrationDate 
*/
BEGIN
	SELECT  @RegistrationDate  =  RegistrationDate  
	FROM  [NDTUAT].[Registration] 
	WHERE @UserId = UserId
END
RETURN
