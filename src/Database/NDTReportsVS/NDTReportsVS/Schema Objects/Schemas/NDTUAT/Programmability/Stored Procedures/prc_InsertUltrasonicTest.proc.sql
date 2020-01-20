-- =============================================
-- Author:  Ritesh
-- Create date: 03/03/2013
-- Description: Proc to Insert records in UltrasonicTest & Results
-- =============================================
CREATE PROCEDURE [NDTUAT].[prc_InsertUltrasonicTest]
(
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
/*
							
								
											


*/
BEGIN -- BEGIN PROC
   --<VALIDATE INPUT PARAMS> IF INVALID RETURN <CUSTOM_ERROR_CODE>
	--<CHECK EXISTANCE IN DB>
	BEGIN TRY
		INSERT INTO [NDTUAT].[UltrasonicExaminationTest] 
		(
				 FabricatorName
				,SubTestId
				,Location
				,ReportNo
				,ContractNo
				,ContactPerson
				,DateofTesting
				,Equipment
				,CalibrationStatus
				,CouplingMedia
				,SurfaceCondition
				,ReferenceCode
				,AcceptanceCriteria
				,TechSheetNo
				,ExtentofCoverage
				,ConsumablesType
				,CalibrationBlock
				,ReferenceBlock
				,SearchUnit
				,Frequency 
				,BeamAngle
				,BeamIndex
				,MaxBeamPath
				,TimeBaseRange
				,Reflector
				,Gain
				,Correction
				,Scan
				,RejectionLevel
				,RecordingLevel
				,AppId
				,ClientId
				,CreatedBy
				,CreatedDate
				,UpdatedBy
				,UpdatedDate
				,DeletedStatus
			) 
		VALUES
			(
				 @FabricatorName
				,@SubTestId
				,@Location
				,@ReportNo
				,@ContractNo
				,@ContactPerson
				,CONVERT(datetime, @DateofTesting,103)
				,@Equipment
				,@CalibrationStatus
				,@CouplingMedia
				,@SurfaceCondition
				,@ReferenceCode
				,@AcceptanceCriteria
				,@TechSheetNo
				,@ExtentofCoverage
				,@ConsumablesType
				,@CalibrationBlock
				,@ReferenceBlock
				,@SearchUnit
				,@Frequency
				,@BeamAngle
				,@BeamIndex
				,@MaxBeamPath
				,@TimeBaseRange
				,@Reflector
				,@Gain
				,@Correction
				,@Scan
				,@RejectionLevel
				,@RecordingLevel
				,@AppId
				,@ClientId
				,@CreatedBy
				,@CreatedDate
				,@UpdatedBy
				,@UpdatedDate
				,@DeletedStatus
			);

		SELECT SCOPE_IDENTITY();
	END TRY
   BEGIN CATCH
	  --LOG ERROR IN DB
	  EXEC [NDTUAT].[usp_GetErrorInfo]
	  RETURN
   END CATCH
END -- END PROC