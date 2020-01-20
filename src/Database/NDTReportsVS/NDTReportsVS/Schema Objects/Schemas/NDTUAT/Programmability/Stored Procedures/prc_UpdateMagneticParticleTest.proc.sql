CREATE PROCEDURE [NDTUAT].[prc_UpdateMagneticParticleTest]
(
	@ReportId int,
	@FabricatorName	nvarchar(200),
	@SubTestId	int	,
	@Location	nvarchar(200),
	@ReportNo	nvarchar(50),
	@ContractNo	nvarchar(50),
	@ContactPerson	nvarchar(50),
	@DateofTesting	nvarchar(10),
	@JobDescription	nvarchar(200),
	@Material	nvarchar(50),
	@Dimension	nvarchar(50),
	@SurfaceCondition	nvarchar(50),
	@ReferenceCode	int,
	@AcceptanceCriteria	nvarchar(50),
	@TechSheetNo	nvarchar(50),
	@ExtentofCoverage	nvarchar(50),
	@SurfaceTemperature	nvarchar(50),
	@ConsumablesType int,
	@TechniqueId	int,
	@Direction	nvarchar(50),
	@MagnetizationCurrent	nvarchar(50),
	@DetectionMedia	nvarchar(50),
	@Concentration	nvarchar(50),
	@Illuminance	nvarchar(50),
	@ContrastPaint	nvarchar(50),
	@Demagnetizing	nvarchar(50),
	@Equipment	nvarchar(50),
	@CalibrationStatus	nvarchar(50),
	@Amperage	nvarchar(50),
	@Spacing	nvarchar(50),
	@BlackLightIntensity	nvarchar(50),
	@FieldIndicator	nvarchar(50),
	@FinalCleaning	nvarchar(50),
	@AppId	int,
	@ClientId	int,
	@CreatedBy	int,
	@CreatedDate	datetime,
	@UpdatedBy	int,
	@UpdatedDate	datetime,
	@DeletedStatus	smallint
	)
AS
BEGIN -- BEGIN PROC
	--<VALIDATE INPUT PARAMS> IF INVALID RETURN <CUSTOM_ERROR_CODE>
	--<CHECK EXISTANCE IN DB>
	BEGIN TRY
			SET NOCOUNT ON;
			UPDATE NDTUAT.MagneticParticleExaminationTest 
			SET 
				 FabricatorName=@FabricatorName
				,SubTestId=@SubTestId
				,Location=@Location
				,ReportNo=@ReportNo
				,ContractNo=@ContractNo
				,ContactPerson=@ContactPerson
				,DateofTesting=CONVERT(datetime, @DateofTesting,103)
				,JobDescription=@JobDescription
				,Material=@Material
				,Dimension=@Dimension
				,SurfaceCondition=@SurfaceCondition
				,ReferenceCode=@ReferenceCode
				,AcceptanceCriteria=@AcceptanceCriteria
				,TechSheetNo=@TechSheetNo
				,ExtentofCoverage=@ExtentofCoverage
				,SurfaceTemperature=@SurfaceTemperature
				,ConsumablesType=@ConsumablesType
				,TechniqueId=@TechniqueId
				,Direction=@Direction
				,MagnetizationCurrent=@MagnetizationCurrent
				,DetectionMedia=@DetectionMedia
				,Concentration=@Concentration
				,Illuminance=@Illuminance
				,ContrastPaint=@ContrastPaint
				,Demagnetizing=@Demagnetizing
				,Equipment=@Equipment
				,CalibrationStatus=@CalibrationStatus
				,Amperage=@Amperage
				,Spacing=@Spacing
				,BlackLightIntensity=@BlackLightIntensity
				,FieldIndicator=@FieldIndicator
				,FinalCleaning=@FinalCleaning
				,AppId=@AppId
				,ClientId=@ClientId
				--,CreatedBy=@CreatedBy
				--,CreatedDate=@CreatedDate
				,UpdatedBy=@UpdatedBy
				,UpdatedDate=@UpdatedDate
				,DeletedStatus=@DeletedStatus
			WHERE ReportId=@ReportId
			SELECT SCOPE_IDENTITY();
	END TRY
	BEGIN CATCH
		--LOG ERROR IN DB
		EXEC [NDTUAT].[usp_GetErrorInfo]  
		RETURN		
	END CATCH
END -- END PROC