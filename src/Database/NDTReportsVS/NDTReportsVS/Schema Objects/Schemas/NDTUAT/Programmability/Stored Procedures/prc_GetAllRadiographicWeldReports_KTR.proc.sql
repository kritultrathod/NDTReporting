﻿CREATE PROCEDURE [NDTUAT].[prc_GetAllRadiographicWeldReports_KTR]
	@CreatedBy as int,
    @pageIndex int = 1,  
    @PageSize int = 10,
    @ReportId as nvarchar(100)= NULL,
	@TestReportNo as nvarchar(100)= NULL,
	@Client as nvarchar(400)= NULL,
	@Location as nvarchar(400)= NULL,
	@ContactPerson as nvarchar(100)= NULL,
	@ContractNo as nvarchar(100)= NULL,
	@TestDateStart as varchar(10)= NULL,
	@TestDateEnd as varchar(10)= NULL,
	@OrderBy as int= 5, -- DateofTesting
	@OrderDir as nvarchar(1)='D'-- D DESC, A ASC
AS
BEGIN -- BEGIN PROC
   --<VALIDATE INPUT PARAMS> IF INVALID RETURN <CUSTOM_ERROR_CODE>
   --<CHECK EXISTANCE IN DB>
   BEGIN TRY
		DECLARE @From int;
		DECLARE @To int;
		DECLARE @MyRowCount int;
		DECLARE @PageCount int;

		SELECT
			ReportId,
			TestReportNumber as ReportNo,
			Client as FabricatorName,
			ContactPerson,
			ContractNo,
			Location,
			TestDate as DateofTesting,
			ROW_NUMBER() OVER (ORDER BY 
/*		    1	Test Report No.
			2	Client
			3	Contact Person
			4	Contract Number
			5	Test Date
			6	Location
			7	ReportId */
				CASE WHEN @OrderBy=1 AND @OrderDir='A' THEN T.TestReportNumber END ASC,
				CASE WHEN @OrderBy=1 AND @OrderDir='D' THEN T.TestReportNumber END DESC,
				CASE WHEN @OrderBy=2 AND @OrderDir='A' THEN T.Client END ASC,
				CASE WHEN @OrderBy=2 AND @OrderDir='D' THEN T.Client END DESC,
				CASE WHEN @OrderBy=3 AND @OrderDir='A' THEN T.ContactPerson END ASC,
				CASE WHEN @OrderBy=3 AND @OrderDir='D' THEN T.ContactPerson END DESC,
				CASE WHEN @OrderBy=4 AND @OrderDir='A' THEN T.ContractNo END ASC,
				CASE WHEN @OrderBy=4 AND @OrderDir='D' THEN T.ContractNo END DESC,
				CASE WHEN @OrderBy=5 AND @OrderDir='A' THEN T.TestDate END ASC,
				CASE WHEN @OrderBy=5 AND @OrderDir='D' THEN T.TestDate END DESC,
				CASE WHEN @OrderBy=6 AND @OrderDir='A' THEN T.Location END ASC,
				CASE WHEN @OrderBy=6 AND @OrderDir='D' THEN T.Location END DESC,
				CASE WHEN @OrderBy=7 AND @OrderDir='A' THEN T.ReportId END ASC,
				CASE WHEN @OrderBy=7 AND @OrderDir='D' THEN T.ReportId END DESC
			) AS RowId 
		INTO #RadiographicWeldTest
		FROM NDTUAT.RadiographicWeld T
		WHERE (DeletedStatus = 0)
		AND (T.CreatedBy = @CreatedBy)
		AND (@TestReportNo IS NULL OR T.TestReportNumber LIKE '%' + @TestReportNo + '%')
		AND (@Client IS NULL OR T.Client LIKE '%' + @Client + '%')
		AND (@Location IS NULL OR T.Location LIKE '%' + @Location + '%')
		AND (@ContactPerson IS NULL OR T.ContactPerson LIKE '%' + @ContactPerson + '%')
		AND (@ContractNo IS NULL OR T.ContractNo LIKE '%' + @ContractNo + '%')
		AND (@ReportId IS NULL OR T.ReportId LIKE '%' + @ReportId + '%')		
		AND (
		@TestDateStart IS NULL
		OR T.TestDate = CONVERT(datetime, @TestDateStart, 103) --( convert(varchar(10),,112) = convert(varchar(10),@TestDateStart,112) )
		OR (T.TestDate BETWEEN CONVERT(datetime, @TestDateStart, 103) AND CONVERT(datetime, @TestDateEnd, 103))
		)

		SELECT
			@MyRowCount = COUNT(1)
		FROM #RadiographicWeldTest

		IF (@MyRowCount<=0) 
		BEGIN
			PRINT 'No Records Found'
		END

		SET @PageCount = CEILING((@MyRowCount + 0.0) / @PageSize)

		IF (@PageIndex<1) SET @PageIndex = 1
		IF (@PageIndex>@PageCount) SET @PageIndex = @PageCount
		SET @From = ((@PageIndex - 1) * @PageSize) + 1
		SET @To = ((@PageIndex) * @PageSize)

		SELECT
			ReportId,
			ReportNo,
			FabricatorName,
			ContactPerson,
			ContractNo,
			Location,
			CONVERT(varchar(10), DateofTesting, 103) AS DateofTesting,
			RowId
		FROM #RadiographicWeldTest
		WHERE RowID BETWEEN @From AND @To

		SELECT
			@PageCount 'PageCount', @pageIndex 'pageIndex'
		--SELECT
		--	@MyRowCount 'MyRowCount',
		--	@PageCount 'PageCount',
		--	@pageIndex 'pageIndex',
		--	@From 'From',
		--	@To 'To',
		--	@OrderBy 'OrderBy'

   END TRY
   BEGIN CATCH
      --LOG ERROR IN DB
      EXEC [NDTUAT].[usp_GetErrorInfo]
      RETURN
   END CATCH
END -- END PROC




