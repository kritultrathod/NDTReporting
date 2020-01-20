CREATE TABLE [NDTUAT].[ReportTemplates] (
    [ID]             INT            IDENTITY (1, 1) NOT NULL,
    [TestId]         INT            NULL,
    [SubTestId]      INT            NULL,
    [ReportTemplate] NVARCHAR (MAX) NOT NULL,
    [FieldOrder]     NVARCHAR (MAX) NOT NULL,
    [Section]        NVARCHAR (50)  NULL,
    [SectionsID]     INT            NULL,
    [AppID]          INT            NULL,
    [ClientID]       INT            NULL,
    [CreatedBy]      INT            NULL,
    [CreatedDate]    DATETIME       NULL,
    [UpdatedBy]      INT            NULL,
    [UpdatedDate]    DATETIME       NULL,
    [DeletedStatus]  SMALLINT       NULL
);

