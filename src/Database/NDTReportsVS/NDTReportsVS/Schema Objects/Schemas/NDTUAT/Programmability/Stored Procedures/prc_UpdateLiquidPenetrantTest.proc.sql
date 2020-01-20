CREATE PROCEDURE [NDTUAT].[prc_UpdateLiquidPenetrantTest]
(
	@ReportId int,
	@FabricatorName nvarchar(200),
	@SubTestId int ,
	@Location nvarchar(200),
	@ReportNo nvarchar(50),
	@ContractNo nvarchar(50),
	@ContactPerson nvarchar(50),
	@DateofTesting	nvarchar(10),
	@JobDescription nvarchar(200),
	@Material nvarchar(50),
	@Dimension nvarchar(50),
	@SurfaceCondition nvarchar(50),
	@ReferenceCode int,
	@AcceptanceCriteria nvarchar(50),
	@TechSheetNo nvarchar(50),
	@ExtentofCoverage nvarchar(50),
	@SurfaceTemperature nvarchar(50),
	@ConsumablesType nvarchar(50),
	@TechniqueId int,
	@Penetrant nvarchar(50),
	@PenetrantBatchNo nvarchar(50),
	@ApplicationOfPenetrant nvarchar(50),
	@PenetrantRemovalMethod nvarchar(50),
	@Developer nvarchar(50),
	@DeveloperBatchNo nvarchar(50),
	@ApplicationOfDeveloper nvarchar(50),
	@ViewingCondition nvarchar(50),
	@MarkingOfIndication nvarchar(50),
	@PreCleaning nvarchar(50),
	@DwellTime nvarchar(50),
	@DryingTime nvarchar(50),
	@BlackLightDetails nvarchar(50),
	@FinalClearing nvarchar(50),
	@AppId int,
	@ClientId int,
	@CreatedBy int,
	@CreatedDate datetime,
	@UpdatedBy int,
	@UpdatedDate datetime,
	@DeletedStatus smallint
	)
AS
BEGIN -- BEGIN PROC
	--<VALIDATE INPUT PARAMS> IF INVALID RETURN <CUSTOM_ERROR_CODE>
	--<CHECK EXISTANCE IN DB>
	BEGIN TRY
			SET NOCOUNT ON;
			UPDATE NDTUAT.LiquidPenetrantExaminationTest 
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
				,Penetrant=@Penetrant 
				,PenetrantBatchNo=@PenetrantBatchNo 
				,ApplicationOfPenetrant=@ApplicationOfPenetrant 
				,PenetrantRemovalMethod=@PenetrantRemovalMethod 
				,Developer=@Developer 
				,DeveloperBatchNo=@DeveloperBatchNo 
				,ApplicationOfDeveloper=@ApplicationOfDeveloper 
				,ViewingCondition=@ViewingCondition 
				,MarkingOfIndication=@MarkingOfIndication 
				,PreCleaning=@PreCleaning 
				,DwellTime=@DwellTime 
				,DryingTime=@DryingTime 
				,BlackLightDetails=@BlackLightDetails 
				,FinalClearing=@FinalClearing 
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