CREATE TABLE [MiEFW].[mst_ResourceMetadata] (
    [AutoID]                BIGINT                 IDENTITY (1, 1) NOT NULL,
    [ClAppMapID]            BIGINT                 NULL,
    [ResourceCategory]      NVARCHAR (100)         NOT NULL,
    [ResourcePriorityOrder] INT                    NULL,
    [ResourceText]          NVARCHAR (1000)        NOT NULL,
    [ResourceVal]           NVARCHAR (50)          NOT NULL,
    [BriefDescription]      NVARCHAR (500)         NULL,
    [CreateDt]              DATETIME               NULL,
    [CreateBy]              [MiEFW].[LoginID]      NULL,
    [ModifyDt]              DATETIME               NULL,
    [ModifyBy]              [MiEFW].[LoginID]      NULL,
    [RowStatus]             [MiEFW].[ActiveStatus] NOT NULL
);

