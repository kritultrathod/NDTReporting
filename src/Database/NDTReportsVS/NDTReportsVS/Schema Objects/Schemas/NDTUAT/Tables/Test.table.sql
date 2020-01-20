CREATE TABLE [NDTUAT].[Test] (
    [TestId]        INT            IDENTITY (1, 1) NOT NULL,
    [TestName]      NVARCHAR (100) NOT NULL,
    [AppID]         INT            NULL,
    [ClientID]      INT            NULL,
    [CreatedBy1]    INT            NULL,
    [CreatedDate1]  DATETIME       NULL,
    [UpdatedBy]     INT            NULL,
    [UpdatedDate]   DATETIME       NULL,
    [DeletedStatus] SMALLINT       NULL
);

