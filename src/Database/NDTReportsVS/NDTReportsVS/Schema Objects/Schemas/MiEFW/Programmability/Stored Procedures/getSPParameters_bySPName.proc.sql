
create procedure [MiEFW].[getSPParameters_bySPName]
@SPNAME as nvarchar(255)
as
/*
exec mief.getSPParameters_bySPName 'getConfig_ByCategory'
*/
begin
select  specific_name,ordinal_position,parameter_mode,is_Result,Parameter_name,data_type,character_Maximum_Length
from INFORMATION_SCHEMA.PARAMETERS
where specific_name = @SPNAME
order by ordinal_position
end