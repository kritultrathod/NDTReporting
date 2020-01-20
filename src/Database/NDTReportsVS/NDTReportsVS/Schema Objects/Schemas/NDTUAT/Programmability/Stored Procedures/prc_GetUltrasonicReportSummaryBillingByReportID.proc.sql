CREATE PROCEDURE [NDTUAT].[prc_GetUltrasonicReportSummaryBillingByReportID]        
 @ClientID AS INT,        
 @ReportId AS INT,    
 @RateType AS INT, --1 for running inch  and 2 for sqaure inch        
 @ContractNo AS nvarchar(400),    
 @FabricatorName AS nvarchar(400),     
 @StartDate AS datetime,    
 @EndDate AS datetime,    
 @SummaryType AS INT -- 1 for Summary only quantum of job (customer needs to display only total quantum of job but as of 1st release we have displayed all info)  and 2 for Billing Summary    
AS        
/*    
  
Responsibility : This Store proc has 2 responsiblity.  
1st to get the report when report id is passed. standard single report  
2nd to get accumalated report based on fabricators and contract no in the given date range.  
  
EXEC [NDTUAT].[prc_GetUltrasonicReportSummaryBillingByReportID]    
  @ClientID = NULL,    
  @ReportId = 5,    
  @RateType = 2,    
  @ContractNo = NULL,    
  @FabricatorName = NULL,    
  @StartDate = NULL,    
  @EndDate = NULL,    
  @SummaryType = 1    
*/    
BEGIN        
          
DECLARE @SQL NVARCHAR(4000);    
DECLARE @ParameterDefinition NVARCHAR(4000);    
    
SELECT @ParameterDefinition = '    
 @RateTypeParameter INT,    
 @ReportIDParameter INT,     
 @ContractNoParameter AS nvarchar(400),    
 @FabricatorNameParameter AS nvarchar(400),     
 @StartDateParameter AS datetime,    
 @EndDateParameter AS datetime,      
 @SummaryTypeParameter AS INT,     
 @ClientIDParameter AS INT    
';    
    
BEGIN TRY     
    
SELECT @SQL = N'    
  Declare @TotalQuantumOfJobSquareInch AS Decimal(18,2)    
  Declare @TotalQuantumOfJobInch AS Decimal(18,2)    
  Declare @PerUnitRate AS Decimal(18,2)    
  Declare @PerDayUnitRate AS Decimal(18,2)    
  SELECT @TotalQuantumOfJobSquareInch = SUM(    
   CONVERT(Decimal(18,2),RWTR.UltrasonicQuantityX) *    
   CONVERT(Decimal(18,2),RWTR.UltrasonicQuantityY)),    
  @TotalQuantumOfJobInch =  SUM(    
   case when      
    CONVERT(Decimal(18,2),RWTR.UltrasonicQuantityX)    
   >    
    CONVERT(Decimal(18,2),RWTR.UltrasonicQuantityY)    
   then     
    CONVERT(Decimal(18,2),RWTR.UltrasonicQuantityX)    
   else       
    CONVERT(Decimal(18,2),RWTR.UltrasonicQuantityY)    
   end     
   ),      
  @PerUnitRate = CSB.PerUnitRate,    
  @PerDayUnitRate = PDR.PerDayUnitRate    
  FROM  NDTUAT.UltrasonicExaminationTestResults RWTR     
 LEFT OUTER JOIN     
  NDTUAT.UltrasonicExaminationTest RW     
  ON RW.ReportId = RWTR.ReportId      
 LEFT OUTER JOIN     
  NDTUAT.ConsumablesRate CSB    
  ON CSB.SubTest = RW.SubTestID      
  AND CSB.ConsumablesType = RW.ConsumablesType 
  AND CSB.ClientID = @ClientIDParameter     
 LEFT OUTER JOIN         
 NDTUAT.PerDayRates PDR      
  ON PDR.SubTestid = RW.SubTestID    
  AND PDR.ClientID = @ClientIDParameter         
  Where RW.ClientID = @ClientIDParameter AND ';    
      
  
IF IsNumeric(@ReportID) = 1     
SELECT @SQL = @SQL + N'    
 RWTR.ReportId = @ReportIDParameter ';    
    
IF IsNumeric(@ReportID) <> 1     
SELECT @SQL = @SQL + N'     
 RW.ContractNo like  ''%'' + @ContractNoParameter + ''%'' OR    
 RW.Client like ''%'' + @FabricatorNameParameter + ''%'' OR    
 ( RW.TestDate >= @StartDateParameter AND    
 RW.TestDate <= @EndDateParameter)    
 ' ;    
      
SELECT @SQL = @SQL + N' GROUP BY     
  CSB.PerUnitRate,    
  PDR.PerDayUnitRate           
 if(@RateTypeParameter = 1 AND @SummaryTypeParameter = 1)    
  Select isnull(@TotalQuantumOfJobInch,0.0) As TotalQuantumOfJobInch     
 else if(@RateTypeParameter = 1 AND @SummaryTypeParameter = 2)    
  Select Cast(isnull(@TotalQuantumOfJobInch,0.0) * isnull(@PerUnitRate,0.0) + isnull(@PerDayUnitRate,0.0) As decimal(8, 2)) As Total ,     
   isnull(@TotalQuantumOfJobInch,0.0) AS TotalQuantumOfJobInch ,    
   isnull(@PerUnitRate,0.0) As PerUnitRate ,     
   isnull(@PerDayUnitRate,0.0) As PerDayUnitRate     
 else if(@RateTypeParameter = 2 AND @SummaryTypeParameter = 1)    
  Select isnull(@TotalQuantumOfJobSquareInch,0.0) As TotalQuantumOfJobSquareInch    
 else if(@RateTypeParameter = 2 AND @SummaryTypeParameter = 2)    
  Select Cast(isnull(@TotalQuantumOfJobInch,0.0) * isnull(@PerUnitRate,0.0) + isnull(@PerDayUnitRate,0.0) As decimal(8, 2)) As Total ,     
   isnull(@TotalQuantumOfJobSquareInch,0.0) AS TotalQuantumOfJobSquareInch ,    
   isnull(@PerUnitRate,0.0) As PerUnitRate ,     
   isnull(@PerDayUnitRate,0.0) As PerDayUnitRate      
 ';    
    
EXEC sp_executeSQL     
 @SQL,    
 @ParameterDefinition,    
 @RateTypeParameter = @RateType,    
 @ReportIDParameter = @ReportId,      
    @ContractNoParameter = @ContractNo,    
    @FabricatorNameParameter = @FabricatorName,    
    @StartDateParameter = @StartDate,    
 @EndDateParameter = @EndDate,    
 @SummaryTypeParameter = @SummaryType,    
 @ClientIDParameter = @ClientID;    
END TRY    
BEGIN CATCH     
 EXEC [NDTUAT].[usp_GetErrorInfo]       
END CATCH    
    
END
