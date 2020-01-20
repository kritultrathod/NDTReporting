CREATE TABLE [MiEFW].[ContactInfo] (
    [AutoID]    BIGINT                 IDENTITY (1, 1) NOT NULL,
    [ContactID] NVARCHAR (30)          NOT NULL,
    [CName]     NVARCHAR (1000)        NOT NULL,
    [CSurname]  NVARCHAR (2000)        NOT NULL,
    [createDt]  DATETIME               NOT NULL,
    [createBy]  [MiEFW].[LoginID]      NOT NULL,
    [ModifyDt]  DATETIME               NULL,
    [ModifyBy]  [MiEFW].[LoginID]      NULL,
    [RowStatus] [MiEFW].[ActiveStatus] NOT NULL
);

