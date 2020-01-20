CREATE TABLE [MiEFW].[mstuserinfo] (
    [autoid]            INT                    IDENTITY (1, 1) NOT NULL,
    [loginid]           [MiEFW].[LoginID]      NOT NULL,
    [ContactID]         BIGINT                 NOT NULL,
    [onVacation]        NCHAR (3)              NULL,
    [disablelogin_from] DATETIME               NULL,
    [disablelogin_to]   DATETIME               NULL,
    [loginvaliditytill] DATETIME               NULL,
    [receivealerts]     NCHAR (3)              NULL,
    [modifiedby]        [MiEFW].[LoginID]      NULL,
    [modifieddt]        DATETIME               NULL,
    [rowstatus]         [MiEFW].[ActiveStatus] NULL
);

