-- =============================================
-- Author:        <Kritul Rathod>
-- Create date: <03-06-09 - ver 1.0>
-- Description:   <For binding grid with Sorting & Paging>
-- =============================================
CREATE PROCEDURE [NDTUAT].[usp_frmwrk_Paging]
        @pageIndex int,
        @pageSize int,
        @sortCol varchar(50),
        @srchCol varchar(50),
        @srchTxt varchar(50),
        @tabName varchar(50),
        @colList varchar(500),
        @PageCount int output
AS
BEGIN
 
        DECLARE @sql nvarchar(4000);
        DECLARE @From int;
        DECLARE @To int;
 
            IF OBJECT_ID('tempdb..##temp') IS NOT NULL
                  DROP TABLE ##temp
 
        SET @sql = 'SELECT ROW_NUMBER() OVER(ORDER BY ' + @sortCol + ') AS RowId,' + @colList + ' INTO ##temp FROM ' + @tabName + ' WHERE '+ @srchCol + ' like ''%' + @srchTxt + '%'';';
 
        EXEC sp_executesql @sql;
        SET @PageCount=CEILING((@@ROWCOUNT+0.0)/@PageSize)
 
        IF (@pageIndex<1) SET @pageIndex=1
        IF (@pageIndex>@PageCount) SET @pageIndex=@PageCount
 
        SET @From = ((@pageIndex-1) * @pageSize) + 1
        SET @To = ((@pageIndex) * @pageSize)
 
        SET @sql = 'SELECT ' + @colList + ' FROM ##temp WHERE RowID BETWEEN '+ convert(varchar(50),@From) +' AND '+ convert(varchar(50),@To) +';';
		PRINT @sql
        EXEC sp_executesql @sql;
 
            IF OBJECT_ID('tempdb..##temp') IS NOT NULL
                  DROP TABLE ##temp
 
        SELECT @PageCount;
END
