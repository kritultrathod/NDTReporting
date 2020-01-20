CREATE PROCEDURE [NDTUAT].[prc_UpdateUltrasonicTestResults]
(
	@TestId int,
	@ReportId	int,
	@Serial	nvarchar(50),
	@JobDescription	nvarchar(50),
	@Material	nvarchar(50),	
	@UltrasonicQuantityX	nvarchar(50),
	@UltrasonicQuantityY	nvarchar(50),
	@Dimension	nvarchar(50),
	@Length	int,
	@Depth	int,
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
		UPDATE NDTUAT.UltrasonicExaminationTestResults 
		SET 
			Serial=@Serial,
			JobDescription=@JobDescription,
			Material=@Material,
			UltrasonicQuantityX=@UltrasonicQuantityX,
			UltrasonicQuantityY=@UltrasonicQuantityY,
			Dimension=@Dimension,
			Length=@Length,
			Depth=@Depth,
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



