CREATE TABLE [NDTUAT].[MenuItems] (
    [MenuId]        INT           NOT NULL,
    [MenuName]      NVARCHAR (50) NULL,
    [MenuLocation]  NVARCHAR (50) NULL,
    [ParentID]      INT           NULL,
    [AppID]         INT           NULL,
    [ClientID]      INT           NULL,
    [CreatedBy]     INT           NULL,
    [CreatedDate]   DATETIME      NULL,
    [UpdatedBy]     INT           NULL,
    [UpdatedDate]   DATETIME      NULL,
    [DeletedStatus] SMALLINT      NULL
);

