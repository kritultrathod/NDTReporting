CREATE TABLE [MiEFW].[MstDevComponentEvent] (
    [AutoID]                BIGINT                 NOT NULL,
    [ComponentID]           BIGINT                 NOT NULL,
    [ComponentEventName]    NVARCHAR (250)         NOT NULL,
    [ComponentTriggerPoint] NVARCHAR (100)         NULL,
    [TriggerActionBlock]    NVARCHAR (4000)        NULL,
    [CreateBy]              [MiEFW].[LoginID]      NULL,
    [CreateDt]              DATETIME               NULL,
    [ModifyBy]              [MiEFW].[LoginID]      NULL,
    [ModifyDt]              DATETIME               NULL,
    [rowStatus]             [MiEFW].[ActiveStatus] NULL
);

