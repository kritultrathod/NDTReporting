USE [artha]
GO
/****** Object:  StoredProcedure [dbo].[ut_UltrasonicBillSummarySquareInch_TotalQuantumOfJobSquareInch_Only]    Script Date: 08/22/2013 09:08:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ut_UltrasonicBillSummarySquareInch_TotalQuantumOfJobSquareInch_Only]
AS
BEGIN
	DECLARE @TableVariable AS TABLE (TotalQuantumOfJobSquareInch DECIMAL(10, 2))

	INSERT @TableVariable
	EXEC [NDTUAT].[prc_GetUltrasonicReportSummaryBillingByReportID] @ClientID = 1
		,@ReportId = 5
		,@RateType = 2
		,@ContractNo = NULL
		,@FabricatorName = NULL
		,@StartDate = NULL
		,@EndDate = NULL
		,@SummaryType = 1

	DECLARE @outStr DECIMAL(10, 2)

	SELECT @outStr = TotalQuantumOfJobSquareInch
	FROM @TableVariable

	DECLARE @SPName VARCHAR(255)

	SELECT @SPName = ISNULL(OBJECT_NAME(@@PROCID), '')

	EXEC NDTUAT.tsu_Assert @outStr
		,7435.00
		,@SPName
END
GO
/****** Object:  StoredProcedure [dbo].[ut_UltrasonicBillSummarySquareInch_TotalQuantumOfJobSquareInch]    Script Date: 08/22/2013 09:08:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ut_UltrasonicBillSummarySquareInch_TotalQuantumOfJobSquareInch]
AS
BEGIN
	DECLARE @TableVariable AS TABLE (
		Total DECIMAL(10, 2)
		,TotalQuantumOfJobSquareInch DECIMAL(10, 2)
		,PerUnitRate DECIMAL(10, 2)
		,PerDayUnitRate DECIMAL(10, 2)
		)

	INSERT @TableVariable
	EXEC [NDTUAT].[prc_GetUltrasonicReportSummaryBillingByReportID] @ClientID = 1
		,@ReportId = 5
		,@RateType = 2
		,@ContractNo = NULL
		,@FabricatorName = NULL
		,@StartDate = NULL
		,@EndDate = NULL
		,@SummaryType = 2

	DECLARE @outStr DECIMAL(10, 2)

	SELECT @outStr = TotalQuantumOfJobSquareInch
	FROM @TableVariable

	DECLARE @SPName VARCHAR(255)

	SELECT @SPName = ISNULL(OBJECT_NAME(@@PROCID), '')

	EXEC NDTUAT.tsu_Assert @outStr
		,7435.00
		,@SPName
END
GO
/****** Object:  StoredProcedure [dbo].[ut_UltrasonicBillSummarySquareInch_Total]    Script Date: 08/22/2013 09:08:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ut_UltrasonicBillSummarySquareInch_Total]
AS
BEGIN
	DECLARE @TableVariable AS TABLE (
		Total DECIMAL(10, 2)
		,TotalQuantumOfJobInch DECIMAL(10, 2)
		,PerUnitRate DECIMAL(10, 2)
		,PerDayUnitRate DECIMAL(10, 2)
		)

	INSERT @TableVariable
	EXEC [NDTUAT].[prc_GetUltrasonicReportSummaryBillingByReportID] @ClientID = 1
		,@ReportId = 5
		,@RateType = 2
		,@ContractNo = NULL
		,@FabricatorName = NULL
		,@StartDate = NULL
		,@EndDate = NULL
		,@SummaryType = 2

	DECLARE @outStr DECIMAL(10, 2)

	SELECT @outStr = TOTAL
	FROM @TableVariable

	DECLARE @SPName VARCHAR(255)

	SELECT @SPName = ISNULL(OBJECT_NAME(@@PROCID), '')

	EXEC NDTUAT.tsu_Assert @outStr
		,3555.00
		,@SPName
END
GO
/****** Object:  StoredProcedure [dbo].[ut_UltrasonicBillSummarySquareInch_PerUnitRate]    Script Date: 08/22/2013 09:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ut_UltrasonicBillSummarySquareInch_PerUnitRate]
AS
BEGIN
	DECLARE @TableVariable AS TABLE (
		Total DECIMAL(10, 2)
		,TotalQuantumOfJobInch DECIMAL(10, 2)
		,PerUnitRate DECIMAL(10, 2)
		,PerDayUnitRate DECIMAL(10, 2)
		)

	INSERT @TableVariable
	EXEC [NDTUAT].[prc_GetUltrasonicReportSummaryBillingByReportID] @ClientID = 1
		,@ReportId = 5
		,@RateType = 2
		,@ContractNo = NULL
		,@FabricatorName = NULL
		,@StartDate = NULL
		,@EndDate = NULL
		,@SummaryType = 2

	DECLARE @outStr DECIMAL(10, 2)

	SELECT @outStr = PerUnitRate
	FROM @TableVariable

	DECLARE @SPName VARCHAR(255)

	SELECT @SPName = ISNULL(OBJECT_NAME(@@PROCID), '')

	EXEC NDTUAT.tsu_Assert @outStr
		,35.00
		,@SPName
END
GO
/****** Object:  StoredProcedure [dbo].[ut_UltrasonicBillSummarySquareInch_PerDayUnitRate]    Script Date: 08/22/2013 09:08:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ut_UltrasonicBillSummarySquareInch_PerDayUnitRate]
AS
BEGIN
	DECLARE @TableVariable AS TABLE (
		Total DECIMAL(10, 2)
		,TotalQuantumOfJobInch DECIMAL(10, 2)
		,PerUnitRate DECIMAL(10, 2)
		,PerDayUnitRate DECIMAL(10, 2)
		)

	INSERT @TableVariable
	EXEC [NDTUAT].[prc_GetUltrasonicReportSummaryBillingByReportID] @ClientID = 1
		,@ReportId = 5
		,@RateType = 2
		,@ContractNo = NULL
		,@FabricatorName = NULL
		,@StartDate = NULL
		,@EndDate = NULL
		,@SummaryType = 2

	DECLARE @outStr DECIMAL(10, 2)

	SELECT @outStr = PerDayUnitRate
	FROM @TableVariable

	DECLARE @SPName VARCHAR(255)

	SELECT @SPName = ISNULL(OBJECT_NAME(@@PROCID), '')

	EXEC NDTUAT.tsu_Assert @outStr
		,90.00
		,@SPName
END
GO
/****** Object:  StoredProcedure [dbo].[ut_UltrasonicBillSummaryRunningInch_TotalQuantumOfJobInch_Only]    Script Date: 08/22/2013 09:08:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ut_UltrasonicBillSummaryRunningInch_TotalQuantumOfJobInch_Only]
AS
BEGIN
	DECLARE @TableVariable AS TABLE (TotalQuantumOfJobInch DECIMAL(10, 2))

	INSERT @TableVariable
	EXEC [NDTUAT].[prc_GetUltrasonicReportSummaryBillingByReportID] @ClientID = 1
		,@ReportId = 5
		,@RateType = 1
		,@ContractNo = NULL
		,@FabricatorName = NULL
		,@StartDate = NULL
		,@EndDate = NULL
		,@SummaryType = 1

	DECLARE @outStr DECIMAL(10, 2)

	SELECT @outStr = TotalQuantumOfJobInch
	FROM @TableVariable

	DECLARE @SPName VARCHAR(255)

	SELECT @SPName = ISNULL(OBJECT_NAME(@@PROCID), '')

	EXEC NDTUAT.tsu_Assert @outStr
		,91.00
		,@SPName
END
GO
/****** Object:  StoredProcedure [dbo].[ut_UltrasonicBillSummaryRunningInch_TotalQuantumOfJobInch]    Script Date: 08/22/2013 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ut_UltrasonicBillSummaryRunningInch_TotalQuantumOfJobInch]
AS
BEGIN
	DECLARE @TableVariable AS TABLE (
		Total DECIMAL(10, 2)
		,TotalQuantumOfJobInch DECIMAL(10, 2)
		,PerUnitRate DECIMAL(10, 2)
		,PerDayUnitRate DECIMAL(10, 2)
		)

	INSERT @TableVariable
	EXEC [NDTUAT].[prc_GetUltrasonicReportSummaryBillingByReportID] @ClientID = 1
		,@ReportId = 5
		,@RateType = 1
		,@ContractNo = NULL
		,@FabricatorName = NULL
		,@StartDate = NULL
		,@EndDate = NULL
		,@SummaryType = 2

	DECLARE @outStr DECIMAL(10, 2)

	SELECT @outStr = TotalQuantumOfJobInch
	FROM @TableVariable

	DECLARE @SPName VARCHAR(255)

	SELECT @SPName = ISNULL(OBJECT_NAME(@@PROCID), '')

	EXEC NDTUAT.tsu_Assert @outStr
		,91.00
		,@SPName
END
GO
/****** Object:  StoredProcedure [dbo].[ut_UltrasonicBillSummaryRunningInch_Total]    Script Date: 08/22/2013 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ut_UltrasonicBillSummaryRunningInch_Total]
AS
BEGIN
	DECLARE @TableVariable AS TABLE (
		Total DECIMAL(10, 2)
		,TotalQuantumOfJobInch DECIMAL(10, 2)
		,PerUnitRate DECIMAL(10, 2)
		,PerDayUnitRate DECIMAL(10, 2)
		)

	INSERT @TableVariable
	EXEC [NDTUAT].[prc_GetUltrasonicReportSummaryBillingByReportID] @ClientID = 1
		,@ReportId = 5
		,@RateType = 1
		,@ContractNo = NULL
		,@FabricatorName = NULL
		,@StartDate = NULL
		,@EndDate = NULL
		,@SummaryType = 2

	DECLARE @outStr DECIMAL(10, 2)

	SELECT @outStr = TOTAL
	FROM @TableVariable

	DECLARE @SPName VARCHAR(255)

	SELECT @SPName = ISNULL(OBJECT_NAME(@@PROCID), '')

	EXEC NDTUAT.tsu_Assert @outStr
		,3555.00
		,@SPName
END
GO
/****** Object:  StoredProcedure [dbo].[ut_UltrasonicBillSummaryRunningInch_PerUnitRate]    Script Date: 08/22/2013 09:08:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ut_UltrasonicBillSummaryRunningInch_PerUnitRate]
AS
BEGIN
	DECLARE @TableVariable AS TABLE (
		Total DECIMAL(10, 2)
		,TotalQuantumOfJobInch DECIMAL(10, 2)
		,PerUnitRate DECIMAL(10, 2)
		,PerDayUnitRate DECIMAL(10, 2)
		)

	INSERT @TableVariable
	EXEC [NDTUAT].[prc_GetUltrasonicReportSummaryBillingByReportID] @ClientID = 1
		,@ReportId = 5
		,@RateType = 1
		,@ContractNo = NULL
		,@FabricatorName = NULL
		,@StartDate = NULL
		,@EndDate = NULL
		,@SummaryType = 2

	DECLARE @outStr DECIMAL(10, 2)

	SELECT @outStr = PerUnitRate
	FROM @TableVariable

	DECLARE @SPName VARCHAR(255)

	SELECT @SPName = ISNULL(OBJECT_NAME(@@PROCID), '')

	EXEC NDTUAT.tsu_Assert @outStr
		,35.00
		,@SPName
END
GO
/****** Object:  StoredProcedure [dbo].[ut_UltrasonicBillSummaryRunningInch_PerDayUnitRate]    Script Date: 08/22/2013 09:08:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ut_UltrasonicBillSummaryRunningInch_PerDayUnitRate]
AS
BEGIN
	DECLARE @TableVariable AS TABLE (
		Total DECIMAL(10, 2)
		,TotalQuantumOfJobInch DECIMAL(10, 2)
		,PerUnitRate DECIMAL(10, 2)
		,PerDayUnitRate DECIMAL(10, 2)
		)

	INSERT @TableVariable
	EXEC [NDTUAT].[prc_GetUltrasonicReportSummaryBillingByReportID] @ClientID = 1
		,@ReportId = 5
		,@RateType = 1
		,@ContractNo = NULL
		,@FabricatorName = NULL
		,@StartDate = NULL
		,@EndDate = NULL
		,@SummaryType = 2

	DECLARE @outStr DECIMAL(10, 2)

	SELECT @outStr = PerDayUnitRate
	FROM @TableVariable

	DECLARE @SPName VARCHAR(255)

	SELECT @SPName = ISNULL(OBJECT_NAME(@@PROCID), '')

	EXEC NDTUAT.tsu_Assert @outStr
		,90.00
		,@SPName
END
GO
/****** Object:  StoredProcedure [dbo].[ut_RadiographicBillSummarySquareInch_TotalQuantumOfJobSquareInch_Only]    Script Date: 08/22/2013 09:08:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ut_RadiographicBillSummarySquareInch_TotalQuantumOfJobSquareInch_Only] AS 

BEGIN 

Declare @TableVariable as table 
(TotalQuantumOfJobSquareInch decimal(10,2))
Insert @TableVariable
EXEC [NDTUAT].[prc_GetRadiographicReportSummaryBillingByReportID]  
  @ClientID = 1,  
  @ReportId = 308,    
  @RateType = 2,  
  @ContractNo = NULL,  
  @FabricatorName = NULL,  
  @StartDate = NULL,  
  @EndDate = NULL,  
  @SummaryType = 1
  
Declare @outStr decimal(10,2)  
SELECT @outStr = TotalQuantumOfJobSquareInch  from @TableVariable
        
Declare @SPName Varchar(255) 
Select @SPName = ISNULL(OBJECT_NAME(@@PROCID),'') 
EXEC NDTUAT.tsu_Assert @outStr,40.00,@SPName        
 
END
GO
/****** Object:  StoredProcedure [dbo].[ut_RadiographicBillSummarySquareInch_TotalQuantumOfJobSquareInch]    Script Date: 08/22/2013 09:08:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ut_RadiographicBillSummarySquareInch_TotalQuantumOfJobSquareInch] AS 
BEGIN 

Declare @TableVariable as table (Total decimal(10,2),TotalQuantumOfJobSquareInch decimal(10,2),
PerUnitRate decimal(10,2),PerDayUnitRate decimal(10,2))
Insert @TableVariable
EXEC [NDTUAT].[prc_GetRadiographicReportSummaryBillingByReportID]  
  @ClientID = 1,  
  @ReportId = 308,    
  @RateType = 2,  
  @ContractNo = NULL,  
  @FabricatorName = NULL,  
  @StartDate = NULL,  
  @EndDate = NULL,  
  @SummaryType = 2  
  
Declare @outStr decimal(10,2)  
SELECT @outStr = TotalQuantumOfJobSquareInch  from @TableVariable
Declare @SPName Varchar(255) 
Select @SPName = ISNULL(OBJECT_NAME(@@PROCID),'') 
EXEC NDTUAT.tsu_Assert @outStr,40.00,@SPName       
END
GO
/****** Object:  StoredProcedure [dbo].[ut_RadiographicBillSummarySquareInch_Total]    Script Date: 08/22/2013 09:08:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Square inch


ALTER PROCEDURE [dbo].[ut_RadiographicBillSummarySquareInch_Total] AS 
BEGIN 

Declare @TableVariable as table (Total decimal(10,2),TotalQuantumOfJobInch decimal(10,2),
PerUnitRate decimal(10,2),PerDayUnitRate decimal(10,2))
Insert @TableVariable
EXEC [NDTUAT].[prc_GetRadiographicReportSummaryBillingByReportID]  
  @ClientID = 1,  
  @ReportId = 308,    
  @RateType = 2,  
  @ContractNo = NULL,  
  @FabricatorName = NULL,  
  @StartDate = NULL,  
  @EndDate = NULL,  
  @SummaryType = 2  
  
Declare @outStr decimal(10,2)  
SELECT @outStr = TOTAL from @TableVariable
Declare @SPName Varchar(255) 
Select @SPName = ISNULL(OBJECT_NAME(@@PROCID),'') 
EXEC NDTUAT.tsu_Assert @outStr,475.00,@SPName       
END
GO
/****** Object:  StoredProcedure [dbo].[ut_RadiographicBillSummarySquareInch_PerUnitRate]    Script Date: 08/22/2013 09:08:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ut_RadiographicBillSummarySquareInch_PerUnitRate] AS 
BEGIN 

Declare @TableVariable as table (Total decimal(10,2),TotalQuantumOfJobInch decimal(10,2),
PerUnitRate decimal(10,2),PerDayUnitRate decimal(10,2))
Insert @TableVariable
EXEC [NDTUAT].[prc_GetRadiographicReportSummaryBillingByReportID]  
  @ClientID = 1,  
  @ReportId = 308,    
  @RateType = 2,  
  @ContractNo = NULL,  
  @FabricatorName = NULL,  
  @StartDate = NULL,  
  @EndDate = NULL,  
  @SummaryType = 2  
  
Declare @outStr decimal(10,2)  
SELECT @outStr = PerUnitRate from @TableVariable
Declare @SPName Varchar(255) 
Select @SPName = ISNULL(OBJECT_NAME(@@PROCID),'') 
EXEC NDTUAT.tsu_Assert @outStr,40.00,@SPName       
END
GO
/****** Object:  StoredProcedure [dbo].[ut_RadiographicBillSummarySquareInch_PerDayUnitRate]    Script Date: 08/22/2013 09:08:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ut_RadiographicBillSummarySquareInch_PerDayUnitRate] AS 
BEGIN 

Declare @TableVariable as table (Total decimal(10,2),TotalQuantumOfJobInch decimal(10,2),
PerUnitRate decimal(10,2),PerDayUnitRate decimal(10,2))
Insert @TableVariable
EXEC [NDTUAT].[prc_GetRadiographicReportSummaryBillingByReportID]  
  @ClientID = 1,  
  @ReportId = 308,    
  @RateType = 2,  
  @ContractNo = NULL,  
  @FabricatorName = NULL,  
  @StartDate = NULL,  
  @EndDate = NULL,  
  @SummaryType = 2  
  
Declare @outStr decimal(10,2)  
SELECT @outStr = PerDayUnitRate from @TableVariable
Declare @SPName Varchar(255) 
Select @SPName = ISNULL(OBJECT_NAME(@@PROCID),'') 
EXEC NDTUAT.tsu_Assert @outStr,75.00,@SPName       
END
GO
/****** Object:  StoredProcedure [dbo].[ut_RadiographicBillSummaryRunningInch_TotalQuantumOfJobInch_Only]    Script Date: 08/22/2013 09:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Quantum

ALTER PROCEDURE [dbo].[ut_RadiographicBillSummaryRunningInch_TotalQuantumOfJobInch_Only] AS 
BEGIN 

Declare @TableVariable as table (TotalQuantumOfJobInch decimal(10,2))
Insert @TableVariable
EXEC [NDTUAT].[prc_GetRadiographicReportSummaryBillingByReportID]  
  @ClientID = 1,  
  @ReportId = 308,    
  @RateType = 1,  
  @ContractNo = NULL,  
  @FabricatorName = NULL,  
  @StartDate = NULL,  
  @EndDate = NULL,  
  @SummaryType = 1
  
Declare @outStr decimal(10,2)  
SELECT @outStr = TotalQuantumOfJobInch  from @TableVariable
Declare @SPName Varchar(255) 
Select @SPName = ISNULL(OBJECT_NAME(@@PROCID),'') 
EXEC NDTUAT.tsu_Assert @outStr,10.00,@SPName       
END
GO
/****** Object:  StoredProcedure [dbo].[ut_RadiographicBillSummaryRunningInch_TotalQuantumOfJobInch]    Script Date: 08/22/2013 09:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ut_RadiographicBillSummaryRunningInch_TotalQuantumOfJobInch] AS 
BEGIN 

Declare @TableVariable as table (Total decimal(10,2),TotalQuantumOfJobInch decimal(10,2),
PerUnitRate decimal(10,2),PerDayUnitRate decimal(10,2))
Insert @TableVariable
EXEC [NDTUAT].[prc_GetRadiographicReportSummaryBillingByReportID]  
  @ClientID = 1,  
  @ReportId = 308,    
  @RateType = 1,  
  @ContractNo = NULL,  
  @FabricatorName = NULL,  
  @StartDate = NULL,  
  @EndDate = NULL,  
  @SummaryType = 2  
  
Declare @outStr decimal(10,2)  
SELECT @outStr = TotalQuantumOfJobInch  from @TableVariable
Declare @SPName Varchar(255) 
Select @SPName = ISNULL(OBJECT_NAME(@@PROCID),'') 
EXEC NDTUAT.tsu_Assert @outStr,10.00,@SPName       
END
GO
/****** Object:  StoredProcedure [dbo].[ut_RadiographicBillSummaryRunningInch_Total]    Script Date: 08/22/2013 09:08:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ut_RadiographicBillSummaryRunningInch_Total] AS 
BEGIN 

Declare @TableVariable as table (Total decimal(10,2),TotalQuantumOfJobInch decimal(10,2),
PerUnitRate decimal(10,2),PerDayUnitRate decimal(10,2))
Insert @TableVariable
EXEC [NDTUAT].[prc_GetRadiographicReportSummaryBillingByReportID]  
  @ClientID = 1,  
  @ReportId = 308,    
  @RateType = 1,  
  @ContractNo = NULL,  
  @FabricatorName = NULL,  
  @StartDate = NULL,  
  @EndDate = NULL,  
  @SummaryType = 2  
  
Declare @outStr decimal(10,2)  
SELECT @outStr = TOTAL from @TableVariable

Declare @SPName Varchar(255) 
Select @SPName = ISNULL(OBJECT_NAME(@@PROCID),'') 
EXEC NDTUAT.tsu_Assert @outStr,475.00,@SPName
  
END
GO
/****** Object:  StoredProcedure [dbo].[ut_RadiographicBillSummaryRunningInch_PerUnitRate]    Script Date: 08/22/2013 09:08:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ut_RadiographicBillSummaryRunningInch_PerUnitRate] AS 
BEGIN 

Declare @TableVariable as table (Total decimal(10,2),TotalQuantumOfJobInch decimal(10,2),
PerUnitRate decimal(10,2),PerDayUnitRate decimal(10,2))
Insert @TableVariable
EXEC [NDTUAT].[prc_GetRadiographicReportSummaryBillingByReportID]  
  @ClientID = 1,  
  @ReportId = 308,    
  @RateType = 1,  
  @ContractNo = NULL,  
  @FabricatorName = NULL,  
  @StartDate = NULL,  
  @EndDate = NULL,  
  @SummaryType = 2  
  
Declare @outStr decimal(10,2)  
SELECT @outStr = PerUnitRate from @TableVariable

Declare @SPName Varchar(255) 
Select @SPName = ISNULL(OBJECT_NAME(@@PROCID),'') 
EXEC NDTUAT.tsu_Assert @outStr,40.00,@SPName
  
END
GO
/****** Object:  StoredProcedure [dbo].[ut_RadiographicBillSummaryRunningInch_PerDayUnitRate]    Script Date: 08/22/2013 09:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ut_RadiographicBillSummaryRunningInch_PerDayUnitRate] AS 
BEGIN 

Declare @TableVariable as table (Total decimal(10,2),TotalQuantumOfJobInch decimal(10,2),
PerUnitRate decimal(10,2),PerDayUnitRate decimal(10,2))
Insert @TableVariable
EXEC [NDTUAT].[prc_GetRadiographicReportSummaryBillingByReportID]  
  @ClientID = 1,  
  @ReportId = 308,    
  @RateType = 1,  
  @ContractNo = NULL,  
  @FabricatorName = NULL,  
  @StartDate = NULL,  
  @EndDate = NULL,  
  @SummaryType = 2  
  
Declare @outStr decimal(10,2)  
SELECT @outStr = PerDayUnitRate from @TableVariable

Declare @SPName Varchar(255) 
Select @SPName = ISNULL(OBJECT_NAME(@@PROCID),'') 
EXEC NDTUAT.tsu_Assert @outStr,75.00,@SPName

END
GO
/****** Object:  StoredProcedure [dbo].[ut_MagneticParticleBillSummarySquareInch_TotalQuantumOfJobSquareInch_Only]    Script Date: 08/22/2013 09:08:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ut_MagneticParticleBillSummarySquareInch_TotalQuantumOfJobSquareInch_Only] AS 

BEGIN 

Declare @TableVariable as table (TotalQuantumOfJobSquareInch decimal(10,2))
Insert @TableVariable
EXEC [NDTUAT].[prc_GetMagneticParticleReportSummaryBillingByReportID]  
  @ClientID = 1,  
  @ReportId = 42,    
  @RateType = 2,  
  @ContractNo = NULL,  
  @FabricatorName = NULL,  
  @StartDate = NULL,  
  @EndDate = NULL,  
  @SummaryType = 1
  
Declare @outStr decimal(10,2)  
SELECT @outStr = TotalQuantumOfJobSquareInch  from @TableVariable
Declare @SPName Varchar(255) 
Select @SPName = ISNULL(OBJECT_NAME(@@PROCID),'') 
EXEC NDTUAT.tsu_Assert @outStr,12342.00,@SPName       
END
GO
/****** Object:  StoredProcedure [dbo].[ut_MagneticParticleBillSummarySquareInch_TotalQuantumOfJobSquareInch]    Script Date: 08/22/2013 09:08:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ut_MagneticParticleBillSummarySquareInch_TotalQuantumOfJobSquareInch] AS 
BEGIN 

Declare @TableVariable as table (Total decimal(10,2),TotalQuantumOfJobSquareInch decimal(10,2),
PerUnitRate decimal(10,2),PerDayUnitRate decimal(10,2))
Insert @TableVariable
EXEC [NDTUAT].[prc_GetMagneticParticleReportSummaryBillingByReportID]  
  @ClientID = 1,  
  @ReportId = 42,    
  @RateType = 2,  
  @ContractNo = NULL,  
  @FabricatorName = NULL,  
  @StartDate = NULL,  
  @EndDate = NULL,  
  @SummaryType = 2  
  
Declare @outStr decimal(10,2)  
SELECT @outStr = TotalQuantumOfJobSquareInch  from @TableVariable

Declare @SPName Varchar(255) 
Select @SPName = ISNULL(OBJECT_NAME(@@PROCID),'') 
EXEC NDTUAT.tsu_Assert @outStr,12342.00,@SPName     
  
END
GO
/****** Object:  StoredProcedure [dbo].[ut_MagneticParticleBillSummarySquareInch_Total]    Script Date: 08/22/2013 09:08:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Square inch


ALTER PROCEDURE [dbo].[ut_MagneticParticleBillSummarySquareInch_Total] AS 
BEGIN 

Declare @TableVariable as table (Total decimal(10,2),TotalQuantumOfJobInch decimal(10,2),
PerUnitRate decimal(10,2),PerDayUnitRate decimal(10,2))
Insert @TableVariable
EXEC [NDTUAT].[prc_GetMagneticParticleReportSummaryBillingByReportID]  
  @ClientID = 1,  
  @ReportId = 42,    
  @RateType = 2,  
  @ContractNo = NULL,  
  @FabricatorName = NULL,  
  @StartDate = NULL,  
  @EndDate = NULL,  
  @SummaryType = 2  
  
Declare @outStr decimal(10,2)  
SELECT @outStr = TOTAL from @TableVariable

Declare @SPName Varchar(255) 
Select @SPName = ISNULL(OBJECT_NAME(@@PROCID),'') 
EXEC NDTUAT.tsu_Assert @outStr,1770.00,@SPName     
  
END
GO
/****** Object:  StoredProcedure [dbo].[ut_MagneticParticleBillSummarySquareInch_PerUnitRate]    Script Date: 08/22/2013 09:08:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ut_MagneticParticleBillSummarySquareInch_PerUnitRate] AS 
BEGIN 

Declare @TableVariable as table (Total decimal(10,2),TotalQuantumOfJobInch decimal(10,2),
PerUnitRate decimal(10,2),PerDayUnitRate decimal(10,2))
Insert @TableVariable
EXEC [NDTUAT].[prc_GetMagneticParticleReportSummaryBillingByReportID]  
  @ClientID = 1,  
  @ReportId = 42,    
  @RateType = 2,  
  @ContractNo = NULL,  
  @FabricatorName = NULL,  
  @StartDate = NULL,  
  @EndDate = NULL,  
  @SummaryType = 2  
  
Declare @outStr decimal(10,2)  
SELECT @outStr = PerUnitRate from @TableVariable

Declare @SPName Varchar(255) 
Select @SPName = ISNULL(OBJECT_NAME(@@PROCID),'') 
EXEC NDTUAT.tsu_Assert @outStr,10.00,@SPName      
END
GO
/****** Object:  StoredProcedure [dbo].[ut_MagneticParticleBillSummarySquareInch_PerDayUnitRate]    Script Date: 08/22/2013 09:08:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ut_MagneticParticleBillSummarySquareInch_PerDayUnitRate] AS 
BEGIN 

Declare @TableVariable as table (Total decimal(10,2),TotalQuantumOfJobInch decimal(10,2),
PerUnitRate decimal(10,2),PerDayUnitRate decimal(10,2))
Insert @TableVariable
EXEC [NDTUAT].[prc_GetMagneticParticleReportSummaryBillingByReportID]  
  @ClientID = 1,  
  @ReportId = 42,    
  @RateType = 2,  
  @ContractNo = NULL,  
  @FabricatorName = NULL,  
  @StartDate = NULL,  
  @EndDate = NULL,  
  @SummaryType = 2  
  
Declare @outStr decimal(10,2)  
SELECT @outStr = PerDayUnitRate from @TableVariable

Declare @SPName Varchar(255) 
Select @SPName = ISNULL(OBJECT_NAME(@@PROCID),'') 
EXEC NDTUAT.tsu_Assert @outStr,120.00,@SPName     
  
END
GO
/****** Object:  StoredProcedure [dbo].[ut_MagneticParticleBillSummaryRunningInch_TotalQuantumOfJobInch_Only]    Script Date: 08/22/2013 09:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Quantum

ALTER PROCEDURE [dbo].[ut_MagneticParticleBillSummaryRunningInch_TotalQuantumOfJobInch_Only] AS 
BEGIN 

Declare @TableVariable as table (TotalQuantumOfJobInch decimal(10,2))
Insert @TableVariable
EXEC [NDTUAT].[prc_GetMagneticParticleReportSummaryBillingByReportID]  
  @ClientID = 1,  
  @ReportId = 42,    
  @RateType = 1,  
  @ContractNo = NULL,  
  @FabricatorName = NULL,  
  @StartDate = NULL,  
  @EndDate = NULL,  
  @SummaryType = 1
  
Declare @outStr decimal(10,2)  
SELECT @outStr = TotalQuantumOfJobInch  from @TableVariable

Declare @SPName Varchar(255) 
Select @SPName = ISNULL(OBJECT_NAME(@@PROCID),'') 
EXEC NDTUAT.tsu_Assert @outStr,165.00,@SPName        
  
END
GO
/****** Object:  StoredProcedure [dbo].[ut_MagneticParticleBillSummaryRunningInch_TotalQuantumOfJobInch]    Script Date: 08/22/2013 09:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ut_MagneticParticleBillSummaryRunningInch_TotalQuantumOfJobInch] AS 
BEGIN 

Declare @TableVariable as table (Total decimal(10,2),TotalQuantumOfJobInch decimal(10,2),
PerUnitRate decimal(10,2),PerDayUnitRate decimal(10,2))
Insert @TableVariable
EXEC [NDTUAT].[prc_GetMagneticParticleReportSummaryBillingByReportID]  
  @ClientID = 1,  
  @ReportId = 42,    
  @RateType = 1,  
  @ContractNo = NULL,  
  @FabricatorName = NULL,  
  @StartDate = NULL,  
  @EndDate = NULL,  
  @SummaryType = 2  
  
Declare @outStr decimal(10,2)  
SELECT @outStr = TotalQuantumOfJobInch  from @TableVariable

Declare @SPName Varchar(255) 
Select @SPName = ISNULL(OBJECT_NAME(@@PROCID),'') 
EXEC NDTUAT.tsu_Assert @outStr,165.00,@SPName
  
END
GO
/****** Object:  StoredProcedure [dbo].[ut_MagneticParticleBillSummaryRunningInch_Total]    Script Date: 08/22/2013 09:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ut_MagneticParticleBillSummaryRunningInch_Total] AS 
BEGIN 

Declare @TableVariable as table (Total decimal(10,2),TotalQuantumOfJobInch decimal(10,2),
PerUnitRate decimal(10,2),PerDayUnitRate decimal(10,2))
Insert @TableVariable
EXEC [NDTUAT].[prc_GetMagneticParticleReportSummaryBillingByReportID]  
  @ClientID = 1,  
  @ReportId = 42,    
  @RateType = 1,  
  @ContractNo = NULL,  
  @FabricatorName = NULL,  
  @StartDate = NULL,  
  @EndDate = NULL,  
  @SummaryType = 2  
  
Declare @outStr decimal(10,2)  
SELECT @outStr = TOTAL from @TableVariable

Declare @SPName Varchar(255) 
Select @SPName = ISNULL(OBJECT_NAME(@@PROCID),'') 
EXEC NDTUAT.tsu_Assert @outStr,1770.00,@SPName
  
END
GO
/****** Object:  StoredProcedure [dbo].[ut_MagneticParticleBillSummaryRunningInch_PerUnitRate]    Script Date: 08/22/2013 09:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ut_MagneticParticleBillSummaryRunningInch_PerUnitRate] AS 
BEGIN 

Declare @TableVariable as table (Total decimal(10,2),TotalQuantumOfJobInch decimal(10,2),
PerUnitRate decimal(10,2),PerDayUnitRate decimal(10,2))
Insert @TableVariable
EXEC [NDTUAT].[prc_GetMagneticParticleReportSummaryBillingByReportID]  
  @ClientID = 1,  
  @ReportId = 42,    
  @RateType = 1,  
  @ContractNo = NULL,  
  @FabricatorName = NULL,  
  @StartDate = NULL,  
  @EndDate = NULL,  
  @SummaryType = 2  
  
Declare @outStr decimal(10,2)  
SELECT @outStr = PerUnitRate from @TableVariable

Declare @SPName Varchar(255) 
Select @SPName = ISNULL(OBJECT_NAME(@@PROCID),'') 
EXEC NDTUAT.tsu_Assert @outStr,10.00,@SPName        
  
END
GO
/****** Object:  StoredProcedure [dbo].[ut_MagneticParticleBillSummaryRunningInch_PerDayUnitRate]    Script Date: 08/22/2013 09:08:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ut_MagneticParticleBillSummaryRunningInch_PerDayUnitRate] AS 
BEGIN 

Declare @TableVariable as table (Total decimal(10,2),TotalQuantumOfJobInch decimal(10,2),
PerUnitRate decimal(10,2),PerDayUnitRate decimal(10,2))
Insert @TableVariable
EXEC [NDTUAT].[prc_GetMagneticParticleReportSummaryBillingByReportID]  
  @ClientID = 1,  
  @ReportId = 42,    
  @RateType = 1,  
  @ContractNo = NULL,  
  @FabricatorName = NULL,  
  @StartDate = NULL,  
  @EndDate = NULL,  
  @SummaryType = 2  
  
Declare @outStr decimal(10,2)  
SELECT @outStr = PerDayUnitRate from @TableVariable

Declare @SPName Varchar(255) 
Select @SPName = ISNULL(OBJECT_NAME(@@PROCID),'') 
EXEC NDTUAT.tsu_Assert @outStr,120.00,@SPName
        
END
GO
/****** Object:  StoredProcedure [dbo].[ut_LiquidPenetrantBillSummarySquareInch_TotalQuantumOfJobSquareInch_Only]    Script Date: 08/22/2013 09:08:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ut_LiquidPenetrantBillSummarySquareInch_TotalQuantumOfJobSquareInch_Only]
AS
BEGIN
	DECLARE @TableVariable AS TABLE (TotalQuantumOfJobSquareInch DECIMAL(10, 2))

	INSERT @TableVariable
	EXEC [NDTUAT].[prc_GetLiquidPenetrantReportSummaryBillingByReportID] @ClientID = 1
		,@ReportId = 34
		,@RateType = 2
		,@ContractNo = NULL
		,@FabricatorName = NULL
		,@StartDate = NULL
		,@EndDate = NULL
		,@SummaryType = 1

	DECLARE @outStr DECIMAL(10, 2)

	SELECT @outStr = TotalQuantumOfJobSquareInch
	FROM @TableVariable

	DECLARE @SPName VARCHAR(255)

	SELECT @SPName = ISNULL(OBJECT_NAME(@@PROCID), '')

	EXEC NDTUAT.tsu_Assert @outStr
		,85.00
		,@SPName
END
GO
/****** Object:  StoredProcedure [dbo].[ut_LiquidPenetrantBillSummarySquareInch_TotalQuantumOfJobSquareInch]    Script Date: 08/22/2013 09:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ut_LiquidPenetrantBillSummarySquareInch_TotalQuantumOfJobSquareInch]
AS
BEGIN
	DECLARE @TableVariable AS TABLE (
		Total DECIMAL(10, 2)
		,TotalQuantumOfJobSquareInch DECIMAL(10, 2)
		,PerUnitRate DECIMAL(10, 2)
		,PerDayUnitRate DECIMAL(10, 2)
		)

	INSERT @TableVariable
	EXEC [NDTUAT].[prc_GetLiquidPenetrantReportSummaryBillingByReportID] @ClientID = 1
		,@ReportId = 34
		,@RateType = 2
		,@ContractNo = NULL
		,@FabricatorName = NULL
		,@StartDate = NULL
		,@EndDate = NULL
		,@SummaryType = 2

	DECLARE @outStr DECIMAL(10, 2)

	SELECT @outStr = TotalQuantumOfJobSquareInch
	FROM @TableVariable

	DECLARE @SPName VARCHAR(255)

	SELECT @SPName = ISNULL(OBJECT_NAME(@@PROCID), '')

	EXEC NDTUAT.tsu_Assert @outStr
		,85.00
		,@SPName
END
GO
/****** Object:  StoredProcedure [dbo].[ut_LiquidPenetrantBillSummarySquareInch_Total]    Script Date: 08/22/2013 09:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ut_LiquidPenetrantBillSummarySquareInch_Total]
AS
BEGIN
	DECLARE @TableVariable AS TABLE (
		Total DECIMAL(10, 2)
		,TotalQuantumOfJobInch DECIMAL(10, 2)
		,PerUnitRate DECIMAL(10, 2)
		,PerDayUnitRate DECIMAL(10, 2)
		)

	INSERT @TableVariable
	EXEC [NDTUAT].[prc_GetLiquidPenetrantReportSummaryBillingByReportID] @ClientID = 1
		,@ReportId = 34
		,@RateType = 2
		,@ContractNo = NULL
		,@FabricatorName = NULL
		,@StartDate = NULL
		,@EndDate = NULL
		,@SummaryType = 2

	DECLARE @outStr DECIMAL(10, 2)

	SELECT @outStr = TOTAL
	FROM @TableVariable

	DECLARE @SPName VARCHAR(255)

	SELECT @SPName = ISNULL(OBJECT_NAME(@@PROCID), '')

	EXEC NDTUAT.tsu_Assert @outStr
		,51.00
		,@SPName
END
GO
/****** Object:  StoredProcedure [dbo].[ut_LiquidPenetrantBillSummarySquareInch_PerUnitRate]    Script Date: 08/22/2013 09:08:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ut_LiquidPenetrantBillSummarySquareInch_PerUnitRate]
AS
BEGIN
	DECLARE @TableVariable AS TABLE (
		Total DECIMAL(10, 2)
		,TotalQuantumOfJobInch DECIMAL(10, 2)
		,PerUnitRate DECIMAL(10, 2)
		,PerDayUnitRate DECIMAL(10, 2)
		)

	INSERT @TableVariable
	EXEC [NDTUAT].[prc_GetLiquidPenetrantReportSummaryBillingByReportID] @ClientID = 1
		,@ReportId = 34
		,@RateType = 2
		,@ContractNo = NULL
		,@FabricatorName = NULL
		,@StartDate = NULL
		,@EndDate = NULL
		,@SummaryType = 2

	DECLARE @outStr DECIMAL(10, 2)

	SELECT @outStr = PerUnitRate
	FROM @TableVariable

	DECLARE @SPName VARCHAR(255)

	SELECT @SPName = ISNULL(OBJECT_NAME(@@PROCID), '')

	EXEC NDTUAT.tsu_Assert @outStr
		,3.00
		,@SPName
END
GO
/****** Object:  StoredProcedure [dbo].[ut_LiquidPenetrantBillSummarySquareInch_PerDayUnitRate]    Script Date: 08/22/2013 09:08:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ut_LiquidPenetrantBillSummarySquareInch_PerDayUnitRate]
AS
BEGIN
	DECLARE @TableVariable AS TABLE (
		Total DECIMAL(10, 2)
		,TotalQuantumOfJobInch DECIMAL(10, 2)
		,PerUnitRate DECIMAL(10, 2)
		,PerDayUnitRate DECIMAL(10, 2)
		)

	INSERT @TableVariable
	EXEC [NDTUAT].[prc_GetLiquidPenetrantReportSummaryBillingByReportID] @ClientID = 1
		,@ReportId = 34
		,@RateType = 2
		,@ContractNo = NULL
		,@FabricatorName = NULL
		,@StartDate = NULL
		,@EndDate = NULL
		,@SummaryType = 2

	DECLARE @outStr DECIMAL(10, 2)

	SELECT @outStr = PerDayUnitRate
	FROM @TableVariable

	DECLARE @SPName VARCHAR(255)

	SELECT @SPName = ISNULL(OBJECT_NAME(@@PROCID), '')

	EXEC NDTUAT.tsu_Assert @outStr
		,18.00
		,@SPName
END
GO
/****** Object:  StoredProcedure [dbo].[ut_LiquidPenetrantBillSummaryRunningInch_TotalQuantumOfJobInch_Only]    Script Date: 08/22/2013 09:08:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ut_LiquidPenetrantBillSummaryRunningInch_TotalQuantumOfJobInch_Only]
AS
BEGIN
	DECLARE @TableVariable AS TABLE (TotalQuantumOfJobInch DECIMAL(10, 2))

	INSERT @TableVariable
	EXEC [NDTUAT].[prc_GetLiquidPenetrantReportSummaryBillingByReportID] @ClientID = 1
		,@ReportId = 34
		,@RateType = 1
		,@ContractNo = NULL
		,@FabricatorName = NULL
		,@StartDate = NULL
		,@EndDate = NULL
		,@SummaryType = 1

	DECLARE @outStr DECIMAL(10, 2)

	SELECT @outStr = TotalQuantumOfJobInch
	FROM @TableVariable

	DECLARE @SPName VARCHAR(255)

	SELECT @SPName = ISNULL(OBJECT_NAME(@@PROCID), '')

	EXEC NDTUAT.tsu_Assert @outStr
		,11.00
		,@SPName
END
GO
/****** Object:  StoredProcedure [dbo].[ut_LiquidPenetrantBillSummaryRunningInch_TotalQuantumOfJobInch]    Script Date: 08/22/2013 09:08:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ut_LiquidPenetrantBillSummaryRunningInch_TotalQuantumOfJobInch]
AS
BEGIN
	DECLARE @TableVariable AS TABLE (
		Total DECIMAL(10, 2)
		,TotalQuantumOfJobInch DECIMAL(10, 2)
		,PerUnitRate DECIMAL(10, 2)
		,PerDayUnitRate DECIMAL(10, 2)
		)

	INSERT @TableVariable
	EXEC [NDTUAT].[prc_GetLiquidPenetrantReportSummaryBillingByReportID] @ClientID = 1
		,@ReportId = 34
		,@RateType = 1
		,@ContractNo = NULL
		,@FabricatorName = NULL
		,@StartDate = NULL
		,@EndDate = NULL
		,@SummaryType = 2

	DECLARE @outStr DECIMAL(10, 2)

	SELECT @outStr = TotalQuantumOfJobInch
	FROM @TableVariable

	DECLARE @SPName VARCHAR(255)

	SELECT @SPName = ISNULL(OBJECT_NAME(@@PROCID), '')

	EXEC NDTUAT.tsu_Assert @outStr
		,11.00
		,@SPName
END
GO
/****** Object:  StoredProcedure [dbo].[ut_LiquidPenetrantBillSummaryRunningInch_Total]    Script Date: 08/22/2013 09:08:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ut_LiquidPenetrantBillSummaryRunningInch_Total]
AS
BEGIN
	DECLARE @TableVariable AS TABLE (
		Total DECIMAL(10, 2)
		,TotalQuantumOfJobInch DECIMAL(10, 2)
		,PerUnitRate DECIMAL(10, 2)
		,PerDayUnitRate DECIMAL(10, 2)
		)

	INSERT @TableVariable
	EXEC [NDTUAT].[prc_GetLiquidPenetrantReportSummaryBillingByReportID] @ClientID = 1
		,@ReportId = 34
		,@RateType = 1
		,@ContractNo = NULL
		,@FabricatorName = NULL
		,@StartDate = NULL
		,@EndDate = NULL
		,@SummaryType = 2

	DECLARE @outStr DECIMAL(10, 2)

	SELECT @outStr = TOTAL
	FROM @TableVariable

	DECLARE @SPName VARCHAR(255)

	SELECT @SPName = ISNULL(OBJECT_NAME(@@PROCID), '')

	EXEC NDTUAT.tsu_Assert @outStr
		,51.00
		,@SPName
END
GO
/****** Object:  StoredProcedure [dbo].[ut_LiquidPenetrantBillSummaryRunningInch_PerUnitRate]    Script Date: 08/22/2013 09:08:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ut_LiquidPenetrantBillSummaryRunningInch_PerUnitRate]
AS
BEGIN
	DECLARE @TableVariable AS TABLE (
		Total DECIMAL(10, 2)
		,TotalQuantumOfJobInch DECIMAL(10, 2)
		,PerUnitRate DECIMAL(10, 2)
		,PerDayUnitRate DECIMAL(10, 2)
		)

	INSERT @TableVariable
	EXEC [NDTUAT].[prc_GetLiquidPenetrantReportSummaryBillingByReportID] @ClientID = 1
		,@ReportId = 34
		,@RateType = 1
		,@ContractNo = NULL
		,@FabricatorName = NULL
		,@StartDate = NULL
		,@EndDate = NULL
		,@SummaryType = 2

	DECLARE @outStr DECIMAL(10, 2)

	SELECT @outStr = PerUnitRate
	FROM @TableVariable

	DECLARE @SPName VARCHAR(255)

	SELECT @SPName = ISNULL(OBJECT_NAME(@@PROCID), '')

	EXEC NDTUAT.tsu_Assert @outStr
		,3.00
		,@SPName
END
GO
/****** Object:  StoredProcedure [dbo].[ut_LiquidPenetrantBillSummaryRunningInch_PerDayUnitRate]    Script Date: 08/22/2013 09:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ut_LiquidPenetrantBillSummaryRunningInch_PerDayUnitRate]
AS
BEGIN
	DECLARE @TableVariable AS TABLE (
		Total DECIMAL(10, 2)
		,TotalQuantumOfJobInch DECIMAL(10, 2)
		,PerUnitRate DECIMAL(10, 2)
		,PerDayUnitRate DECIMAL(10, 2)
		)

	INSERT @TableVariable
	EXEC [NDTUAT].[prc_GetLiquidPenetrantReportSummaryBillingByReportID] @ClientID = 1
		,@ReportId = 34
		,@RateType = 1
		,@ContractNo = NULL
		,@FabricatorName = NULL
		,@StartDate = NULL
		,@EndDate = NULL
		,@SummaryType = 2

	DECLARE @outStr DECIMAL(10, 2)

	SELECT @outStr = PerDayUnitRate
	FROM @TableVariable

	DECLARE @SPName VARCHAR(255)

	SELECT @SPName = ISNULL(OBJECT_NAME(@@PROCID), '')

	EXEC NDTUAT.tsu_Assert @outStr
		,18.00
		,@SPName
END
GO
