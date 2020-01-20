CREATE TABLE [MiEFW].[LayoutTxn] (
    [AutoID]         BIGINT                 IDENTITY (1, 1) NOT NULL,
    [LayoutID]       BIGINT                 NOT NULL,
    [ComponentTxnID] BIGINT                 NOT NULL,
    [CreateBy]       [MiEFW].[LoginID]      NULL,
    [CreateDt]       DATETIME               NULL,
    [ModifyBy]       [MiEFW].[LoginID]      NULL,
    [ModifyDt]       DATETIME               NULL,
    [rowStatus]      [MiEFW].[ActiveStatus] NULL
);

