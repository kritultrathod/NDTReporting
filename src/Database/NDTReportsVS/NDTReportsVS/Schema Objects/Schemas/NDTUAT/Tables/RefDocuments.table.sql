CREATE TABLE [NDTUAT].[RefDocuments] (
    [RefDocumentId]      INT            IDENTITY (1, 1) NOT NULL,
    [SubTestId]          INT            NOT NULL,
    [Code]               NVARCHAR (100) NULL,
    [TestSpecification]  NVARCHAR (100) NULL,
    [TestProcedureNo]    NVARCHAR (100) NULL,
    [AcceptanceStandard] NVARCHAR (100) NULL,
    [AppID]              INT            NULL,
    [ClientID]           INT            NULL,
    [CreatedBy1]         INT            NULL,
    [CreatedDate1]       DATETIME       NULL,
    [UpdatedBy]          INT            NULL,
    [UpdatedDate]        DATETIME       NULL,
    [DeletedStatus]      SMALLINT       NULL
);

