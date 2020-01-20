CREATE PROCEDURE [dbo].[ut_UltrasonicBillSummarySquareInch_TotalQuantumOfJobSquareInch_Only]
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
