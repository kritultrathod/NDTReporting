CREATE PROCEDURE NDTUAT.AddLookupData(@LookupCode varchar(50) , 
                                     @ParamDesc1 nvarchar(100) , 
                                     @ParamDesc2 nvarchar(50) , 
                                     @SortOrder tinyint , 
                                     @appid int , 
                                     @SubTestid int = 0, 
                                     @clientid int , 
                                     @createdby int , 
                                     @createddate datetime)
AS
BEGIN  
    --if exists(select ParamKey from [artha].[NDTUAT].[LookUpMaster] where ParamKey=@paramkey)  
    --begin  
    -- RAISERROR ('Duplicate value Found', 10, 1, @paramkey)  
    --end  
    --else  
    DECLARE @ID int;
    SELECT @ID = MAX(LookupCodeID) + 1
      FROM artha.NDTUAT.LookUpMaster;

    DECLARE @ParamKey int;
    SET @ParamKey = 1;

    SELECT @ParamKey = CAST(MAX(ParamKey)AS int) + 1
      FROM NDTUAT.LookUpMaster
      WHERE LookupCode = @LookupCode
        AND (@SubTestid = 0 OR SubTestId = @SubTestid)
        AND ClientId = @clientid;

    INSERT INTO artha.NDTUAT.LookUpMaster(LookupCodeID , 
                                          LookupCode , 
                                          ParamKey , 
                                          ParamDesc1 , 
                                          ParamDesc2 , 
                                          SortOrder , 
                                          AppID , 
                                          subtestid , 
                                          clientid , 
                                          CreatedBy , 
                                          CreatedDate)
    VALUES(@ID , 
           @LookupCode , 
           @ParamKey , 
           @ParamDesc1 , 
           @ParamDesc2 , 
           @SortOrder , 
           @appid , 
           @SubTestid , 
           @clientid , 
           @createdby , 
           @createddate);
END;

