CREATE PROCEDURE [NDTUAT].[prc_GetMagneticParticleTestReportById]  
(  
 @ReportId AS INT  
)  
AS  
BEGIN -- BEGIN PROC  
 --<VALIDATE INPUT PARAMS> IF INVALID RETURN <CUSTOM_ERROR_CODE>  
 --<CHECK EXISTANCE IN DB>  
 BEGIN TRY  
   SELECT 
		 ReportId
		,FabricatorName
		,SubTestId
		,Location
		,ReportNo
		,ContractNo
		,ContactPerson
		,CONVERT(varchar(10), DateofTesting,103) AS DateofTesting
		,JobDescription
		,Material
		,Dimension
		,SurfaceCondition
		,ReferenceCode
		,AcceptanceCriteria
		,TechSheetNo
		,ExtentofCoverage
		,SurfaceTemperature
		,ConsumablesType
		,TechniqueId
		,Direction
		,MagnetizationCurrent
		,DetectionMedia
		,Concentration
		,Illuminance
		,ContrastPaint
		,Demagnetizing
		,Equipment
		,CalibrationStatus
		,Amperage
		,Spacing
		,BlackLightIntensity
		,FieldIndicator
		,FinalCleaning
		,AppId
		,ClientId
		,CreatedBy
		,CreatedDate
		,UpdatedBy
		,UpdatedDate
		,DeletedStatus
   FROM [NDTUAT].MagneticParticleExaminationTest   
   WHERE ReportId = @ReportId  
 END TRY  
 BEGIN CATCH  
  --LOG ERROR IN DB  
  EXEC [NDTUAT].[usp_GetErrorInfo]    
  RETURN    
 END CATCH  
END -- END PROC  
  
