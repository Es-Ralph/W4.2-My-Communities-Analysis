USE Simpsons;
GO

/*
Purpose:
Count the number of transactions
made at each merchant.

Source:
FBS_Viza_Costmo
*/

SELECT
    Description AS Merchant,
    COUNT(*) AS NumberOfTransactions

FROM dbo.FBS_Viza_Costmo

GROUP BY
    Description

ORDER BY
    Description;
GO