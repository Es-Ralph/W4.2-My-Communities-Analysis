USE EC_IT143_DA;
GO

ALTER TABLE dbo.tbl_hello_world
ADD HelloID INT IDENTITY(1,1) NOT NULL;
GO

ALTER TABLE dbo.tbl_hello_world
ADD CONSTRAINT PK_hello_world
PRIMARY KEY (HelloID);
GO

SELECT *
FROM dbo.tbl_hello_world;