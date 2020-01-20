CREATE PROCEDURE [NDTUAT].[UsersDetail]  
(
	@EmailId nvarchar(50),  
	@UserPassword nvarchar(50),  
	@Name nvarchar(50),  
	@MobileNumber nvarchar(14),  
	@RegistrationDate date,  
	@SecurityQuestion nvarchar(50),  
	@SecurityAnswer nvarchar(50),
	@appid int,
	@clientid int
)
AS
/*
EXEC [NDTUAT].[UsersDetail] 'KritulRathod@gmail.com','pass123$','abCd','Kritul','123456789','12/01/2013','What''s Your Father Name?','hrd'
*/
BEGIN -- BEGIN PROC
	--<VALIDATE INPUT PARAMS> IF INVALID RETURN <CUSTOM_ERROR_CODE>
	--<CHECK EXISTANCE IN DB>
	BEGIN TRY
		BEGIN TRAN
			DECLARE @ID INT
					 
			INSERT INTO [NDTUAT].Users(EmailId,UserPassword)Values(@EmailId, @UserPassword);  

			SELECT @ID=SCOPE_IDENTITY()
			
			--FROM [NDTUAT].Users WHERE EmailId=@EmailId   
			INSERT INTO [NDTUAT].[Registration]
				(UserId,Name,MobileNumber,RegistrationDate,SecurityQuestion,SecurityAnswer,AppID,ClientId)  
			VALUES
				(@ID, @Name, @MobileNumber, @RegistrationDate, @SecurityQuestion, @SecurityAnswer,@appid,@clientid)
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN
		--LOG ERROR IN DB
		EXEC [NDTUAT].[usp_GetErrorInfo]  
		RETURN		
	END CATCH
END -- END PROC