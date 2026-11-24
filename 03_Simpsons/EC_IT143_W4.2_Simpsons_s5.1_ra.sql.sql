USE Simpsons;
GO

/*
Purpose:
Create a physical table using the merchant transaction counts
from the view.
*/

IF OBJECT_ID('dbo.tbl_Simpsons_TransactionsPerMerchant', 'U') IS NOT NULL
    DROP TABLE dbo.tbl_Simpsons_TransactionsPerMerchant;
GO

SELECT
    Merchant,
    NumberOfTransactions
INTO dbo.tbl_Simpsons_TransactionsPerMerchant
FROM dbo.vw_Simpsons_TransactionsPerMerchant;
GO

SELECT *
FROM dbo.tbl_Simpsons_TransactionsPerMerchant
ORDER BY Merchant;
GO