-- =============================================
-- Author:		Kalpesh
-- Create date: 20 june 2011
-- Description:	
-- =============================================
CREATE PROCEDURE [MiEFW].[secu_updateLoginPwd] 
	-- Add the parameters for the stored procedure here
	@loginnewPwd nvarchar(200) = '', 
	@loginoldPwd nvarchar(200) = '',
	@loginID nvarchar(30) = '',
	@actionuser nvarchar(30)=''
	/*
	
	

select * from mief.mstuserauthentication where loginid = 'kalpesh'
select * from mief.mstuserauthentication_history where loginid = 'kalpesh' order by 4 desc

update mstuserauthentication
set pwdchangedt = '31 may 2011' where loginid = 'kalpesh'
	go
	[miefw].[secu_updateLoginPwd] 'BtDNUjb3LN36WROwT7Jzmg==','ssu3zOhkRGN8FE3aYE7ROA==','kalpesh','sa'
	
	[miefw].[secu_updateLoginPwd] 'BtDNUjb3LN36WROwT7Jzmg==1','BtDNUjb3LN36WROwT7Jzmg==','kalpesh','sa'
	
	*/
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
declare @strStatus as nvarchar(30)
declare @intRowCnt as int
declare @lastChangePwdCnt as int

print 'New : ' + @loginnewPwd
print 'Old : ' + @loginoldPwd
print 'Login ID : ' + @loginID 
print 'Action User : ' + @actionuser

--select * from mief.mstuserauthentication where loginid = @loginID

	-- Check old new pwd
set @intRowCnt = 0	
select @intRowCnt = count(1) from  mief.mstuserauthentication where loginid = @loginID and loginpwd =  @loginoldPwd
if @intRowCnt <> 1
Begin
	raiserror('Incorrect Old Password or User Login ID',16,1)
	return
End

declare @LASTALLOWEDPASSWORDS as int 
declare @PASSWORDCHANGECYCLE as int 
declare @MINPASSWORDLENGTH as int 
declare @MAXPASSWORDLENGTH as int 
declare @PASSWORDCHANGEGAPDAYS as int

Declare @strStmt as nvarchar(2000)
declare @strSQL  as nvarchar(max)



set @LASTALLOWEDPASSWORDS = 5
set @PASSWORDCHANGEGAPDAYS = 0
set @MINPASSWORDLENGTH = 3
set @MAXPASSWORDLENGTH = 15


select @LASTALLOWEDPASSWORDS = cast(keyvalue as int) from mief.sysconfigtbl where appid = 'PORTAL' and sectionname = 'SECURITY' and keyname = 'LASTALLOWEDPASSWORDS'
select @PASSWORDCHANGECYCLE = cast(keyvalue as int) from mief.sysconfigtbl where appid = 'PORTAL' and sectionname = 'SECURITY' and keyname = 'PASSWORDCHANGECYCLE'
select @MINPASSWORDLENGTH = cast(keyvalue as int) from mief.sysconfigtbl where appid = 'PORTAL' and sectionname = 'SECURITY' and keyname = 'MINPASSWORDLENGTH'
select @MAXPASSWORDLENGTH = cast(keyvalue as int) from mief.sysconfigtbl where appid = 'PORTAL' and sectionname = 'SECURITY' and keyname = 'MAXPASSWORDLENGTH'
select @PASSWORDCHANGEGAPDAYS = cast(keyvalue as int) from mief.sysconfigtbl where appid = 'PORTAL' and sectionname = 'SECURITY' and keyname = 'PASSWORDCHANGEGAPDAYS'

Print 'Last Allowed Passwords list : ' + str(@LASTALLOWEDPASSWORDS) 
Print 'Password Change Cycle : ' + str(@PASSWORDCHANGECYCLE) 
Print '-- -- Change Password between days Gaps :' + str(@PASSWORDCHANGEGAPDAYS)








-- Check History
set @intRowCnt = 0	
select @intRowCnt = count(1) from  mief.mstuserauthentication_history where loginid = @loginID 	and 	loginpwd = @loginnewPwd and auditaction = 'UPDATE'
if (@intRowCnt  > @LASTALLOWEDPASSWORDS)
Begin
	set @strStmt = 'Cannot Allow last old ' + str(@LASTALLOWEDPASSWORDS) + ' password.'
	raiserror(@strStmt,16,1)
	return
End


-- Check last Pwd Change Date

set @intRowCnt = 0	
select @intRowCnt = cast( (getdate()  - pwdchangedt) as int)  from  mief.mstuserauthentication where loginid = @loginID 	--and 	loginpwd = @loginnewPwd -- and auditaction = 'UPDATE'
print '-- Actual Last Pasword Change DAy GAP :' + str(@intRowCnt)
if (@PASSWORDCHANGEGAPDAYS >= @intRowCnt )
Begin
	set @strStmt = 'Cannot allow change password for multiple times within ' + ltrim(rtrim(str(@PASSWORDCHANGEGAPDAYS))) + ' days of last password changed date.'
	raiserror(@strStmt,16,1)
	return
End
--print  cast(( getdate() - '2011-06-22 00:53:50.243') as int)

	
	-- check pwd constrainst (if nay)

--if (len(@loginnewPwd) > @MAXPASSWORDLENGTH ) or (@loginnewPwd < @MINPASSWORDLENGTH)
--begin
--	set @strStmt = 'Password min/max length do not match with the constraint set by Application Administrator of Max Length -  ' + str(@MAXPASSWORDLENGTH) + ' and Min Length - ' + str(@MINPASSWORDLENGTH) + ' .'
--	raiserror(@strStmt,16,1)
--	return
--end


    -- Insert statements for procedure here
    print 'All validation checked, starting with update'
    
    update mief.mstuserauthentication set 
    loginpwd = ltrim(rtrim(@loginnewPwd)), pwdchangedt = getdate()
    where loginid = @LoginID
    print 'Trigger must have got fired, purging old password history' 
    -- keep last x passwords only in history table, purge rest for users on every password change.
    
    Select @strSQL = 'delete from mief.mstuserauthentication_history where autoid not in (select top ' + str(@LASTALLOWEDPASSWORDS) + ' autoid from mief.mstuserauthentication_history order by auditactiondt desc) and loginid = '''+ @LoginID + ''''
	print @strSQL
	execute (@strSQL)
	
	print 'Check the status of the SP'
	/* 
	select * from mief.mstuserauthentication_history
	
	[miefw].[secu_updateLoginPwd] 'BtDNUjb3LN36WROwT7Jzmg==2','BtDNUjb3LN36WROwT7Jzmg==2','kalpesh','sa'
	
	*/
	
	select * from mief.mstuserinfo where loginid = @LoginID
END






