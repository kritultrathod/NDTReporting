if exists (select * from dbo.sysobjects where id = object_id(N'[NDTUAT].[tsu_describe]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [NDTUAT].[tsu_describe]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[NDTUAT].[tsu__private_addError]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [NDTUAT].[tsu__private_addError]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[NDTUAT].[tsu__private_addFailure]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [NDTUAT].[tsu__private_addFailure]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[NDTUAT].[tsu__private_createTestResult]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [NDTUAT].[tsu__private_createTestResult]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[NDTUAT].[tsu__private_showTestResult]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [NDTUAT].[tsu__private_showTestResult]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[NDTUAT].[tsu_error]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [NDTUAT].[tsu_error]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[NDTUAT].[tsu_failure]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [NDTUAT].[tsu_failure]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[NDTUAT].[tsu_runTestSuite]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [NDTUAT].[tsu_runTestSuite]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[NDTUAT].[tsu_runTests]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [NDTUAT].[tsu_runTests]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[NDTUAT].[tsu_showTestResults]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [NDTUAT].[tsu_showTestResults]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[NDTUAT].[tsuActiveTest]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [NDTUAT].[tsuActiveTest]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[NDTUAT].[tsuErrors]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [NDTUAT].[tsuErrors]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[NDTUAT].[tsuFailures]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [NDTUAT].[tsuFailures]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[NDTUAT].[tsuLastTestResult]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [NDTUAT].[tsuLastTestResult]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[NDTUAT].[tsuTestResults]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [NDTUAT].[tsuTestResults]
GO
