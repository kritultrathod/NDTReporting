CREATE TABLE [MiEFW].[ComponentTxn] (
    [autoid]         BIGINT                 NOT NULL,
    [ComponentID]    BIGINT                 NULL,
    [AttributeID]    BIGINT                 NULL,
    [AttributeValue] NVARCHAR (4000)        NULL,
    [rowstatus]      [MiEFW].[ActiveStatus] NULL,
    [ModifyBy]       [MiEFW].[LoginID]      NULL,
    [MidifyDt]       DATETIME               NULL
);

