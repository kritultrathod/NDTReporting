﻿--Square inch


CREATE PROCEDURE [dbo].[ut_MagneticParticleBillSummarySquareInch_Total] AS 
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