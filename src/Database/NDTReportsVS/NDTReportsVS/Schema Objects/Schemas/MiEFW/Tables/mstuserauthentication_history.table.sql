CREATE TABLE [MiEFW].[mstuserauthentication_history] (
    [autoid]        INT               IDENTITY (1, 1) NOT NULL,
    [auditaction]   NVARCHAR (30)     NOT NULL,
    [auditactionby] [MiEFW].[LoginID] NOT NULL,
    [auditactiondt] DATETIME          NOT NULL,
    [loginid]       [MiEFW].[LoginID] NOT NULL,
    [loginpwd]      NVARCHAR (2000)   NOT NULL,
    [pwdchangedt]   DATETIME          NULL,
    [badattempts]   INT               NULL,
    [lockoutdt]     DATETIME          NULL,
    [lastlogindt]   DATETIME          NULL,
    [lastlogoutdt]  DATETIME          NULL,
    [loginstatus]   NCHAR (3)         NULL,
    [pwdstatus]     NCHAR (3)         NULL
);

