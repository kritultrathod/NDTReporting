CREATE TABLE [NDTUAT].[tsuLastTestResult] (
    [suite]        NVARCHAR (255) NULL,
    [success]      BIT            NULL,
    [testCount]    INT            NULL,
    [failureCount] INT            NULL,
    [errorCount]   INT            NULL,
    [startTime]    DATETIME       NULL,
    [stopTime]     DATETIME       NULL
);

