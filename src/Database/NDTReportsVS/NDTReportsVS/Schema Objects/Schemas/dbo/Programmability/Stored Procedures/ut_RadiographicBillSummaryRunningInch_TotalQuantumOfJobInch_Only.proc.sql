--Quantum

CREATE PROCEDURE [dbo].[ut_RadiographicBillSummaryRunningInch_TotalQuantumOfJobInch_Only] AS 
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
