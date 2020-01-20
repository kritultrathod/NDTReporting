
-- =============================================
-- Author:		Kalpesh
-- Create date: 5 march 13
-- Description:	Add new Client
-- =============================================
CREATE PROCEDURE [MiEFW].[mstAppbase_AddApp] 
	-- Add the parameters for the stored procedure here
	@ApplicationName nvarchar(500) = '', 
	@ActionUser nvarchar(50) = '',
	@AppID int output
AS
/*

select * from  MiEFW.MessageResources
select * from miefw.[mst_Clientbase]

select * from  [MiEFW].[mstClientAppMap]

insert into MiEFW.MessageResources
(ClientAppMapID,DisplayMessage,createBy,createDt,rowstatus) values
(1,
'Application Name Cannot be blank',
'mistryk',
getdate(),
'Active'
)

select * from [MiEFW].[mst_Appbase]

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
	if ltrim(rtrim(@ApplicationName)) = ''
	begin
		select @strTmpMsg = [MiEFW].[getMessageByID] (10)
		raiserror(@strTmpMsg,16,1)
	return
	end 

	Declare @RowNumCnt int
	Select @RowNumCnt = count(1) from [MiEFW].[mst_Appbase] where ApplicationName = ltrim(rtrim(@ApplicationName))
	if @RowNumCnt <> 0 
	begin 
		Select @APpID = autoid  from [MiEFW].[mst_Appbase] where ApplicationName = ltrim(rtrim(@ApplicationName))
		select @strTmpMsg = [MiEFW].[getMessageByID] (9)
		raiserror(@strTmpMsg,16,1)
	return
	end 

	Insert into [MiEFW].[mst_Appbase]  (ApplicationName,CreateDt,CreateBy,RowStatus) values (@ApplicationName,getdate(),@ActionUser,'Active')
	Select @AppID = autoid  from [MiEFW].[mst_Appbase] order by CreateDt asc


    -- Insert statements for procedure here
	
END

