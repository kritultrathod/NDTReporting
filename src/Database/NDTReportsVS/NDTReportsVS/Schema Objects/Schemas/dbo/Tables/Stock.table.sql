CREATE TABLE [dbo].[Stock] (
    [StockId]         BIGINT          IDENTITY (1, 1) NOT NULL,
    [PortfolioId]     BIGINT          NOT NULL,
    [Price]           DECIMAL (18, 2) NOT NULL,
    [TransactionType] TINYINT         NOT NULL,
    [Units]           BIGINT          NOT NULL,
    [TransactionDate] DATETIME        NOT NULL,
    [CreatedBy]       INT             NOT NULL,
    [CreatedOn]       DATETIME        NOT NULL,
    [DeletedStatus]   BIT             NOT NULL
);

