USE Simpsons;
GO

/*
Purpose:
Add a unique primary key to the merchant transaction table.
*/

ALTER TABLE dbo.tbl_Simpsons_TransactionsPerMerchant
ADD MerchantID INT IDENTITY(1,1) NOT NULL;
GO

ALTER TABLE dbo.tbl_Simpsons_TransactionsPerMerchant
ADD CONSTRAINT PK_Simpsons_TransactionsPerMerchant
PRIMARY KEY (MerchantID);
GO

SELECT *
FROM dbo.tbl_Simpsons_TransactionsPerMerchant
ORDER BY MerchantID;
GO