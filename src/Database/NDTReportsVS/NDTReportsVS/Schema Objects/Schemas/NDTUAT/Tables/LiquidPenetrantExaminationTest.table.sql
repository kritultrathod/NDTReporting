﻿CREATE TABLE [NDTUAT].[LiquidPenetrantExaminationTest] (
    [ReportId]               INT            IDENTITY (1, 1) NOT NULL,
    [FabricatorName]         NVARCHAR (200) NOT NULL,
    [SubTestId]              INT            NOT NULL,
    [Location]               NVARCHAR (200) NULL,
    [ReportNo]               NVARCHAR (50)  NULL,
    [ContractNo]             NVARCHAR (50)  NOT NULL,
    [ContactPerson]          NVARCHAR (50)  NULL,
    [DateofTesting]          DATETIME       NOT NULL,
    [JobDescription]         NVARCHAR (200) NULL,
    [Material]               NVARCHAR (50)  NULL,
    [Dimension]              NVARCHAR (50)  NULL,
    [SurfaceCondition]       NVARCHAR (50)  NULL,
    [ReferenceCode]          INT            NULL,
    [AcceptanceCriteria]     NVARCHAR (50)  NULL,
    [TechSheetNo]            NVARCHAR (50)  NULL,
    [ExtentofCoverage]       NVARCHAR (50)  NULL,
    [SurfaceTemperature]     NVARCHAR (50)  NULL,
    [ConsumablesType]        INT            NULL,
    [TechniqueId]            INT            NULL,
    [Penetrant]              NVARCHAR (50)  NULL,
    [PenetrantBatchNo]       NVARCHAR (50)  NULL,
    [ApplicationOfPenetrant] NVARCHAR (50)  NULL,
    [PenetrantRemovalMethod] NVARCHAR (50)  NULL,
    [Developer]              NVARCHAR (50)  NULL,
    [DeveloperBatchNo]       NVARCHAR (50)  NULL,
    [ApplicationOfDeveloper] NVARCHAR (50)  NULL,
    [ViewingCondition]       NVARCHAR (50)  NULL,
    [MarkingOfIndication]    NVARCHAR (50)  NULL,
    [PreCleaning]            NVARCHAR (50)  NULL,
    [DwellTime]              NVARCHAR (50)  NULL,
    [DryingTime]             NVARCHAR (50)  NULL,
    [BlackLightDetails]      NVARCHAR (50)  NULL,
    [FinalClearing]          NVARCHAR (50)  NULL,
    [AppId]                  INT            NULL,
    [ClientId]               INT            NULL,
    [CreatedBy]              INT            NULL,
    [CreatedDate]            DATETIME       NULL,
    [UpdatedBy]              INT            NULL,
    [UpdatedDate]            DATETIME       NULL,
    [DeletedStatus]          SMALLINT       NULL
);

