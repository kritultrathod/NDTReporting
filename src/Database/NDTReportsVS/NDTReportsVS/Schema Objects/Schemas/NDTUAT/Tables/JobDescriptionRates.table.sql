CREATE TABLE [NDTUAT].[JobDescriptionRates] (
    [JobDescriptionId] INT             IDENTITY (1, 1) NOT NULL,
    [JobDescription]   VARCHAR (100)   NOT NULL,
    [PerUnitRate]      DECIMAL (18, 2) NOT NULL,
    [SubTest]          INT             NOT NULL,
    [AppID]            INT             NULL,
    [ClientID]         INT             NULL,
    [CreatedBy]        INT             NULL,
    [CreatedDate]      DATETIME        NULL,
    [UpdatedBy]        INT             NULL,
    [UpdatedDate]      DATETIME        NULL,
    [DeletedStatus]    SMALLINT        NULL
);

