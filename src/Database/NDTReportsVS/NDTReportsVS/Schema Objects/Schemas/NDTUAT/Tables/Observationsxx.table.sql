CREATE TABLE [NDTUAT].[Observationsxx] (
    [ObservationsId]        INT           IDENTITY (1, 1) NOT NULL,
    [ObservationsShortName] NVARCHAR (10) NOT NULL,
    [Observations]          NVARCHAR (50) NOT NULL,
    [AppID]                 INT           NULL,
    [ClientID]              INT           NULL,
    [CreatedBy]             INT           NULL,
    [CreatedDate]           DATETIME      NULL,
    [UpdatedBy]             INT           NULL,
    [UpdatedDate]           DATETIME      NULL,
    [DeletedStatus]         SMALLINT      NULL
);

