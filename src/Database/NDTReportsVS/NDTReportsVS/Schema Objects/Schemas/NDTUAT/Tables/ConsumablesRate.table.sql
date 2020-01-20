CREATE TABLE [NDTUAT].[ConsumablesRate] (
    [ConsumablesRateId] INT             IDENTITY (1, 1) NOT NULL,
    [ConsumablesType]   INT             NOT NULL,
    [PerUnitRate]       DECIMAL (18, 2) NOT NULL,
    [SubTest]           NCHAR (10)      NOT NULL,
    [AppID]             INT             NULL,
    [ClientID]          INT             NULL,
    [CreatedBy]         INT             NULL,
    [CreatedDate]       DATETIME        NULL,
    [UpdatedBy]         INT             NULL,
    [UpdatedDate]       DATETIME        NULL,
    [DeletedStatus]     SMALLINT        NULL
);

