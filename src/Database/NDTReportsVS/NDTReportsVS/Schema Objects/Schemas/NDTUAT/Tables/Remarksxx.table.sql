CREATE TABLE [NDTUAT].[Remarksxx] (
    [RemarksId]        INT          IDENTITY (1, 1) NOT NULL,
    [RemarksShortName] VARCHAR (10) NOT NULL,
    [Remarks]          VARCHAR (50) NOT NULL,
    [AppID]            INT          NULL,
    [ClientID]         INT          NULL,
    [CreatedBy]        INT          NULL,
    [CreatedDate]      DATETIME     NULL,
    [UpdatedBy]        INT          NULL,
    [UpdatedDate]      DATETIME     NULL,
    [DeletedStatus]    SMALLINT     NULL
);

