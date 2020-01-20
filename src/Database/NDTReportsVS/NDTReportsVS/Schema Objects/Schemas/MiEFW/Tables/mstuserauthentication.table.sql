CREATE TABLE [MiEFW].[mstuserauthentication] (
    [loginid]      [MiEFW].[LoginID] NOT NULL,
    [loginpwd]     NVARCHAR (2000)   NOT NULL,
    [pwdchangedt]  DATETIME          NULL,
    [badattempts]  INT               NULL,
    [lockoutdt]    DATETIME          NULL,
    [lastlogindt]  DATETIME          NULL,
    [lastlogoutdt] DATETIME          NULL,
    [loginstatus]  NCHAR (3)         NULL,
    [pwdstatus]    NCHAR (3)         NULL
);

