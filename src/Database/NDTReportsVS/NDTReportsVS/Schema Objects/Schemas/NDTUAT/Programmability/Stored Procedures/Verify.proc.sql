CREATE PROCEDURE NDTUAT.Verify(@EmailId nvarchar(50) , 
                              @UserPassword nvarchar(50) , 
                              @UserId int OUTPUT , 
                              @IsAdmin int OUTPUT)
AS
IF EXISTS(SELECT EmailId , 
                 UserPassword
            FROM NDTUAT.Users
            WHERE EmailId = @EmailId
              AND UserPassword = @UserPassword)

    BEGIN
        SELECT @UserId = COALESCE(UserId , 0) , 
               @IsAdmin = COALESCE(IsAdmin , 0)
          FROM NDTUAT.Users
          WHERE EmailId = +@EmailId;

    END;
ELSE
    BEGIN
        SET @UserId = 0;
        SET @IsAdmin = 0;
    END;
RETURN;
