CREATE TABLE [NDTUAT].[LookUpMasterTest] (
    [LookupCodeID]  INT            IDENTITY (1, 1) NOT NULL,
    [LookupCode]    VARCHAR (50)   NOT NULL,
    [ParamKey]      VARCHAR (10)   NOT NULL,
    [ParamDesc1]    NVARCHAR (100) NULL,
    [ParamDesc2]    NVARCHAR (100) NULL,
    [SortOrder]     TINYINT        NULL,
    [SubTestId]     INT            NOT NULL,
    [AppID]         INT            NULL,
    [ClientID]      INT            NOT NULL,
    [CreatedBy]     INT            NULL,
    [CreatedDate]   DATETIME       NULL,
    [UpdatedBy]     INT            NULL,
    [UpdatedDate]   DATETIME       NULL,
    [DeletedStatus] INT            NOT NULL
);

