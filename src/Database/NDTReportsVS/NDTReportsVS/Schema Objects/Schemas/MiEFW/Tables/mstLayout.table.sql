CREATE TABLE [MiEFW].[mstLayout] (
    [AutoID]            BIGINT                 IDENTITY (1, 1) NOT NULL,
    [LayoutID]          NVARCHAR (20)          NOT NULL,
    [ClAppIDMap]        BIGINT                 NOT NULL,
    [LayoutName]        NVARCHAR (250)         NOT NULL,
    [LayoutDescription] NVARCHAR (3000)        NOT NULL,
    [CreateBy]          [MiEFW].[LoginID]      NOT NULL,
    [CreateDt]          DATETIME               NOT NULL,
    [ModifyBy]          [MiEFW].[LoginID]      NULL,
    [ModifyDt]          DATETIME               NULL,
    [rowStatus]         [MiEFW].[ActiveStatus] NOT NULL
);

