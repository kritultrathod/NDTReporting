CREATE TABLE [MiEFW].[SPManager_ParameterMaster] (
    [autoid]         INT             IDENTITY (1, 1) NOT NULL,
    [storeID]        NVARCHAR (30)   NOT NULL,
    [ParaName]       NVARCHAR (255)  NOT NULL,
    [ParaDataType]   INT             NOT NULL,
    [ParaDataSize]   INT             NOT NULL,
    [ParaDirection]  INT             NOT NULL,
    [ParaDefaultVal] NVARCHAR (3000) NULL,
    [ParaDescr]      NVARCHAR (2000) NULL,
    [modifiedby]     NVARCHAR (30)   NULL,
    [modifieddt]     DATETIME        NULL,
    [deleted]        NCHAR (3)       NULL
);

