CREATE TABLE [MiEFW].[MstDevComponents] (
    [AutoID]               BIGINT                   NOT NULL,
    [ComponentID]          NVARCHAR (50)            NOT NULL,
    [ComponentPrefix]      NCHAR (5)                NOT NULL,
    [Componentname]        NVARCHAR (1000)          NOT NULL,
    [ComponentDescription] NVARCHAR (2000)          NULL,
    [ActiveStatus]         [NDTProd].[ActiveStatus] NOT NULL,
    [CreateBy]             [NDTProd].[LoginID]      NOT NULL,
    [CreateDt]             DATETIME                 NOT NULL,
    [ModifyBy]             [NDTProd].[LoginID]      NULL,
    [ModifyDt]             DATETIME                 NULL
);

