CREATE TABLE [NDTUAT].[Users] (
    [UserId]        INT           IDENTITY (1, 1) NOT NULL,
    [EmailId]       NVARCHAR (50) NOT NULL,
    [UserPassword]  NVARCHAR (50) NOT NULL,
    [AppId]         INT           NULL,
    [ClientId]      INT           NULL,
    [CreatedBy]     INT           NULL,
    [CreatedDate]   DATETIME      NULL,
    [UpdatedBy]     INT           NULL,
    [UpdatedDate]   DATETIME      NULL,
    [DeletedStatus] SMALLINT      NULL,
    [IsAdmin]       SMALLINT      NULL
);

