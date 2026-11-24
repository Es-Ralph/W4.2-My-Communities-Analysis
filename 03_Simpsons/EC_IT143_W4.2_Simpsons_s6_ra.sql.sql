USE Simpsons;
GO

/*
Purpose:
Refresh the merchant transaction table
using the latest data from the view.
*/

TRUNCATE TABLE dbo.tbl_Simpsons_TransactionsPerMerchant;
GO

INSERT INTO dbo.tbl_Simpsons_TransactionsPerMerchant
(
    Merchant,
    NumberOfTransactions
)
SELECT
    Merchant,
    NumberOfTransactions
FROM dbo.vw_Simpsons_TransactionsPerMerchant;
GO

SELECT *
FROM dbo.tbl_Simpsons_TransactionsPerMerchant
ORDER BY MerchantID;
GO