
CREATE PROCEDURE [MiEFW].[Add_SPManager_ProcMaster] 
(
	
	@ClientAppMapID bigint = 2,  
	@SPName nvarchar(255)= 'MiEFW.Add_SPManager_ProcMaster',  
	@ReportName nvarchar(300)= 'Test',  
	--@ReportDescr nvarchar(4000), 
	--@ShowInReportListing nchar(3),  
	--@SPInstructions nvarchar(4000),
	--@modifiedby nvarchar(30),
	--@modifiedDt datetime,
	@deleted nchar(10)= 'N'
)
AS
BEGIN 
		BEGIN TRAN	
		declare @StoreID nvarchar(30)
		set @StoreID = [artha].[MiEFW].[getStoreIdForReport] ()		 
			--INSERT INTO [MiEFW].[SPManager_ProcMaster]
			--(StoreID,ClientAppMapID,SPName,ReportName,ReportDescr,ShowInReportListing,SPInstructions,modifiedby,modifiedDt,deleted)
			--Values
			--(@StoreID,@ClientAppMapID,@SPName,@ReportName,@ReportDescr,@ShowInReportListing,@SPInstructions,@modifiedby,@modifiedDt,@deleted);  
			INSERT INTO [MiEFW].[SPManager_ProcMaster]
			(StoreID,ClientAppMapID,SPName,ReportName,deleted)
			Values
			(@StoreID,@ClientAppMapID,@SPName,@ReportName,@deleted);  
		COMMIT TRAN
END 
