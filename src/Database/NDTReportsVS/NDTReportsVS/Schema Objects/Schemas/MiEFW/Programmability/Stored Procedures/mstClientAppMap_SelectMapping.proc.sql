
-- =============================================
-- Author:		Kalpesh
-- Create date: 5 march 13
-- Description:	modify new Client
-- =============================================
CREATE PROCEDURE [MiEFW].[mstClientAppMap_SelectMapping] 
	
	
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
	
	Select 
	C.AutoID,C.AppID,A.ApplicationName, C.ClientID,B.ClientName ,C.[Description],C.CreateDt,C.ModifyDt,C.CreateBy,C.ModifyBy from 
	[MiEFW].[mstClientAppMap] C,  [MiEFW].[mst_Clientbase] B, [MiEFW].[mst_Appbase] A
	where 
	C.Appid = A.Autoid and C.ClientID = B.Autoid and 
	C.rowstatus = 'Active' 
	
END

