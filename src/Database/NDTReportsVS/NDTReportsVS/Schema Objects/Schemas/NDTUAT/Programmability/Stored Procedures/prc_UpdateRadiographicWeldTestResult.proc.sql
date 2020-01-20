
CREATE PROCEDURE [NDTUAT].[prc_UpdateRadiographicWeldTestResult]
(
	@TestId int,
	@ReportId int,
	@IdentificationNo nvarchar(100),
	@JointNo int,
	@Welder nvarchar(200),
	@Segment nvarchar(200),
	@FlimSizeX nvarchar(50),
	@FlimSizeY nvarchar(50),
	@Density decimal(5,2),
	@Sensitivity varchar(50),
	@ObservationsId int,
	@RemarksId int,
	@AppID int,
	@ClientID int,
	--@CreatedBy int,
	--@CreatedDate datetime,
	@UpdatedBy int,
	@UpdatedDate datetime,
	@DeletedStatus smallint
	)
AS
BEGIN -- BEGIN PROC
   --<VALIDATE INPUT PARAMS> IF INVALID RETURN <CUSTOM_ERROR_CODE>
   --<CHECK EXISTANCE IN DB>
   BEGIN TRY
		UPDATE [NDTUAT].[RadiographicWeldTestResult]
			SET
			   [IdentificationNo] =@IdentificationNo
			  ,[JointNo]          =@JointNo
			  ,[Welder]           =@Welder
			  ,[Segment]          =@Segment
			  ,[FlimSizeX]        =@FlimSizeX
			  ,[FlimSizeY]        =@FlimSizeY
			  ,[Density]          =@Density
			  ,[Sensitivity]      =@Sensitivity
			  ,[ObservationsId]   =@ObservationsId
			  ,[RemarksId]        =@RemarksId
			  ,[AppID]            =@AppID
			  ,[ClientID]         =@ClientID
			  --,[CreatedBy]        =@CreatedBy
			  --,[CreatedDate]      =@CreatedDate
			  ,[UpdatedBy]        =@UpdatedBy
			  ,[UpdatedDate]      =GETDATE()
			  --,[DeletedStatus]    =@DeletedStatus
		 WHERE [ReportId]         =@ReportId
		   AND [TestId]           =@TestId
		 SELECT 1
   END TRY
   BEGIN CATCH
      --LOG ERROR IN DB
      EXEC [NDTUAT].[usp_GetErrorInfo]
      RETURN
   END CATCH
END -- END PROC


