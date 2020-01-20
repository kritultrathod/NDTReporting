CREATE TABLE [MiEFW].[mst_Appbase] (
    [AutoID]          BIGINT          IDENTITY (1, 1) NOT NULL,
    [ApplicationName] NVARCHAR (2000) NOT NULL,
    [CreateDt]        DATETIME        NULL,
    [CreateBy]        NVARCHAR (100)  NULL,
    [ModifyDt]        DATETIME        NULL,
    [ModifyBy]        NVARCHAR (100)  NULL,
    [RowStatus]       NCHAR (10)      NOT NULL
);

