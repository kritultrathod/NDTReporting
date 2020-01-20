
-- =============================================
-- Author:		Kalpesh
-- Create date: 5 march 13
-- Description:	Add new Client
-- =============================================
CREATE PROCEDURE [MiEFW].[mstClientAppMap_AddMapping] 
	-- Add the parameters for the stored procedure here
	@AppID int = 0,
	@ClientID int = 0, 
	@Description nvarchar(2000)= '',
	@ActionUser nvarchar(50) = '',
	@MapID int output
AS
/*

select * from [MiEFW].[mstClientAppMap]

select * from  MiEFW.MessageResources
select * from miefw.[mst_Clientbase]

select * from  [MiEFW].[mstClientAppMap]

insert into MiEFW.MessageResources
(ClientAppMapID,DisplayMessage,createBy,createDt,rowstatus) values
(1,
'Client Already Mapped to Application ID.Pls check and try again.',
'mistryk',
getdate(),
'Active'
)
select top 1 * from  MiEFW.MessageResources order by CreateDt desc

select * from [MiEFW].[mst_Clientbase]

select top 1 autoid  from [MiEFW].[mst_Clientbase] order by CreateDt desc

exec [MiEFW].[mstClientAppMap_AddMapping] 1,2, 'Mi Technologies', 'Mistryk', 0

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

	if @ClientID = 0
	begin
		select @strTmpMsg = [MiEFW].[getMessageByID] (13)
		raiserror(@strTmpMsg,16,1)
	return
	end 

	Declare @rwCnt int
	Set @rwCnt = 0
	Select @rwCnt = count(1) from MiEFW.mstClientBase where Autoid = @Clientid and rowstatus = 'Active'
	
	if @rwCnt = 0
	begin
		select @strTmpMsg = [MiEFW].[getMessageByID] (11)
		raiserror(@strTmpMsg,16,1)
	return
	end

	

	if @AppID = 0
	begin
		select @strTmpMsg = [MiEFW].[getMessageByID] (14)
		raiserror(@strTmpMsg,16,1)
	return
	end 
	Set @rwCnt = 0
	Select @rwCnt = count(1) from MiEFW.mstAppBase where Autoid = @Appid and rowstatus = 'Active'

	if @rwCnt = 0
	begin
		select @strTmpMsg = [MiEFW].[getMessageByID] (12)
		raiserror(@strTmpMsg,16,1)
	return
	end


	Declare @RowNumCnt int
	Select @RowNumCnt = count(1) from [MiEFW].[mstClientAppMap] where ClientID = @ClientID and Appid = @Appid and rowstatus = 'Active'
	if @RowNumCnt <> 0 
	begin 
		Select @MapID = autoid  from [MiEFW].[mstClientAppMap] where ClientID = @ClientID and Appid = @Appid and rowstatus = 'Active'
		select @strTmpMsg = [MiEFW].[getMessageByID] (15)
		raiserror(@strTmpMsg,16,1)
	return
	end 

	Insert into [MiEFW].[mstClientAppMap]  
	(Appid,ClientID,[Description],CreateDt,CreateBy,RowStatus) values 
	(@Appid, @ClientID,@Description,getdate(),@ActionUser,'Active')

	Select @MapID = autoid  from [MiEFW].[mstClientAppMap] order by CreateDt desc


    -- Insert statements for procedure here
	
END

