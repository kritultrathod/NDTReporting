
-- =============================================
-- Author:		Kalpesh
-- Create date: 5 march 13
-- Description:	modify new Client
-- =============================================
CREATE PROCEDURE [MiEFW].[mstAppbase_SelectApp] 
	
	
AS
/*

select * from  MiEFW.MessageResources
select * from miefw.[mst_appbase]

select * from  [MiEFW].[mstClientAppMap]

insert into MiEFW.MessageResources
(ClientAppMapID,DisplayMessage,createBy,createDt,rowstatus) values
(1,
'Client ID incorrect, Cannot Update Client into Database',
'mistryk',
getdate(),
'Active'
)


select top 1 autoid  from [MiEFW].[mst_appbase] order by CreateDt asc

exec  [MiEFW].[mstAppbase_SelectApp] 

*/
BEGIN
	
	Select * from [MiEFW].[mst_Appbase] where rowstatus = 'Active' 
	
END

