CREATE TABLE [MiEFW].[SPManager_ProcMaster] (
    [autoid]              INT             IDENTITY (1, 1) NOT NULL,
    [StoreID]             NVARCHAR (30)   NOT NULL,
    [ClientAppMapID]      BIGINT          NOT NULL,
    [SPName]              NVARCHAR (255)  NOT NULL,
    [ReportName]          NVARCHAR (300)  NOT NULL,
    [ReportDescr]         NVARCHAR (4000) NULL,
    [ShowInReportListing] NCHAR (3)       NULL,
    [SPInstructions]      NVARCHAR (4000) NULL,
    [modifiedby]          NVARCHAR (30)   NULL,
    [modifiedDt]          DATETIME        NULL,
    [deleted]             NCHAR (10)      NULL
);

