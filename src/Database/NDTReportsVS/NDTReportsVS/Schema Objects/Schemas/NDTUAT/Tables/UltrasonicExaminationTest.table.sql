﻿CREATE TABLE [NDTUAT].[UltrasonicExaminationTest] (
    [ReportId]           INT            IDENTITY (1, 1) NOT NULL,
    [FabricatorName]     NVARCHAR (200) NOT NULL,
    [SubTestId]          INT            NOT NULL,
    [Location]           NVARCHAR (200) NULL,
    [ReportNo]           NVARCHAR (50)  NULL,
    [ContractNo]         NVARCHAR (50)  NOT NULL,
    [ContactPerson]      NVARCHAR (50)  NULL,
    [DateofTesting]      DATETIME       NOT NULL,
    [Equipment]          NVARCHAR (50)  NULL,
    [CalibrationStatus]  NVARCHAR (50)  NULL,
    [CouplingMedia]      NVARCHAR (50)  NULL,
    [SurfaceCondition]   NVARCHAR (50)  NULL,
    [ReferenceCode]      INT            NULL,
    [AcceptanceCriteria] NVARCHAR (50)  NULL,
    [TechSheetNo]        NVARCHAR (50)  NULL,
    [ExtentofCoverage]   NVARCHAR (50)  NULL,
    [ConsumablesType]    INT            NULL,
    [CalibrationBlock]   NVARCHAR (50)  NULL,
    [ReferenceBlock]     NVARCHAR (50)  NULL,
    [SearchUnit]         NVARCHAR (50)  NULL,
    [Frequency]          NVARCHAR (50)  NULL,
    [BeamAngle]          NVARCHAR (50)  NULL,
    [BeamIndex]          NVARCHAR (50)  NULL,
    [MaxBeamPath]        NVARCHAR (50)  NULL,
    [TimeBaseRange]      NVARCHAR (50)  NULL,
    [Reflector]          NVARCHAR (50)  NULL,
    [Gain]               NVARCHAR (50)  NULL,
    [Correction]         NVARCHAR (50)  NULL,
    [Scan]               NVARCHAR (50)  NULL,
    [RejectionLevel]     NVARCHAR (50)  NULL,
    [RecordingLevel]     NVARCHAR (50)  NULL,
    [AppId]              INT            NULL,
    [ClientId]           INT            NULL,
    [CreatedBy]          INT            NULL,
    [CreatedDate]        DATETIME       NULL,
    [UpdatedBy]          INT            NULL,
    [UpdatedDate]        DATETIME       NULL,
    [DeletedStatus]      SMALLINT       NULL
);

