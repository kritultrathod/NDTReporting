CREATE TABLE [BAKUP].[Archive_NdtDBExceptionLog] (
    [ErrorNumber]    INT            NULL,
    [ErrorSeverity]  INT            NULL,
    [ErrorState]     INT            NULL,
    [ErrorProcedure] NVARCHAR (MAX) NULL,
    [ErrorLine]      INT            NULL,
    [ErrorMessage]   NVARCHAR (MAX) NULL,
    [Error]          INT            NULL,
    [ErrorDate]      DATETIME       NULL
);

