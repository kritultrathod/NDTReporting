CREATE TABLE [NDTUAT].[RadiographicWeldTestResult] (
    [TestId]           INT            IDENTITY (1, 1) NOT NULL,
    [ReportId]         INT            NOT NULL,
    [IdentificationNo] NVARCHAR (100) NULL,
    [JointNo]          INT            NULL,
    [Welder]           NVARCHAR (200) NULL,
    [Segment]          NVARCHAR (200) NULL,
    [FlimSizeX]        NVARCHAR (50)  NULL,
    [FlimSizeY]        NVARCHAR (50)  NULL,
    [Density]          DECIMAL (5, 2) NULL,
    [Sensitivity]      VARCHAR (50)   NULL,
    [ObservationsId]   INT            NULL,
    [RemarksId]        INT            NULL,
    [AppID]            INT            NULL,
    [ClientID]         INT            NULL,
    [CreatedBy]        INT            NULL,
    [CreatedDate]      DATETIME       NULL,
    [UpdatedBy]        INT            NULL,
    [UpdatedDate]      DATETIME       NULL,
    [DeletedStatus]    SMALLINT       NULL
);

