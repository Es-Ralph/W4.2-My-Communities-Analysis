USE Simpsons;
GO

/*
Stored Procedure:
usp_Load_Simpsons_TransactionsPerMerchant

Purpose:
Refresh the merchant transaction table
using the latest data from the view.
*/

CREATE PROCEDURE dbo.usp_Load_Simpsons_TransactionsPerMerchant
AS
BEGIN
    SET NOCOUNT ON;

    TRUNCATE TABLE dbo.tbl_Simpsons_TransactionsPerMerchant;

    INSERT INTO dbo.tbl_Simpsons_TransactionsPerMerchant
    (
        Merchant,
        NumberOfTransactions
    )
    SELECT
        Merchant,
        NumberOfTransactions
    FROM dbo.vw_Simpsons_TransactionsPerMerchant;
END;
GO