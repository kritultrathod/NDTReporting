CREATE PROCEDURE [NDTUAT].[prc_GetUTTestReportById]      
(    
 @CustomReportTemplateId AS INT,          
 @ReportId AS INT     
)    
AS    
BEGIN
  
 -- BEGIN PROC    
 --<VALIDATE INPUT PARAMS> IF INVALID RETURN <CUSTOM_ERROR_CODE>    
 --<CHECK EXISTANCE IN DB>    
 BEGIN TRY    
   
DECLARE @SubTestID int
  
DECLARE @ClientID int
SELECT
	@SubTestID = SubTestID,
	@ClientID = ClientID
FROM [NDTUAT].[UltrasonicExaminationTest]
WHERE ReportId = @ReportId

SELECT
	B.CustomReportTemplateDetailsId AS ID,
	A.SubTestId AS SubTestId,
	A.TemplateName AS ReportTemplateName,
	B.ReportTemplate AS ReportTemplate,
	B.SectionsId AS SectionsID,
	B.ClientId AS ClientId,
	A.CustomReportTemplateId AS CustomReportTemplateId,
	A.BaseReportTemplateId AS BaseReportTemplateId,
	A.AppId AS AppId,
	A.ClientId AS ClientId
FROM [NDTUAT].CustomReportTemplate A
INNER JOIN [NDTUAT].CustomReportTemplateDetails B
	ON A.CustomReportTemplateId = B.CustomReportTemplateId
WHERE A.CustomReportTemplateId = @CustomReportTemplateId AND A.DeletedStatus = 0
ORDER BY B.SectionsId

--modified by ritesh      
SELECT
	A.*,
	B.Code,
	B.TestSpecification,
	B.TestProcedureNo,
	B.AcceptanceStandard,
	E.ParamDesc1 AS ConsumablesTypeText
FROM [NDTUAT].[UltrasonicExaminationTest] A
LEFT JOIN [NDTUAT].[RefDocuments] B
	ON A.ReferenceCode = B.RefDocumentId
LEFT JOIN [NDTUAT].[LookUpMaster] E
	ON E.ParamKey = A.ConsumablesType AND E.SubtestId = @SubTestID AND E.ClientId = @ClientID AND E.LookupCode = 'ConsumablesType'
WHERE A.ReportId = @ReportId AND A.DeletedStatus = 0

--modified by ritesh      
SELECT
	ROW_NUMBER() OVER (ORDER BY TestId ASC) AS SrNo,
	A.*,
	B.ParamDesc1 AS ObservationsShortName,
	C.ParamDesc1 AS Remarks
FROM [NDTUAT].[UltrasonicExaminationTestResults] A
LEFT JOIN [NDTUAT].[LookUpMaster] B
	ON A.ObservationsId = B.ParamKey AND B.SubTestId = @SubTestID AND B.ClientID = @ClientID AND B.LookupCode = 'Observations'
LEFT JOIN [NDTUAT].[LookUpMaster] C
	ON A.Result = C.ParamKey AND C.SubTestId = @SubTestID AND C.ClientID = @ClientID AND C.LookupCode = 'Remarks'
WHERE A.ReportId = @ReportId AND A.DeletedStatus = 0
  
  
 END TRY    
 BEGIN CATCH
--LOG ERROR IN DB    
EXEC [NDTUAT].[usp_GetErrorInfo]
  
      
  RETURN
  
      
 END CATCH
  
    
END
  
 -- END PROC    
    
  