CREATE PROCEDURE [NDTUAT].[prc_UpdateMagneticParticleTestResults]
(
	@TestId int,
	@ReportId	int,
	@Serial	nvarchar(50),
	@JobDescription	nvarchar(50),
	@Section	nvarchar(50),
	@MagneticDimensionX	nvarchar(50),
	@MagneticDimensionY	nvarchar(50),
	@ObservationsId	int,
	@Result	int,
	@SketchReference	nvarchar(50),
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
		UPDATE NDTUAT.MagneticParticleExaminationTestResults 
		SET 
			Serial=@Serial,
			JobDescription=@JobDescription,
			Section=@Section,
			MagneticDimensionX=@MagneticDimensionX,
			MagneticDimensionY=@MagneticDimensionY,
			ObservationsId=@ObservationsId,
			Result=@Result,
			SketchReference=@SketchReference,
			AppId=@AppId,
			ClientId=@ClientId,
			--CreatedBy=@CreatedBy,
			--CreatedDate=@CreatedDate,
			UpdatedBy=@UpdatedBy,
			UpdatedDate=@UpdatedDate,
			DeletedStatus=@DeletedStatus 
		WHERE 
			ReportId=@ReportId AND TestId=@TestId
	END TRY
	BEGIN CATCH
		--LOG ERROR IN DB
		EXEC [NDTUAT].[usp_GetErrorInfo]  
		RETURN		
	END CATCH
END -- END PROC

