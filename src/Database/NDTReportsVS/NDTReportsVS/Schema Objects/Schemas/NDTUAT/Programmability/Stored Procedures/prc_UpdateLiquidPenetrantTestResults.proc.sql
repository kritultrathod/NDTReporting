CREATE PROCEDURE [NDTUAT].[prc_UpdateLiquidPenetrantTestResults]
(
	@TestId int,
	@ReportId	int,
	@Serial	nvarchar(50),
	@JobDescription	nvarchar(50),	
	@LiquidQuantityX nvarchar(50),
	@LiquidQuantityY nvarchar(50),
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
		UPDATE NDTUAT.LiquidPenetrantExaminationTestResults 
		SET 
			Serial=@Serial,
			JobDescription=@JobDescription,
			LiquidQuantityX=@LiquidQuantityX,
			LiquidQuantityY=@LiquidQuantityY,
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



