/****** Script for SelectTopNRows command from SSMS  ******/
CREATE Procedure [MiEFW].[secu_authenticateuser]
(
@UID				nvarchar(100),
@PWD				nvarchar(2000)
) 
AS

/*
[secu_authenticateuser] 'kalpesh','BtDNUjb3LN36WROwT7Jzmg=='
*/

Begin
SET NOCOUNT ON

print getdate()

Declare @tmpPwd  as nvarchar(2000)
declare @allowedBadlgincnt as integer
declare @curbadattempts as integer

declare @allowMultipleLogin as nchar(3)


select @allowedBadlgincnt = keyvalue from [miefw].[sysconfigtbl]
where keyname = '' and sectionname = ''

select @allowMultipleLogin = keyvalue from [miefw].[sysconfigtbl]
where keyname = '' and sectionname = ''


Select @tmpPwd  = loginid from mief.mstuserauthentication where loginid = @UID and loginstatus <> 'IN'

If @@rowcount = 0 
Begin
	if (@allowMultipleLogin <> 'M')
	BEgin
		raiserror ('User Already Logged In,Pls reset user session to login again.',16,1)
		return
	END
End



Select @tmpPwd  = loginpwd from mief.mstuserauthentication where loginid = @UID 

If @@rowcount = 0 
Begin
	raiserror ('Invalid User ID',16,1)
	return
End

If @tmpPwd <> @PWD
Begin
	print 'Bad Login - update'
	update mief.mstuserauthentication 
	SET badattempts = badattempts + 1 where
	loginid = @UID and badattempts <= @allowedBadlgincnt
	
	select @curbadattempts = badattempts from mief.mstuserauthentication where loginid = @UID
	if (@curbadattempts >= @allowedBadlgincnt)
	BEgin
		print 'Bad login attemps exhausted - Update'
		update mief.mstuserauthentication 
		SET lockoutdt = getdate() where
		loginid = @UID 
	END
	
	raiserror ('Invalid User ID or Password.',16,1)
	Return
End

declare @loginvaliddt as datetime
select @loginvaliddt  = loginvaliditytill from mief.mstuserinfo where loginid = @UID 
if (@loginvaliddt < getdate())
Begin
	print 'User ID Expired'
	raiserror ('User ID expired, Please contact system administrator.',16,1)
	return
End

declare @onVacation as nchar(3) 
declare @tmpBool as nchar(3)
declare @onVacationtill as datetime
select @onVacation = onVacation from mief.mstuserinfo where loginid = @UID 
if (@onVacation = 'Y')
Begin
	select @tmpBool = onVacation 	from mief.mstuserinfo 	where 
		( loginid = @UID  ) and 
		( disablelogin_from <= getdate() and disablelogin_to >= getdate() )		
	if (@tmpBool = 'Y')
	Begin	
		print 'USer on Vacation'
		raiserror ('User is set On Vacation, Please contact system Administrator.',16,1)
		return
	end	
End

print 'Sending records for sucessful user'

select 
B.autoid, B.firstname, B.lastname, B.groupid, B.onVacation, B.disablelogin_from, B.disablelogin_to, 
B.loginvaliditytill, B.receivealerts, B.modifiedby, B.modifieddt, 
A.pwdchangedt, A.badattempts, A.lockoutdt, A.lastlogindt, A.lastlogoutdt, A.loginstatus, A.pwdstatus
from mief.mstuserinfo B, mief.mstuserauthentication A
where A.loginid = B.loginid and B.deleted = 'N' and a.loginid = @UID

	update mief.mstuserauthentication 
	SET  lastlogindt = getdate() , loginstatus = 'IN' where	loginid = @UID 

--Select @UserName  as 'Username',@PwdChangedDt as 'Change Dt', @Logonattempt as 'Bad Attempts',   @Lockoutdt as 'Lockout Dt',   @LastLoginDt as 'Last Login', @GroupID as 'Group ID', @DeptName as 'Dept'



end
--print convert(varchar(20),@SourceDt,112)
-- select * from userinfo

