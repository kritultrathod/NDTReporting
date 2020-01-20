CREATE PROCEDURE [NDTUAT].[prc_GetMagneticParticleReportAllSummaryBillingByReportID]    
 @ClientID AS INT,    
 @ReportId AS INT 
AS    
/*
EXEC [NDTUAT].[prc_GetRadiographicReportAllSummaryBillingByReportID]
		@ClientID = NULL,
		@ReportId = 135
		*/
BEGIN    

EXEC [NDTUAT].[prc_GetMagneticParticleReportSummaryBillingByReportID]
		@ClientID = @ClientID,
		@ReportId = @ReportId,		
		@RateType = 1,
		@ContractNo = NULL,
		@FabricatorName = NULL,
		@StartDate = NULL,
		@EndDate = NULL,
		@SummaryType = 1 
		
EXEC [NDTUAT].[prc_GetMagneticParticleReportSummaryBillingByReportID]
		@ClientID = @ClientID,
		@ReportId = @ReportId,		
		@RateType = 1,
		@ContractNo = NULL,
		@FabricatorName = NULL,
		@StartDate = NULL,
		@EndDate = NULL,
		@SummaryType = 2
		

EXEC [NDTUAT].[prc_GetMagneticParticleReportSummaryBillingByReportID]
		@ClientID = @ClientID,
		@ReportId = @ReportId,		
		@RateType = 2,
		@ContractNo = NULL,
		@FabricatorName = NULL,
		@StartDate = NULL,
		@EndDate = NULL,
		@SummaryType = 1 
		


EXEC [NDTUAT].[prc_GetMagneticParticleReportSummaryBillingByReportID]
		@ClientID = @ClientID,
		@ReportId = @ReportId,		
		@RateType = 2,
		@ContractNo = NULL,
		@FabricatorName = NULL,
		@StartDate = NULL,
		@EndDate = NULL,
		@SummaryType = 2	
    		

END    
