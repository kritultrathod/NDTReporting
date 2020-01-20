CREATE TABLE [NDTUAT].[UltrasonicExaminationTestResults] (
    [TestId]              INT           IDENTITY (1, 1) NOT NULL,
    [ReportId]            INT           NOT NULL,
    [Serial]              NVARCHAR (50) NULL,
    [JobDescription]      NVARCHAR (50) NULL,
    [Material]            NVARCHAR (50) NULL,
    [UltrasonicQuantityX] NVARCHAR (50) NULL,
    [UltrasonicQuantityY] NVARCHAR (50) NULL,
    [Dimension]           NVARCHAR (50) NULL,
    [Length]              INT           NULL,
    [Depth]               INT           NULL,
    [ObservationsId]      INT           NULL,
    [Result]              INT           NULL,
    [SketchReference]     NVARCHAR (50) NULL,
    [AppId]               INT           NULL,
    [ClientId]            INT           NULL,
    [CreatedBy]           INT           NULL,
    [CreatedDate]         DATETIME      NULL,
    [UpdatedBy]           INT           NULL,
    [UpdatedDate]         DATETIME      NULL,
    [DeletedStatus]       SMALLINT      NULL
);

