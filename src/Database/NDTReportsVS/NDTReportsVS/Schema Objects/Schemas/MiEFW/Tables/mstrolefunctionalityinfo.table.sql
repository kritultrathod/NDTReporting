CREATE TABLE [MiEFW].[mstrolefunctionalityinfo] (
    [AutoID]          BIGINT                 NOT NULL,
    [ClAppMapID]      BIGINT                 NULL,
    [roleid]          BIGINT                 NULL,
    [functionalityid] BIGINT                 NULL,
    [modifiedby]      [MiEFW].[LoginID]      NULL,
    [modifieddt]      DATETIME               NULL,
    [rowStatus]       [MiEFW].[ActiveStatus] NULL
);

