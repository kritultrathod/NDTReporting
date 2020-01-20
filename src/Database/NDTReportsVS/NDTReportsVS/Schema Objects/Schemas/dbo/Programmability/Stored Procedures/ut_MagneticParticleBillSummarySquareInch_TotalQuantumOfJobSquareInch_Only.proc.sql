CREATE PROCEDURE [dbo].[ut_MagneticParticleBillSummarySquareInch_TotalQuantumOfJobSquareInch_Only] AS 

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
