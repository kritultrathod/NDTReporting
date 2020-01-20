CREATE TABLE [MiEFW].[MstDevComponents_Attributes] (
    [AutoID]                 BIGINT                   NOT NULL,
    [ComponentID]            BIGINT                   NULL,
    [CAttributeID]           NVARCHAR (50)            NOT NULL,
    [CAttributeName]         NVARCHAR (100)           NOT NULL,
    [CAttributeDataType]     INT                      NOT NULL,
    [CAttributeDefalutValue] NVARCHAR (1000)          NULL,
    [CAttributeMandatory]    NVARCHAR (10)            NOT NULL,
    [AttributeDescription]   NVARCHAR (2000)          NULL,
    [ActiveStatus]           [NDTProd].[ActiveStatus] NOT NULL,
    [CreateBy]               [NDTProd].[LoginID]      NOT NULL,
    [CreateDt]               DATETIME                 NOT NULL,
    [ModifyBy]               [NDTProd].[LoginID]      NULL,
    [ModifyDt]               DATETIME                 NULL
);

