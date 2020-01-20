CREATE PROCEDURE [NDTUAT].[prc_UpdateRadiographicWeld]
(
   @ReportId int = 0,
   @Client nvarchar(400),
   @Location nvarchar(400),
   @ContactPerson nvarchar(400),
   @TestReportNumber nvarchar(100),
   @JobDescription nvarchar(1000),
   @TestDate nvarchar(10),
   @ContractNo nvarchar(100),
   @RefDocumentId int,
   @RadiationSourceId int,
   @FilmMakeAndType varchar(100),
   @TypeofIQI varchar(50),
   @IQIBatchNo varchar(50),
   @TechniqueId int,
   @ShimThickness varchar(50),
   @DensitometerNo varchar(50),
   @CalibrationDate varchar(50),
   @GeometricalUnsharpness varchar(50),
   @MaterialSpecification varchar(50),
   @SurfaceCondition varchar(50),
   @SurfaceTemperature varchar(50),
   @ExtentofExamination varchar(50),
   @Dimension varchar(50),
   @WeldThickness varchar(50),
   @WeldPreparation varchar(50),
   @StageofExamination varchar(50),
   @ContactNumber varchar(30),
   @SFD varchar(50),
   @WeldingMethod varchar(50),
   @ExposureTime nvarchar(100),
   @SubTestId int,
   @AppID int = null,
   @ClientID int = null,
   --@CreatedBy int = null,
   --@CreatedDate varchar(50) = null,
   @UpdatedBy int = null,
   @UpdatedDate varchar(50) = null,
   @DeletedStatus smallint  = null
)
AS
BEGIN -- BEGIN PROC
 --<VALIDATE INPUT PARAMS> IF INVALID RETURN <CUSTOM_ERROR_CODE>
 --<CHECK EXISTANCE IN DB>
 BEGIN TRY
 	IF (@ReportId <> 0 AND @ReportId is not null) --AND Exists(SELECT 1 FROM NDTUAT.RadiographicWeld WHERE ReportId = @ReportId)
	BEGIN
         UPDATE [NDTUAT].[RadiographicWeld]
         SET [Client]=@Client
            ,[Location]=@Location
            ,[ContactPerson]=@ContactPerson
            ,[TestReportNumber]=@TestReportNumber
            ,[JobDescription]=@JobDescription
            ,[TestDate]=CONVERT(datetime, @TestDate,103)
            --,[TestDate]=CASE WHEN Isnull(@TestDate,'') = '' THEN NULL ELSE CONVERT(DATETIME,@TestDate,103) END
            ,[ContractNo]=@ContractNo
            ,[RefDocumentId]=@RefDocumentId
            ,[RadiationSourceId]=@RadiationSourceId
            ,[FilmMakeAndType]=@FilmMakeAndType
            ,[TypeofIQI]=@TypeofIQI
            ,[IQIBatchNo]=@IQIBatchNo
            ,[TechniqueId]=@TechniqueId
            ,[ShimThickness]=@ShimThickness
            ,[DensitometerNo]=@DensitometerNo
            ,[CalibrationDate]=CONVERT(datetime, @CalibrationDate,103)
            --,[CalibrationDate]=CASE WHEN Isnull(@CalibrationDate,'') = '' THEN NULL ELSE CONVERT(DATETIME,@CalibrationDate,103) END
            ,[GeometricalUnsharpness]=@GeometricalUnsharpness
            ,[MaterialSpecification]=@MaterialSpecification
            ,[SurfaceCondition]=@SurfaceCondition
            ,[SurfaceTemperature]=@SurfaceTemperature
            ,[ExtentofExamination]=@ExtentofExamination
            ,[Dimension]=@Dimension
            ,[WeldThickness]=@WeldThickness
            ,[WeldPreparation]=@WeldPreparation
            ,[StageofExamination]=@StageofExamination
            ,[ContactNumber]=@ContactNumber
            ,[SFD]=@SFD
            ,[WeldingMethod]=@WeldingMethod
            ,[ExposureTime]=@ExposureTime
            ,[SubTestId]=@SubTestId
            ,[AppID]=@AppID
            ,[ClientID]=@ClientID
            --,[CreatedBy]=@CreatedBy
            --,[CreatedDate]=@CreatedDate
            ,[UpdatedBy]=@UpdatedBy
            ,[UpdatedDate]=getdate()
            ,[DeletedStatus]=@DeletedStatus
		WHERE ReportId=@ReportId
		SELECT 1
	END
 END TRY
 BEGIN CATCH
  --ROLLBACK TRAN
  --LOG ERROR IN DB
  EXEC [NDTUAT].[usp_GetErrorInfo]
  SELECT -99
  RETURN
 END CATCH
END -- END PROC