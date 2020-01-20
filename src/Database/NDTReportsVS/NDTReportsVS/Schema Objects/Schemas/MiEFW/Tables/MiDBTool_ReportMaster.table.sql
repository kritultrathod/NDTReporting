CREATE TABLE [MiEFW].[MiDBTool_ReportMaster] (
    [autoid]              INT                    IDENTITY (1, 1) NOT NULL,
    [StoreID]             NVARCHAR (30)          NOT NULL,
    [ClAppMapID]          BIGINT                 NULL,
    [SPName]              NVARCHAR (255)         NOT NULL,
    [ReportName]          NVARCHAR (300)         NOT NULL,
    [ReportDescr]         NVARCHAR (4000)        NULL,
    [ShowInReportListing] NCHAR (3)              NULL,
    [SPInstructions]      NVARCHAR (4000)        NULL,
    [modifiedby]          [MiEFW].[LoginID]      NULL,
    [modifiedDt]          DATETIME               NULL,
    [rowStatus]           [MiEFW].[ActiveStatus] NOT NULL
);

