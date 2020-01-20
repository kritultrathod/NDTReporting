﻿CREATE TABLE [NDTUAT].[TechniqueSheetDetails] (
    [TechniqueId]            INT           IDENTITY (1, 1) NOT NULL,
    [SubTestId]              INT           NOT NULL,
    [TechniqueSheetName]     INT           NOT NULL,
    [CalibrationDate]        DATETIME      NULL,
    [DensitometerNo]         VARCHAR (50)  NULL,
    [ExposureTime]           NVARCHAR (50) NULL,
    [ExtentofExamination]    VARCHAR (50)  NULL,
    [FilmMakeAndType]        VARCHAR (100) NULL,
    [GeometricalUnsharpness] VARCHAR (50)  NULL,
    [IQIBatchNo]             VARCHAR (50)  NULL,
    [MaterialSpecification]  VARCHAR (50)  NULL,
    [RadiationSourceId]      INT           NULL,
    [ShimThickness]          VARCHAR (50)  NULL,
    [StageofExamination]     VARCHAR (50)  NULL,
    [SurfaceCondition]       VARCHAR (50)  NULL,
    [SurfaceTemperature]     VARCHAR (50)  NULL,
    [TestLimitations]        VARCHAR (50)  NULL,
    [TypeofIQI]              VARCHAR (50)  NULL,
    [WeldPreparation]        VARCHAR (200) NULL,
    [WeldThickness]          VARCHAR (50)  NULL,
    [WeldType]               VARCHAR (50)  NULL,
    [WeldingMethod]          VARCHAR (50)  NULL,
    [AppID]                  INT           NULL,
    [ClientID]               INT           NULL,
    [CreatedBy]              INT           NULL,
    [CreatedDate]            DATETIME      NULL,
    [UpdatedBy]              INT           NULL,
    [UpdatedDate]            DATETIME      NULL,
    [DeletedStatus]          SMALLINT      NOT NULL
);

