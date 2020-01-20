CREATE TABLE [MiEFW].[User2Role2AppMap] (
    [AutoID]              BIGINT                 IDENTITY (1, 1) NOT NULL,
    [LoginID]             [MiEFW].[LoginID]      NULL,
    [RoleFunctionalityID] BIGINT                 NULL,
    [ClAppIDMap]          BIGINT                 NULL,
    [ModifyBy]            [MiEFW].[LoginID]      NULL,
    [ModifyDt]            DATETIME               NULL,
    [rowstatus]           [MiEFW].[ActiveStatus] NULL
);

