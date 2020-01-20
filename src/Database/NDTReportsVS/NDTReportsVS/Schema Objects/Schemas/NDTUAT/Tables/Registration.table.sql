CREATE TABLE [NDTUAT].[Registration] (
    [Id]               INT           IDENTITY (1, 1) NOT NULL,
    [UserId]           INT           NULL,
    [Name]             NVARCHAR (50) NOT NULL,
    [MobileNumber]     NVARCHAR (14) NOT NULL,
    [RegistrationDate] DATE          NOT NULL,
    [SecurityQuestion] NVARCHAR (50) NOT NULL,
    [SecurityAnswer]   NVARCHAR (50) NOT NULL,
    [AppID]            INT           NULL,
    [ClientID]         INT           NULL,
    [CreatedBy]        INT           NULL,
    [CreatedDate]      DATETIME      NULL,
    [UpdatedBy]        INT           NULL,
    [UpdatedDate]      DATETIME      NULL,
    [DeletedStatus]    SMALLINT      NULL,
    FOREIGN KEY ([ClientID]) REFERENCES [NDTUAT].[CompanyDetails] ([ClientId]) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY ([UserId]) REFERENCES [NDTUAT].[Users] ([UserId]) ON DELETE NO ACTION ON UPDATE NO ACTION
);

