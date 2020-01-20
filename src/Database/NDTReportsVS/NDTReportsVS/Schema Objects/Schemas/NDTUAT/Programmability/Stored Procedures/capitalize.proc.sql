CREATE PROCEDURE NDTUAT.capitalize(@InputValue VARCHAR(255),@CapValue VARCHAR(255) OUTPUT)
AS
    BEGIN
        SELECT @CapValue = UPPER(@InputValue)
    END 