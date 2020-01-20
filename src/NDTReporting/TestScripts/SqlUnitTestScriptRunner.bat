@echo off

::Reading the path of sqlcmd from registry
for /f "tokens=2*" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Microsoft SQL Server\100" /v "VerSpecificRootDir" 2^>nul') do set "MSSQLSERVER_Path=%%b"
SET vFail = ''
if defined MSSQLSERVER_Path (
for /f "delims=" %%a in ('CALL "%MSSQLSERVER_Path%Tools\Binn\sqlcmd.exe" -S ndtreports.net\MSSQLSERVER2008 -U iartha -P @12T#@ -i "%1"') do (
	echo %%a
 	if '%%a' == 'FAILURE!' exit 1
  )
) else (
    @echo Local path of sqlcmd was not found.
)

:: this code will make sure that the bat file throws error to VS 2010 ==> exit 1
::if '%vFail%' == 'FAILURE!' exit 1










:: All BELOW CODE IS FOR RND
::echo '$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'
::echo %vFail%
::for /f "delims=" %%a in ('echo hello') do if '%%a' == 'he1llo'  exit 1
::echo '$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'

::for /f "delims=" %%a in (
::'echo hello'
::) do  echo %%a

::echo %foobar%

::"%MSSQLSERVER_Path%Tools\Binn\sqlcmd.exe" -S Mssql.teamartha.com -U Teamarth_Vikram -P M1V1kr@m -i "%1"
::if '%%a' == '     FAILURE!'