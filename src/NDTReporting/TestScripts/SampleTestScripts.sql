--Testing bulid
Select OBJECT_DEFINITION(Object_Id(name)) from sys.objects X where X.type = 'P' and X.name like 'ut_M%'
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
		,15.00
		,@SPName
END
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
		,1455.00
		,@SPName
END
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
		,15.00
		,@SPName
END
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
		,110655.00
		,@SPName
END
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
		,7371.00
		,@SPName
END
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
		,7371.00
		,@SPName
END