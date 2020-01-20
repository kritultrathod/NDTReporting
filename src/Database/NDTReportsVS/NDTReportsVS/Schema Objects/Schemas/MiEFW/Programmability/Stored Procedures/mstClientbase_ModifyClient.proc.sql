-- =============================================
-- Author:		Kalpesh
-- Create date: 5 march 13
-- Description:	modify new Client
-- =============================================
Create PROCEDURE [MiEFW].[mstClientbase_ModifyClient] 
	-- Update the parameters for the stored procedure here
	@ClientID int =0,
	@ClientName nvarchar(500) = '', 
	@ActionUser nvarchar(50) = ''
	
AS
/*

select * from  MiEFW.MessageResources
select * from miefw.[mst_Clientbase]

select * from  [MiEFW].[mstClientAppMap]

insert into MiEFW.MessageResources
(ClientAppMapID,DisplayMessage,createBy,createDt,rowstatus) values
(1,
'Client ID incorrect, Cannot Update Client into Database',
'mistryk',
getdate(),
'Active'
)

select * from [MiEFW].[mst_Clientbase]

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
	if ltrim(rtrim(@ClientName)) = ''
	begin
		select @strTmpMsg = [MiEFW].[getMessageByID] (2)
		raiserror(@strTmpMsg,16,1)
	return
	end 

	Declare @RowNumCnt int
	Select @RowNumCnt = count(1) from [MiEFW].[mst_Clientbase] where autoid = @ClientID
	if @RowNumCnt <> 0 
	begin 
		select @strTmpMsg = [MiEFW].[getMessageByID] (4)
		raiserror(@strTmpMsg,16,1)
	return
	end 

	Update [MiEFW].[mst_Clientbase]  
	SEt  ClientName = @ClientName, 
	ModifyBy  = @ActionUser,
	ModifyDt = getdate()
	where AutoId = @ClientID

	

    -- Insert statements for procedure here
	
END
