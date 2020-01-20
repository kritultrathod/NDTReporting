

-- =============================================
-- Author:		Kalpesh
-- Create date: 5 march 13
-- Description:	modify new Client
-- =============================================
CREATE PROCEDURE [MiEFW].[mstClientAppMap_DeleteMapping] 
	-- Update the parameters for the stored procedure here
	@Mapid int =0,
	@ActionUser nvarchar(50) = ''
	
AS
/*

select * from  MiEFW.MessageResources
select * from miefw.[mst_Clientbase]

select * from  [MiEFW].[mstClientAppMap]

insert into MiEFW.MessageResources
(ClientAppMapID,DisplayMessage,createBy,createDt,rowstatus) values
(1,
'Client exist in Client APP Map, Kindly Delete Client  & Application MAp before deleting Client.',
'mistryk',
getdate(),
'Active'
)

select * from [MiEFW].[mst_Clientbase]
select *  from [MiEFW].[mstClientAppMap]

select top 1 autoid  from [MiEFW].[mst_Clientbase] order by CreateDt asc

exec MiEFW.AddClient_mstClientbase 'Mi Technologies', 'Mistryk', 0

*/
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Declare @strTmpMSg  nvarchar(4000)

	if ltrim(rtrim(@ActionUser)) = ''
	begin
		select @strTmpMsg = [MiEFW].[getMessageByID] (1)
		raiserror(@strTmpMsg,16,1)
	return
	end 

	Declare @RowNumCnt int
	Select @RowNumCnt = count(1) from [MiEFW].[mstClientAppMap] where AutoID = @MapID and rowstatus = 'Active'
	if @RowNumCnt = 0 
	begin 
		Select @MapID = autoid  from [MiEFW].[mstClientAppMap] where autoid = @mapid and rowstatus = 'Active'
		select @strTmpMsg = [MiEFW].[getMessageByID] (16)
		raiserror(@strTmpMsg,16,1)
	return
	end 

	/*
	Check here for transactions in any one table or multiple tables.

	Declare @RowNumCnt int
	Select @RowNumCnt = count(1) from [MiEFW].[mst_ClientAppbase] where autoid = @Mapid
	if @RowNumCnt <> 0 
	begin 
		select @strTmpMsg = [MiEFW].[getMessageByID] (4)
		raiserror(@strTmpMsg,16,1)
	return
	end 
	*/


	Select @RowNumCnt = count(1) from [MiEFW].[mstClientAppMap] where autoid = @mapid and rowstatus = 'Active'
	if @RowNumCnt = 0 
	begin 
		select @strTmpMsg = [MiEFW].[getMessageByID] (16)
		raiserror(@strTmpMsg,16,1)
	return
	end 

	Update [MiEFW].[mstClientAppMap]  
	SEt   RowStatus = 'Inactive', 
	ModifyBy  = @ActionUser,
	ModifyDt = getdate()
	where AutoId = @mapid

	

    -- Insert statements for procedure here
	
END


