CREATE PROCEDURE [dbo].[ut_LiquidPenetrantBillSummaryRunningInch_TotalQuantumOfJobInch_Only]
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
