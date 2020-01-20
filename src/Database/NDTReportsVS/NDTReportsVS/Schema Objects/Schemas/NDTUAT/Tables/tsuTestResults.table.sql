CREATE TABLE [NDTUAT].[tsuTestResults] (
    [testResultID] INT            IDENTITY (1, 1) NOT NULL,
    [startTime]    DATETIME       NOT NULL,
    [stopTime]     DATETIME       NULL,
    [runs]         INT            NOT NULL,
    [testName]     NVARCHAR (255) NOT NULL
);

