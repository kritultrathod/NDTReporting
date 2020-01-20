CREATE PROCEDURE [NDTUAT].[getIds]   
(  
    @userid int,  
    @ClientID int OUTPUT
     
)  
AS   
BEGIN  
	SELECT @ClientID = ClientID 
	FROM [NDTUAT].[Registration]
	WHERE @Userid = UserId  
END  
RETURN  