CREATE TABLE [NDTUAT].[MagneticParticleExaminationTestResults] (
    [TestId]             INT           IDENTITY (1, 1) NOT NULL,
    [ReportId]           INT           NOT NULL,
    [Serial]             NVARCHAR (50) NULL,
    [JobDescription]     NVARCHAR (50) NULL,
    [Section]            NVARCHAR (50) NULL,
    [MagneticDimensionX] NVARCHAR (50) NULL,
    [MagneticDimensionY] NVARCHAR (50) NULL,
    [ObservationsId]     INT           NULL,
    [Result]             INT           NULL,
    [SketchReference]    NVARCHAR (50) NULL,
    [AppId]              INT           NULL,
    [ClientId]           INT           NULL,
    [CreatedBy]          INT           NULL,
    [CreatedDate]        DATETIME      NULL,
    [UpdatedBy]          INT           NULL,
    [UpdatedDate]        DATETIME      NULL,
    [DeletedStatus]      SMALLINT      NULL
);

