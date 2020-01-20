CREATE TABLE [MiEFW].[mstClientAppMap] (
    [AutoID]      BIGINT                 IDENTITY (1, 1) NOT NULL,
    [AppID]       BIGINT                 NOT NULL,
    [ClientID]    BIGINT                 NOT NULL,
    [Description] NVARCHAR (2000)        NULL,
    [createDt]    DATETIME               NOT NULL,
    [createBy]    [MiEFW].[LoginID]      NOT NULL,
    [ModifyDt]    DATETIME               NULL,
    [ModifyBy]    [MiEFW].[LoginID]      NULL,
    [RowStatus]   [MiEFW].[ActiveStatus] NULL
);

