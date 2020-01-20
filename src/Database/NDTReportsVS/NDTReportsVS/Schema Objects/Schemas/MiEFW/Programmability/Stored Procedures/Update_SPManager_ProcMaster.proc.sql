
CREATE PROCEDURE [MiEFW].[Update_SPManager_ProcMaster] 
(
	@StoreID nvarchar(30),  
	@ClientAppMapID bigint,  
	@SPName nvarchar(255),  
	@ReportName nvarchar(300),  
	@ReportDescr nvarchar(4000), 
	@ShowInReportListing nchar(3),  
	@SPInstructions nvarchar(4000),
	@modifiedby nvarchar(30),
	@modifiedDt datetime
)
AS
BEGIN 
		BEGIN TRAN				 
			Update [MiEFW].[SPManager_ProcMaster] set
			ClientAppMapID=@ClientAppMapID,SPName=@SPName,ReportName=@ReportName,ReportDescr=@ReportDescr,ShowInReportListing=@ShowInReportListing,SPInstructions=@SPInstructions,modifiedby=@modifiedby,modifiedDt=@modifiedDt
			where StoreID = @StoreID
		COMMIT TRAN
END 