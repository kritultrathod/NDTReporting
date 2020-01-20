CREATE TABLE [NDTUAT].[Techniquesxx] (
    [TechniqueId]        INT           IDENTITY (1, 1) NOT NULL,
    [SubTestId]          INT           NOT NULL,
    [TechniqueShortName] VARCHAR (50)  NULL,
    [TechniqueName]      VARCHAR (100) NOT NULL,
    [AppID]              INT           NULL,
    [ClientID]           INT           NULL,
    [CreatedBy]          INT           NULL,
    [CreatedDate]        DATETIME      NULL,
    [UpdatedBy]          INT           NULL,
    [UpdatedDate]        DATETIME      NULL,
    [DeletedStatus]      SMALLINT      NULL
);

