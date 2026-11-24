USE Simpsons;
GO

/*
Purpose:
Execute the stored procedure to refresh
the Simpsons merchant transaction table.
*/

EXEC dbo.usp_Load_Simpsons_TransactionsPerMerchant;
GO

SELECT *
FROM dbo.tbl_Simpsons_TransactionsPerMerchant
ORDER BY MerchantID;
GO