USE EC_IT143_DA;
GO

EXEC dbo.usp_load_hello_world;
GO

SELECT *
FROM dbo.tbl_hello_world;