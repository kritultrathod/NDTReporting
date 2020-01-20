﻿CREATE TABLE [NDTUAT].[RadiographicWeld] (
    [ReportId]               INT            IDENTITY (1, 1) NOT NULL,
    [Client]                 NVARCHAR (200) NULL,
    [Location]               NVARCHAR (200) NULL,
    [ContactPerson]          NVARCHAR (200) NULL,
    [TestReportNumber]       NVARCHAR (50)  NULL,
    [JobDescription]         NVARCHAR (500) NULL,
    [TestDate]               DATETIME       NULL,
    [ContractNo]             NVARCHAR (50)  NULL,
    [RefDocumentId]          INT            NULL,
    [RadiationSourceId]      INT            NULL,
    [FilmMakeAndType]        INT            NULL,
    [TypeofIQI]              VARCHAR (50)   NULL,
    [IQIBatchNo]             VARCHAR (50)   NULL,
    [TechniqueId]            INT            NULL,
    [ShimThickness]          VARCHAR (50)   NULL,
    [DensitometerNo]         VARCHAR (50)   NULL,
    [CalibrationDate]        DATETIME       NULL,
    [GeometricalUnsharpness] VARCHAR (50)   NULL,
    [MaterialSpecification]  VARCHAR (50)   NULL,
    [SurfaceCondition]       VARCHAR (50)   NULL,
    [SurfaceTemperature]     VARCHAR (50)   NULL,
    [ExtentofExamination]    VARCHAR (50)   NULL,
    [Dimension]              VARCHAR (50)   NULL,
    [WeldThickness]          VARCHAR (50)   NULL,
    [WeldPreparation]        VARCHAR (50)   NULL,
    [StageofExamination]     VARCHAR (50)   NULL,
    [ContactNumber]          VARCHAR (30)   NULL,
    [SFD]                    VARCHAR (50)   NULL,
    [WeldingMethod]          VARCHAR (50)   NULL,
    [ExposureTime]           NVARCHAR (50)  NULL,
    [SubTestId]              INT            NULL,
    [AppID]                  INT            NULL,
    [ClientID]               INT            NULL,
    [CreatedBy]              INT            NULL,
    [CreatedDate]            DATETIME       NULL,
    [UpdatedBy]              INT            NULL,
    [UpdatedDate]            DATETIME       NULL,
    [DeletedStatus]          SMALLINT       NULL
);

