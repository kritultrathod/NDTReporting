CREATE TABLE [MiEFW].[sysconfigtbl] (
    [autoid]      INT                    IDENTITY (1, 1) NOT NULL,
    [ClappIDMap]  BIGINT                 NOT NULL,
    [Category]    NVARCHAR (100)         NOT NULL,
    [sectionname] VARCHAR (30)           NOT NULL,
    [keyname]     VARCHAR (30)           NOT NULL,
    [keyvalue]    VARCHAR (100)          NOT NULL,
    [actionby]    [MiEFW].[LoginID]      NULL,
    [actiondate]  DATETIME               NULL,
    [rowStatus]   [MiEFW].[ActiveStatus] NULL
);

