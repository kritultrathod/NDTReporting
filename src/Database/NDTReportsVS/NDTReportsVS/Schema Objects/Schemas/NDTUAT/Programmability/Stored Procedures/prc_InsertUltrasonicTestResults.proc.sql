
-- =============================================
-- Author:		Ritesh
-- Create date: 24/02/2013
-- Description:	Proc to Insert records in UltrasonicTest & Results
-- =============================================
CREATE PROCEDURE [NDTUAT].[prc_InsertUltrasonicTestResults]
(
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
		INSERT INTO  [NDTUAT].[UltrasonicExaminationTestResults] 
			(ReportId,Serial,JobDescription,Material,
			UltrasonicQuantityX,UltrasonicQuantityY,Dimension,Length,Depth,ObservationsId,Result,SketchReference,
			AppId,ClientId,CreatedBy,CreatedDate,UpdatedBy,UpdatedDate,DeletedStatus)
		VALUES
			(@ReportId,@Serial,@JobDescription,@Material,@UltrasonicQuantityX,@UltrasonicQuantityY,@Dimension,@Length,@Depth,@ObservationsId,
			@Result,@SketchReference,@AppId,@ClientId,@CreatedBy,@CreatedDate,
			@UpdatedBy,@UpdatedDate,@DeletedStatus);
   END TRY
   BEGIN CATCH
      --LOG ERROR IN DB
      EXEC [NDTUAT].[usp_GetErrorInfo]
      RETURN
   END CATCH
END -- END PROC


