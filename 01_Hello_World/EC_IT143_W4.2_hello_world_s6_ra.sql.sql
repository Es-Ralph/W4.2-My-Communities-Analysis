USE EC_IT143_DA;
GO

TRUNCATE TABLE dbo.tbl_hello_world;
GO

INSERT INTO dbo.tbl_hello_world
(
    HelloMessage
)
SELECT
    HelloMessage
FROM dbo.vw_hello_world;
GO

SELECT *
FROM dbo.tbl_hello_world;