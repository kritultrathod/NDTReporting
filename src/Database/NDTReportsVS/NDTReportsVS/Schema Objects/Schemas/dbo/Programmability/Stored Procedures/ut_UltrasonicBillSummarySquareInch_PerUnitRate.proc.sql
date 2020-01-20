CREATE PROCEDURE [dbo].[ut_UltrasonicBillSummarySquareInch_PerUnitRate]
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
