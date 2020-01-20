CREATE TABLE [NDTUAT].[FilmTypeRates] (
    [FilmTypeRateId] INT             IDENTITY (1, 1) NOT NULL,
    [FilmType]       INT             NOT NULL,
    [PerUnitRate]    DECIMAL (18, 2) NOT NULL,
    [RateType]       INT             NOT NULL,
    [SubTest]        NCHAR (10)      NOT NULL,
    [AppID]          INT             NULL,
    [ClientID]       INT             NULL,
    [CreatedBy]      INT             NULL,
    [CreatedDate]    DATETIME        NULL,
    [UpdatedBy]      INT             NULL,
    [UpdatedDate]    DATETIME        NULL,
    [DeletedStatus]  SMALLINT        NULL
);

