-- =============================================
-- Author:		Kalpesh
-- Create date: 5 march 13
-- Description:	modify new Client
-- =============================================
CREATE PROCEDURE [MiEFW].[mstClientbase_SelectClient] 
	
	
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

exec  MiEFW.SElectClient_mstClientbase 

*/
BEGIN
	
	Select * from [MiEFW].[mst_Clientbase] where rowstatus = 'Active' 
	
END
