CREATE TABLE [dbo].[Portfolio] (
    [PortfolioID]   BIGINT          IDENTITY (1, 1) NOT NULL,
    [CompanyCode]   VARCHAR (8)     NOT NULL,
    [CompanyName]   VARCHAR (500)   NULL,
    [PE]            DECIMAL (18, 2) NULL,
    [Facevalue]     DECIMAL (18, 2) NOT NULL,
    [Offerprice]    MONEY           NOT NULL,
    [OfferpriceOn]  DATETIME        NOT NULL,
    [CreatedBy]     INT             NOT NULL,
    [CreatedOn]     DATETIME        NOT NULL,
    [DeletedStatus] BIT             NOT NULL
);

