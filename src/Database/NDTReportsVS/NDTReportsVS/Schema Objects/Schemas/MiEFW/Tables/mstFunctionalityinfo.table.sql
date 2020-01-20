CREATE TABLE [MiEFW].[mstFunctionalityinfo] (
    [functionalityid]    BIGINT                 IDENTITY (1, 1) NOT NULL,
    [ClAppMapID]         BIGINT                 NULL,
    [functionalityname]  NVARCHAR (200)         NULL,
    [functionalityDescr] NVARCHAR (4000)        NULL,
    [modifyBy]           [MiEFW].[LoginID]      NULL,
    [modifyDt]           NCHAR (10)             NULL,
    [rowstatus]          [MiEFW].[ActiveStatus] NULL
);

