CREATE PROCEDURE NDTUAT.[usercheck] 
(
    @emailid nvarchar(50),
    @userid int OUTPUT
 )
AS	
If exists (select emailid from NDTUAT.users where emailid = @emailid)
Begin
select @userid=userid from NDTUAT.users where emailid = @emailid
End 
Else
begin
Set  @userid = 0
End

