USE MyFC;
GO

/*
Purpose:
Execute the stored procedure to refresh
the MyFC players-per-position table.
*/

EXEC dbo.usp_Load_MyFC_PlayersPerPosition;
GO

-- Display the final results.
SELECT *
FROM dbo.tbl_MyFC_PlayersPerPosition;
GO