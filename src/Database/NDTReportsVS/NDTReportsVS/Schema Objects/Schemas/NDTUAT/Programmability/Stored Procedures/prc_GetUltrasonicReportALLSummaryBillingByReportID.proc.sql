CREATE PROCEDURE [NDTUAT].[prc_GetUltrasonicReportALLSummaryBillingByReportID]    
 @ClientID AS INT,    
 @ReportId AS INT 
AS    
/*
EXEC [NDTUAT].[prc_GetUltrasonicReportALLSummaryBillingByReportID]
		@ClientID = 1,
		@ReportId = 5
		*/
BEGIN    

EXEC [NDTUAT].[prc_GetUltrasonicReportSummaryBillingByReportID]
		@ClientID = @ClientID,
		@ReportId = @ReportId,		
		@RateType = 1,
		@ContractNo = NULL,
		@FabricatorName = NULL,
		@StartDate = NULL,
		@EndDate = NULL,
		@SummaryType = 1 
		
EXEC [NDTUAT].[prc_GetUltrasonicReportSummaryBillingByReportID]
		@ClientID = @ClientID,
		@ReportId = @ReportId,		
		@RateType = 1,
		@ContractNo = NULL,
		@FabricatorName = NULL,
		@StartDate = NULL,
		@EndDate = NULL,
		@SummaryType = 2
		

EXEC [NDTUAT].[prc_GetUltrasonicReportSummaryBillingByReportID]
		@ClientID = @ClientID,
		@ReportId = @ReportId,		
		@RateType = 2,
		@ContractNo = NULL,
		@FabricatorName = NULL,
		@StartDate = NULL,
		@EndDate = NULL,
		@SummaryType = 1 
		


EXEC [NDTUAT].[prc_GetUltrasonicReportSummaryBillingByReportID]
		@ClientID = @ClientID,
		@ReportId = @ReportId,		
		@RateType = 2,
		@ContractNo = NULL,
		@FabricatorName = NULL,
		@StartDate = NULL,
		@EndDate = NULL,
		@SummaryType = 2	
    		

END    
