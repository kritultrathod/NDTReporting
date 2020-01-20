CREATE TABLE [NDTUAT].[UserMenu] (
    [UserId]        INT      NOT NULL,
    [MenuId]        INT      NOT NULL,
    [AppID]         INT      NULL,
    [ClientID]      INT      NULL,
    [CreatedBy]     INT      NULL,
    [CreatedDate]   DATETIME NULL,
    [UpdatedBy]     INT      NULL,
    [UpdatedDate]   DATETIME NULL,
    [DeletedStatus] SMALLINT NULL
);

