CREATE PROCEDURE [NDTUAT].[prc_GetLiquidPenetrantReportALLSummaryBillingByReportID]    
 @ClientID AS INT,    
 @ReportId AS INT 
AS    
/*
EXEC [NDTUAT].[prc_GetLiquidPenetrantReportALLSummaryBillingByReportID]
		@ClientID = NULL,
		@ReportId = 34
		*/
BEGIN    

EXEC [NDTUAT].[prc_GetLiquidPenetrantReportSummaryBillingByReportID]
		@ClientID = @ClientID,
		@ReportId = @ReportId,		
		@RateType = 1,
		@ContractNo = NULL,
		@FabricatorName = NULL,
		@StartDate = NULL,
		@EndDate = NULL,
		@SummaryType = 1 
		
EXEC [NDTUAT].[prc_GetLiquidPenetrantReportSummaryBillingByReportID]
		@ClientID = @ClientID,
		@ReportId = @ReportId,		
		@RateType = 1,
		@ContractNo = NULL,
		@FabricatorName = NULL,
		@StartDate = NULL,
		@EndDate = NULL,
		@SummaryType = 2
		

EXEC [NDTUAT].[prc_GetLiquidPenetrantReportSummaryBillingByReportID]
		@ClientID = @ClientID,
		@ReportId = @ReportId,		
		@RateType = 2,
		@ContractNo = NULL,
		@FabricatorName = NULL,
		@StartDate = NULL,
		@EndDate = NULL,
		@SummaryType = 1 
		


EXEC [NDTUAT].[prc_GetLiquidPenetrantReportSummaryBillingByReportID]
		@ClientID = @ClientID,
		@ReportId = @ReportId,		
		@RateType = 2,
		@ContractNo = NULL,
		@FabricatorName = NULL,
		@StartDate = NULL,
		@EndDate = NULL,
		@SummaryType = 2	
    		

END    
