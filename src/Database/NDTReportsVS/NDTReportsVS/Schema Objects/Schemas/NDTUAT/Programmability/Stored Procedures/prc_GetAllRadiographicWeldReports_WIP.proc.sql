CREATE PROCEDURE [NDTUAT].[prc_GetAllRadiographicWeldReports_WIP]
	@CreatedBy as int,
    @pageIndex int,
    @pageSize int
AS
BEGIN -- BEGIN PROC
   --<VALIDATE INPUT PARAMS> IF INVALID RETURN <CUSTOM_ERROR_CODE>
   --<CHECK EXISTANCE IN DB>
	BEGIN TRY
	DECLARE @From int;
	DECLARE @To int;
	DECLARE @MyRowCount int;
    DECLARE @PageCount int;

	SELECT @MyRowCount=COUNT(1) FROM NDTUAT.RadiographicWeld WHERE CreatedBy = @CreatedBy AND DeletedStatus=0
	--@MyRowCount=COUNT(1) FROM NDTUAT.RadiographicWeld WHERE CreatedBy = @CreatedBy AND DeletedStatus=0

	IF (@MyRowCount<=0) 
	BEGIN
		PRINT 'No Records Found'
		RETURN 1
	END

	SET @PageCount=CEILING((@MyRowCount+0.0)/@PageSize)

	IF (@pageIndex<1) SET @pageIndex=1
	IF (@pageIndex>@PageCount) SET @pageIndex=@PageCount
	SET @From = ((@pageIndex-1) * @pageSize) + 1
	SET @To = ((@pageIndex) * @pageSize)
	
	        
	SELECT * FROM 
	(       
			SELECT ROW_NUMBER() OVER(ORDER BY CreatedBy) AS RowId,ReportId,TestReportNumber,Client,ContactNumber,ContactPerson,TestDate
			FROM NDTUAT.RadiographicWeld 
			WHERE CreatedBy = @CreatedBy AND DeletedStatus=0
	) A
	WHERE RowID BETWEEN @From AND @To;

SELECT @MyRowCount 'MyRowCount',@PageCount 'PageCount',@pageIndex 'pageIndex',@From 'From',@To 'To'
SELECT @PageCount 'PageCount'

   END TRY
   BEGIN CATCH
      --LOG ERROR IN DB
      EXEC [NDTUAT].[usp_GetErrorInfo]
      RETURN
   END CATCH
END -- END PROC

