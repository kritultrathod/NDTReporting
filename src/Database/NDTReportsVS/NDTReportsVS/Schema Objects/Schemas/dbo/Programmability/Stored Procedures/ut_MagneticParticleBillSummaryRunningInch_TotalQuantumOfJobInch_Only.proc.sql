--Quantum

CREATE PROCEDURE [dbo].[ut_MagneticParticleBillSummaryRunningInch_TotalQuantumOfJobInch_Only] AS 
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
