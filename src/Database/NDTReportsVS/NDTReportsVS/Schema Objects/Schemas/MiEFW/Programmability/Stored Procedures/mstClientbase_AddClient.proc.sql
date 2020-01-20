-- =============================================
-- Author:		Kalpesh
-- Create date: 5 march 13
-- Description:	Add new Client
-- =============================================
CREATE PROCEDURE [MiEFW].[mstClientbase_AddClient] 
	-- Add the parameters for the stored procedure here
	@ClientName nvarchar(500) = '', 
	@ActionUser nvarchar(50) = '',
	@ClientID int output
AS
/*

select * from  MiEFW.MessageResources
select * from miefw.[mst_Clientbase]

select * from  [MiEFW].[mstClientAppMap]

insert into MiEFW.MessageResources
(ClientAppMapID,DisplayMessage,createBy,createDt,rowstatus) values
(1,
'Client Already Exists into Database',
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
	Select @RowNumCnt = count(1) from [MiEFW].[mst_Clientbase] where ClientName = ltrim(rtrim(@ClientName))
	if @RowNumCnt <> 0 
	begin 
		Select @ClientID = autoid  from [MiEFW].[mst_Clientbase] where ClientName = ltrim(rtrim(@ClientName))
		select @strTmpMsg = [MiEFW].[getMessageByID] (3)
		raiserror(@strTmpMsg,16,1)
	return
	end 

	Insert into [MiEFW].[mst_Clientbase]  (ClientName,CreateDt,CreateBy,RowStatus) values (@ClientName,getdate(),@ActionUser,'Active')
	Select @ClientID = autoid  from [MiEFW].[mst_Clientbase] order by CreateDt asc


    -- Insert statements for procedure here
	
END
