
-- =============================================
-- Author:		Kalpesh
-- Create date: 5 march 13
-- Description:	modify new Client
-- =============================================
Create PROCEDURE [MiEFW].[mstAppbase_ModifyApp] 
	-- Update the parameters for the stored procedure here
	@AppID int =0,
	@AppName nvarchar(500) = '', 
	@ActionUser nvarchar(50) = ''
	
AS
/*

select * from miefw.[mst_Appbase]

select * from  [MiEFW].[mstClientAppMap]

insert into MiEFW.MessageResources
(ClientAppMapID,DisplayMessage,createBy,createDt,rowstatus) values
(1,
'Application Already Exists into Database',
'mistryk',
getdate(),
'Active'
)
select * from  MiEFW.MessageResources


select * from [MiEFW].[mst_Appbase]

select top 1 autoid  from [MiEFW].[mst_Appbase] order by CreateDt asc

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
	if ltrim(rtrim(@AppName)) = ''
	begin
		select @strTmpMsg = [MiEFW].[getMessageByID] (6)
		raiserror(@strTmpMsg,16,1)
	return
	end 

	Declare @RowNumCnt int
	Select @RowNumCnt = count(1) from [MiEFW].mst_Appbase where autoid = @AppID
	if @RowNumCnt <> 0 
	begin 
		select @strTmpMsg = [MiEFW].[getMessageByID] (5)
		raiserror(@strTmpMsg,16,1)
	return
	end 

	Update [MiEFW].mst_Appbase  
	SEt  ApplicationName = @AppName, 
	ModifyBy  = @ActionUser,
	ModifyDt = getdate()
	where AutoId = @AppID

	

    -- Insert statements for procedure here
	
END

