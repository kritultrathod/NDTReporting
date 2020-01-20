CREATE TABLE [NDTUAT].[CustomReportTemplate] (
    [CustomReportTemplateId] INT            IDENTITY (1, 1) NOT NULL,
    [SubTestId]              INT            NOT NULL,
    [BaseReportTemplateId]   INT            NULL,
    [TemplateName]           NVARCHAR (100) NOT NULL,
    [AppId]                  INT            NULL,
    [ClientId]               INT            NOT NULL,
    [CreatedBy]              INT            NULL,
    [CreatedDate]            DATETIME       NULL,
    [UpdatedBy]              INT            NULL,
    [UpdatedDate]            DATETIME       NULL,
    [DeletedStatus]          SMALLINT       NULL
);

