CREATE PROCEDURE [NDTUAT].[prc_UpdateUltrasonicTest]
(
	@ReportId int,
	@FabricatorName	nvarchar(200),
	@SubTestId	int	,
	@Location	nvarchar(200),
	@ReportNo	nvarchar(50),
	@ContractNo	nvarchar(50),
	@ContactPerson	nvarchar(50),
	@DateofTesting nvarchar(10),
	@Equipment	nvarchar(50),
	@CalibrationStatus	nvarchar(50),
	@CouplingMedia	nvarchar(50),
	@SurfaceCondition	nvarchar(50),
	@ReferenceCode	int,
	@AcceptanceCriteria	nvarchar(50),
	@TechSheetNo	nvarchar(50),
	@ExtentofCoverage	nvarchar(50),
	@ConsumablesType int,
	@CalibrationBlock	nvarchar(50),
	@ReferenceBlock	nvarchar(50),
	@SearchUnit	nvarchar(50),
	@Frequency	nvarchar(50),
	@BeamAngle	nvarchar(50),
	@BeamIndex	nvarchar(50),
	@MaxBeamPath	nvarchar(50),
	@TimeBaseRange	nvarchar(50),
	@Reflector	nvarchar(50),
	@Gain	nvarchar(50),
	@Correction	nvarchar(50),
	@Scan	nvarchar(50),
	@RejectionLevel	nvarchar(50),
	@RecordingLevel	nvarchar(50),
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
			UPDATE NDTUAT.UltrasonicExaminationTest 
			SET 
				 FabricatorName=@FabricatorName
				,SubTestId=@SubTestId
				,Location=@Location
				,ReportNo=@ReportNo
				,ContractNo=@ContractNo
				,ContactPerson=@ContactPerson
				,DateofTesting=CONVERT(datetime, @DateofTesting,103)
				,Equipment=@Equipment
				,CalibrationStatus=@CalibrationStatus
				,CouplingMedia=@CouplingMedia
				,SurfaceCondition=@SurfaceCondition
				,ReferenceCode=@ReferenceCode
				,AcceptanceCriteria=@AcceptanceCriteria
				,TechSheetNo=@TechSheetNo
				,ExtentofCoverage=@ExtentofCoverage
				,ConsumablesType=@ConsumablesType
				,CalibrationBlock=@CalibrationBlock
				,ReferenceBlock=@ReferenceBlock
				,SearchUnit=@SearchUnit
				,Frequency =@Frequency
				,BeamAngle=@BeamAngle
				,BeamIndex=@BeamIndex
				,MaxBeamPath=@MaxBeamPath
				,TimeBaseRange=@TimeBaseRange
				,Reflector=@Reflector
				,Gain=@Gain
				,Correction=@Correction
				,Scan=@Scan
				,RejectionLevel=@RejectionLevel
				,RecordingLevel=@RecordingLevel
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