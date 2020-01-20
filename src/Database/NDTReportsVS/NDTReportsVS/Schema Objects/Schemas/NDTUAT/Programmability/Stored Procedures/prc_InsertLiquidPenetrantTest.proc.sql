-- =============================================
-- Author:  Ritesh
-- Create date: 03/03/2013
-- Description: Proc to Insert records in LiquidPenetrantTest & Results
-- =============================================
CREATE PROCEDURE [NDTUAT].[prc_InsertLiquidPenetrantTest]
(
	@FabricatorName nvarchar(200),
	@SubTestId int ,
	@Location nvarchar(200),
	@ReportNo nvarchar(50),
	@ContractNo nvarchar(50),
	@ContactPerson nvarchar(50),
	@DateofTesting nvarchar(10),
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
/*
*/
BEGIN -- BEGIN PROC
   --<VALIDATE INPUT PARAMS> IF INVALID RETURN <CUSTOM_ERROR_CODE>
   --<CHECK EXISTANCE IN DB>
   BEGIN TRY
		SET NOCOUNT ON;
		INSERT INTO NDTUAT.LiquidPenetrantExaminationTest 
		(
			 FabricatorName
			,SubTestId
			,Location
			,ReportNo
			,ContractNo
			,ContactPerson
			,DateofTesting
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
			,Penetrant
			,PenetrantBatchNo
			,ApplicationOfPenetrant
			,PenetrantRemovalMethod
			,Developer
			,DeveloperBatchNo
			,ApplicationOfDeveloper
			,ViewingCondition
			,MarkingOfIndication
			,PreCleaning
			,DwellTime
			,DryingTime
			,BlackLightDetails
			,FinalClearing
			,AppId
			,ClientId
			,CreatedBy
			,CreatedDate
			,UpdatedBy
			,UpdatedDate
			,DeletedStatus
		) 
		Values
		(
			 @FabricatorName
			,@SubTestId
			,@Location
			,@ReportNo
			,@ContractNo
			,@ContactPerson
			,CONVERT(datetime, @DateofTesting,103)
			,@JobDescription
			,@Material
			,@Dimension
			,@SurfaceCondition
			,@ReferenceCode
			,@AcceptanceCriteria
			,@TechSheetNo
			,@ExtentofCoverage
			,@SurfaceTemperature
			,@ConsumablesType
			,@TechniqueId
			,@Penetrant
			,@PenetrantBatchNo
			,@ApplicationOfPenetrant
			,@PenetrantRemovalMethod
			,@Developer
			,@DeveloperBatchNo
			,@ApplicationOfDeveloper
			,@ViewingCondition
			,@MarkingOfIndication
			,@PreCleaning
			,@DwellTime
			,@DryingTime
			,@BlackLightDetails
			,@FinalClearing
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


