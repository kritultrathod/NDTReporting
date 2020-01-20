CREATE TABLE [MiEFW].[Archive_mst_Clientbase] (
    [AutoID]     BIGINT          IDENTITY (1, 1) NOT NULL,
    [ClientName] NVARCHAR (2000) NOT NULL,
    [CreateDt]   DATETIME        NULL,
    [CreateBy]   NVARCHAR (100)  NULL,
    [ModifyDt]   DATETIME        NULL,
    [ModifyBy]   NVARCHAR (100)  NULL,
    [RowStatus]  NCHAR (10)      NOT NULL
);

