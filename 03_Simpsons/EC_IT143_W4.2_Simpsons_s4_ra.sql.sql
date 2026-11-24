USE Simpsons;
GO

/*
View Name: vw_Simpsons_TransactionsPerMerchant

Purpose:
Count the number of transactions
associated with each merchant.

Source Table:
FBS_Viza_Costmo
*/

CREATE VIEW dbo.vw_Simpsons_TransactionsPerMerchant
AS

SELECT
    Description AS Merchant,
    COUNT(*) AS NumberOfTransactions

FROM dbo.FBS_Viza_Costmo

GROUP BY
    Description;
GO

USE Simpsons;
GO

SELECT *
FROM dbo.vw_Simpsons_TransactionsPerMerchant
ORDER BY Merchant;