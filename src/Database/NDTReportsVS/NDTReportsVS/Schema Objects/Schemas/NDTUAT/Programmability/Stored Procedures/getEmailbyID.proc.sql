
CREATE PROCEDURE [NDTUAT].[getEmailbyID]   
(  
    @UserId int,  
    @EmailId nvarchar(50) OUTPUT    
)  
AS   
/*
	DECLARE @EmailId nvarchar(50)
	exec [NDTUAT].[getEmailbyID] '64', @EmailId out
	SELECT @EmailId
*/
BEGIN  
	SELECT @EmailId = EmailId 
	FROM [NDTUAT].[Users]
	WHERE @UserId = UserId  
END  
RETURN  

