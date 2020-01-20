CREATE TABLE [NDTUAT].[RadiationSource] (
    [RadiationSourceId] INT          IDENTITY (1, 1) NOT NULL,
    [TypeofSource]      VARCHAR (50) NOT NULL,
    [UnitofEnergy]      VARCHAR (50) NULL,
    [Identification]    VARCHAR (50) NULL,
    [FocalSpotSize]     VARCHAR (50) NULL,
    [AppID]             INT          NULL,
    [ClientID]          INT          NULL,
    [CreatedBy]         INT          NULL,
    [CreatedDate]       DATETIME     NULL,
    [UpdatedBy]         INT          NULL,
    [UpdatedDate]       DATETIME     NULL,
    [DeletedStatus]     SMALLINT     NULL
);

