
CREATE PROCEDURE [NDTUAT].[prc_InsertRadiographicWeldTestResult]
(
	@ReportId int,
	@IdentificationNo nvarchar(200),
	@JointNo int,
	@Welder nvarchar(400),
	@Segment nvarchar(400),
	@FlimSizeX nvarchar(100),
	@FlimSizeY nvarchar(100),
	@Density decimal,
	@Sensitivity varchar(50),
	@ObservationsId int,
	@RemarksId int,
	@AppID int = null,
	@ClientID int = null,
	@CreatedBy int = null,
	@CreatedDate varchar(50) = null,
	@UpdatedBy int = null,
	@UpdatedDate varchar(50) = null,
	@DeletedStatus smallint  = 0
)
AS
BEGIN -- BEGIN PROC
   --<VALIDATE INPUT PARAMS> IF INVALID RETURN <CUSTOM_ERROR_CODE>
   --<CHECK EXISTANCE IN DB>
   BEGIN TRY
		INSERT INTO NDTUAT.RadiographicWeldTestResult
		(
			ReportId,
			IdentificationNo,
			JointNo,
			Welder,
			Segment,
			FlimSizeX,
			FlimSizeY,
			Density,
			Sensitivity,
			ObservationsId,
			RemarksId,
			AppID,
			ClientID,
			CreatedBy,
			CreatedDate,
			UpdatedBy,
			UpdatedDate,
			DeletedStatus
		)
		VALUES
		(
			@ReportId,
			@IdentificationNo,
			@JointNo,
			@Welder,
			@Segment,
			@FlimSizeX,
			@FlimSizeY,
			@Density,
			@Sensitivity,
			@ObservationsId,
			@RemarksId,
			@AppID,
			@ClientID,
			@CreatedBy,
			GETDATE(),
			null,
			null,
			0
		)
		SELECT SCOPE_IDENTITY()
   END TRY
   BEGIN CATCH
	  --LOG ERROR IN DB
	  EXEC [NDTUAT].[usp_GetErrorInfo]
	  RETURN
   END CATCH
END -- END PROC




