CREATE Function [MiEFW].[getStoreIdForReport]
(	

)
RETURNS nvarchar(15)


/*

SELECT [artha].[MiEFW].[getStoreIdForReport] ()
GO

*/

AS
BEGIN
    declare @ID nvarchar(15)
	declare @tempID nvarchar(10)
	--declare @temp1 nvarchar(200)
    declare @intCnt integer

	set @tempId = Right('0000'+convert(varchar,year(getdate())),4) + Right('00'+convert(varchar,month(getdate())),2) + Right('00'+convert(varchar,day(getdate())),2) 
	Set @ID ='S' + @tempID
	--print @id
	
	--set @temp1 = '%' + @tempid + '%'

	SELECT @intCnt = count(1)  from [MiEFW].[SPManager_ProcMaster] where StoreID like '%' + @tempid + '%'

	set @intCnt = @intCnt +1

	--select(SELECT count(*) from [MiEFW].[SPManager_ProcMaster].[StoreID] where ID like '%yyyymmdd%')  as store_id from [MiEFW].[SPManager_ProcMaster]	
 	return @ID + Right('00000'+convert(varchar,@intCnt),5) 
END