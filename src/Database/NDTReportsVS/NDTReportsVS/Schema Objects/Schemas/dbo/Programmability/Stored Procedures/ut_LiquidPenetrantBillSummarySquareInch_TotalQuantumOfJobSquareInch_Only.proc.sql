CREATE PROCEDURE [dbo].[ut_LiquidPenetrantBillSummarySquareInch_TotalQuantumOfJobSquareInch_Only]
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
