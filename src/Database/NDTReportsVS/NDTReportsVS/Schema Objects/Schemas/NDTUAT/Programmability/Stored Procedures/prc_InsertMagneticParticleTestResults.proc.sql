-- =============================================
-- Author:		Ritesh
-- Create date: 24/02/2013
-- Description:	Proc to Insert records in MagneticParticleTest & Results
-- =============================================
CREATE PROCEDURE [NDTUAT].[prc_InsertMagneticParticleTestResults]
(
	@ReportId	int,
	@Serial	nvarchar(50),
	@JobDescription	nvarchar(50),
	@Section	nvarchar(50),
	@MagneticDimensionX	int, 
	@MagneticDimensionY	int, 
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
		INSERT INTO  [NDTUAT].[MagneticParticleExaminationTestResults] 
			(ReportId,Serial,JobDescription,
			Section,MagneticDimensionX,MagneticDimensionY,ObservationsId,Result,SketchReference,
			AppId,ClientId,CreatedBy,CreatedDate,UpdatedBy,UpdatedDate,DeletedStatus)
		VALUES
			(@ReportId,@Serial,@JobDescription,@Section,@MagneticDimensionX,@MagneticDimensionY,@ObservationsId,
			@Result,@SketchReference,@AppId,@ClientId,@CreatedBy,@CreatedDate,
			@UpdatedBy,@UpdatedDate,@DeletedStatus);
   END TRY
   BEGIN CATCH
      --LOG ERROR IN DB
      EXEC [NDTUAT].[usp_GetErrorInfo]
      RETURN
   END CATCH
END -- END PROC

