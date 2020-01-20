CREATE TABLE [MiEFW].[MiDBTool_ParameterMaster] (
    [autoid]         INT                    IDENTITY (1, 1) NOT NULL,
    [storeID]        NVARCHAR (30)          NOT NULL,
    [ParaName]       NVARCHAR (255)         NOT NULL,
    [ParaDataType]   INT                    NOT NULL,
    [ParaDataSize]   INT                    NOT NULL,
    [ParaDirection]  INT                    NOT NULL,
    [ParaDefaultVal] NVARCHAR (3000)        NULL,
    [ParaDescr]      NVARCHAR (2000)        NULL,
    [modifiedby]     [MiEFW].[LoginID]      NULL,
    [modifieddt]     DATETIME               NULL,
    [RowStatus]      [MiEFW].[ActiveStatus] NOT NULL
);

