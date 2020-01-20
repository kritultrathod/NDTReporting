CREATE TABLE [MiEFW].[MessageResources] (
    [AutoID]            INT             IDENTITY (1, 1) NOT NULL,
    [MessageID]         NVARCHAR (30)   NULL,
    [ClientAppMapID]    INT             NOT NULL,
    [DisplayMessage]    NVARCHAR (4000) NOT NULL,
    [InternalErrorCode] NVARCHAR (1000) NULL,
    [CreateBy]          NVARCHAR (50)   NULL,
    [CreateDt]          DATETIME        NULL,
    [ModifyBy]          NVARCHAR (50)   NULL,
    [ModifyDt]          DATETIME        NULL,
    [RowStatus]         NCHAR (10)      NOT NULL
);

