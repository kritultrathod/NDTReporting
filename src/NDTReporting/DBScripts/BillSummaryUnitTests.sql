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
IF ASCII(@outStr) <> ASCII(475.00) 
        EXEC NDTUAT.tsu_failure 'RadiographicBillSummaryRunningInch_Total was incorrect. Expected value was 475.00'   
  
END
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
IF ASCII(@outStr) <> ASCII(10.00) 
        EXEC NDTUAT.tsu_failure 'RadiographicBillSummaryRunningInch_TotalQuantumOfJobInch was incorrect. Expected value was 10.00'   
  
END
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
IF ASCII(@outStr) <> ASCII(40.00) 
        EXEC NDTUAT.tsu_failure 'RadiographicBillSummaryRunningInchPerUnitRate was incorrect. Expected value was 40.00'   
  
END
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
IF ASCII(@outStr) <> ASCII(75.00) 
        EXEC NDTUAT.tsu_failure 'RadiographicBillSummaryRunningInch_PerDayUnitRate was incorrect. Expected value was 75.00'   
  
END

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
IF ASCII(@outStr) <> ASCII(1675.00) 
        EXEC NDTUAT.tsu_failure 'RadiographicBillSummarySquareInch_Total was incorrect. Expected value was 1675.00'   
  
END
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
IF ASCII(@outStr) <> ASCII(40.00) 
        EXEC NDTUAT.tsu_failure 'RadiographicBillSummarySquareInchTotal_QuantumOfJobSquareInch was incorrect. Expected value was 40.00'   
  
END
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
IF ASCII(@outStr) <> ASCII(40.00) 
        EXEC NDTUAT.tsu_failure 'RadiographicBillSummarySquareInch_PerUnitRate was incorrect. Expected value was 40.00'   
  
END

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
IF ASCII(@outStr) <> ASCII(75.00) 
        EXEC NDTUAT.tsu_failure 'RadiographicBillSummarySquareInch_PerDayUnitRate was incorrect. Expected value was 75.00'   
  
END
GO
--Quantum

ALTER PROCEDURE [dbo].[ut_RadiographicBillSummaryRunningInch_TotalQuantumOfJobInch_Only] AS 
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
  @SummaryType = 1
  
Declare @outStr decimal(10,2)  
SELECT @outStr = TotalQuantumOfJobInch  from @TableVariable
IF ASCII(@outStr) <> ASCII(10.00) 
        EXEC NDTUAT.tsu_failure 'RadiographicBillSummaryRunningInch_TotalQuantumOfJobInch_Only was incorrect. Expected value was 10.00'   
  
END

GO
ALTER PROCEDURE [dbo].[ut_RadiographicBillSummarySquareInch_TotalQuantumOfJobSquareInch_Only] AS 

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
IF ASCII(@outStr) <> ASCII(40.00) 
        EXEC NDTUAT.tsu_failure 'RadiographicBillSummarySquareInch_TotalQuantumOfJobSquareInch_Only was incorrect. Expected value was 40.00.'
  
END
GO
