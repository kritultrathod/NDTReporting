CREATE TABLE [MiEFW].[mstroleinfo] (
    [roleid]     BIGINT                 IDENTITY (1, 1) NOT NULL,
    [ClAppIDMap] BIGINT                 NULL,
    [rolename]   NVARCHAR (500)         NULL,
    [modifiedby] [MiEFW].[LoginID]      NULL,
    [modifieddt] DATETIME               NULL,
    [rowstatus]  [MiEFW].[ActiveStatus] NULL
);

