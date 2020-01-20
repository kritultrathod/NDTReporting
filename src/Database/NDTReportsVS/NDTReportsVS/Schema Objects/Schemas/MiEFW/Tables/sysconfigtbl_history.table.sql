CREATE TABLE [MiEFW].[sysconfigtbl_history] (
    [auditaction]   NVARCHAR (30)          NOT NULL,
    [auditactionby] [MiEFW].[LoginID]      NOT NULL,
    [auditactiondt] DATETIME               NOT NULL,
    [ClAppIDMap]    BIGINT                 NULL,
    [Category]      NVARCHAR (100)         NULL,
    [sectionname]   VARCHAR (30)           NOT NULL,
    [keyname]       VARCHAR (30)           NOT NULL,
    [keyvalue]      VARCHAR (100)          NOT NULL,
    [actionby]      [MiEFW].[LoginID]      NULL,
    [actiondate]    DATETIME               NULL,
    [rowstatus]     [MiEFW].[ActiveStatus] NULL
);

