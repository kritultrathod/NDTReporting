CREATE TABLE [NDTUAT].[WeldType] (
    [WeldTypeId]    INT           IDENTITY (1, 1) NOT NULL,
    [WeldType]      VARCHAR (50)  NOT NULL,
    [WeldingMethod] VARCHAR (100) NULL,
    [AppID]         INT           NULL,
    [ClientID]      INT           NULL,
    [CreatedBy1]    INT           NULL,
    [CreatedDate1]  DATETIME      NULL,
    [UpdatedBy]     INT           NULL,
    [UpdatedDate]   DATETIME      NULL,
    [DeletedStatus] SMALLINT      NULL
);

