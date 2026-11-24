USE EC_IT143_DA;
GO

IF OBJECT_ID('dbo.tbl_hello_world', 'U') IS NOT NULL
    DROP TABLE dbo.tbl_hello_world;
GO

SELECT
    HelloMessage
INTO dbo.tbl_hello_world
FROM dbo.vw_hello_world;
GO

SELECT *
FROM dbo.tbl_hello_world;