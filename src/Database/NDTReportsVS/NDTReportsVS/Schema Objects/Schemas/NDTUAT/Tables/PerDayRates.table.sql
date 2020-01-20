CREATE TABLE [NDTUAT].[PerDayRates] (
    [PerDayRatesId]     INT             IDENTITY (1, 1) NOT NULL,
    [RadiationSourceId] INT             NOT NULL,
    [SubTestId]         INT             NOT NULL,
    [PerDayUnitRate]    DECIMAL (18, 2) NOT NULL,
    [AppID]             INT             NULL,
    [ClientID]          INT             NULL,
    [CreatedBy]         INT             NULL,
    [CreatedDate]       DATETIME        NULL,
    [UpdatedBy]         INT             NULL,
    [UpdatedDate]       DATETIME        NULL,
    [DeletedStatus]     SMALLINT        NULL
);

