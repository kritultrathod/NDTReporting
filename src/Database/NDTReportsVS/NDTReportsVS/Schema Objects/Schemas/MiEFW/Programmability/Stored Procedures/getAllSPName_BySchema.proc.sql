create procedure [MiEFW].[getAllSPName_BySchema]
as
/*
exec mief.getAllSPName_BySchema
*/
begin
select  distinct specific_schema + '.' + specific_name as 'Object Name'
from INFORMATION_SCHEMA.PARAMETERS
where specific_name not like 'aspnet_%'
order by [Object Name]
end
