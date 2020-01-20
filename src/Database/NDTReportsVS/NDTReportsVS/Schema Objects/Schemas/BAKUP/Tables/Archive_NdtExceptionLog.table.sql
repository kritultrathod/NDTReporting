CREATE TABLE [BAKUP].[Archive_NdtExceptionLog] (
    [autoid]         BIGINT          IDENTITY (1, 1) NOT NULL,
    [StackTrace]     NVARCHAR (4000) NULL,
    [Message]        NVARCHAR (4000) NULL,
    [InnerException] NVARCHAR (4000) NULL,
    [AppID]          INT             NULL,
    [ClientID]       INT             NULL,
    [CreatedBy]      INT             NULL,
    [CreatedDate]    DATETIME        NULL,
    [DeletedStatus]  SMALLINT        NULL
);

