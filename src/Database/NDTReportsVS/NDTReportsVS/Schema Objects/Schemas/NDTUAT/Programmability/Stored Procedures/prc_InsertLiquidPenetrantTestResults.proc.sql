-- =============================================  
-- Author:  Ritesh  
-- Create date: 03/03/2013  
-- Description: Proc to Insert records in LiquidPenetrantTestResults  
-- =============================================  
CREATE PROCEDURE [NDTUAT].[prc_InsertLiquidPenetrantTestResults]
(
	@ReportId int,
	@Serial nvarchar(50),
	@JobDescription nvarchar(50),
	@LiquidQuantityX nvarchar(50),
	@LiquidQuantityY nvarchar(50),
	@ObservationsId int,
	@Result int,
	@SketchReference nvarchar(50),
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
		Insert into  NDTUAT.LiquidPenetrantExaminationTestResults
			(ReportId,Serial,JobDescription, LiquidQuantityX,LiquidQuantityY,ObservationsId,Result,SketchReference,
			AppId,ClientId,CreatedBy,CreatedDate,UpdatedBy,UpdatedDate,DeletedStatus)
		Values
			(@ReportId,@Serial,@JobDescription,@LiquidQuantityX,@LiquidQuantityY,@ObservationsId,@Result,
			@SketchReference,@AppId,@ClientId,@CreatedBy,@CreatedDate,@UpdatedBy,
			@UpdatedDate,@DeletedStatus);
   END TRY
   BEGIN CATCH
      --LOG ERROR IN DB
      EXEC [NDTUAT].[usp_GetErrorInfo]
      RETURN
   END CATCH
END -- END PROC

