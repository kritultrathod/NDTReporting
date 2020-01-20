CREATE TABLE [NDTUAT].[CustomReportTemplateDetails] (
    [CustomReportTemplateDetailsId] INT            IDENTITY (1, 1) NOT NULL,
    [CustomReportTemplateId]        INT            NOT NULL,
    [ReportTemplate]                NVARCHAR (MAX) NOT NULL,
    [SectionsId]                    INT            NOT NULL,
    [AppId]                         INT            NULL,
    [ClientId]                      INT            NULL,
    [CreatedBy]                     INT            NULL,
    [CreatedDate]                   DATETIME       NULL,
    [UpdatedBy]                     INT            NULL,
    [UpdatedDate]                   DATETIME       NULL,
    [DeletedStatus]                 SMALLINT       NULL
);

