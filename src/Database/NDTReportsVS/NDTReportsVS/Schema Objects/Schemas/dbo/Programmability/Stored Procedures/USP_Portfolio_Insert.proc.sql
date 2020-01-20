
CREATE PROCEDURE [dbo].[USP_Portfolio_Insert]
@PortfolioID       bigint,
@CompanyCode       varchar(8) = NULL,
@CompanyName       varchar(500) = NULL,
@PE                decimal = NULL,
@Facevalue         decimal = NULL,
@Offerprice        money = NULL,
@OfferpriceOn      datetime = NULL,
@CreatedBy         int = NULL,
@CreatedOn         datetime = NULL,
@DeletedStatus     bit = NULL
AS

 
INSERT INTO dbo.Portfolio
(CompanyCode,CompanyName,PE,Facevalue,Offerprice,OfferpriceOn,CreatedBy,CreatedOn,DeletedStatus)
SELECT @CompanyCode,@CompanyName,@PE,@Facevalue,@Offerprice,@OfferpriceOn,@CreatedBy,@CreatedOn,@DeletedStatus
 

