CREATE PROCEDURE [NDTUAT].[validate]
(
    @EmailId nvarchar(50),
    @MobileNumber nvarchar(14),
    @SecurityQuestion nvarchar(50),
    @SecurityAnswer nvarchar(50),
    @UserId int OUTPUT
 )
AS
/*
DECLARE @UserId int
EXEC [NDTUAT].[Validate] 'hitesh@gmail.com','9876543210','What''s Your Father Name?','abc', @UserId out
SELECT @UserId
*/
IF EXISTS(
				SELECT EmailId, MobileNumber 
				FROM [NDTUAT].[Users] U join [NDTUAT].[Registration] R on U.UserId = R.UserId 
				Where EmailId = @EmailId and MobileNumber = @MobileNumber 
					and @SecurityQuestion = SecurityQuestion 
					and @SecurityAnswer = SecurityAnswer
			)
BEGIN
	SELECT @UserId=UserId 
	FROM NDTUAT.users
	WHERE EmailId = @EmailId
END
ELSE
BEGIN
	SET  @UserId = 0
END
RETURN


