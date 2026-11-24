USE MyFC;
GO

/*
Purpose:
Improve the MyFC players-per-position table
by adding a primary key.

PositionID uniquely identifies each record.
*/

ALTER TABLE dbo.tbl_MyFC_PlayersPerPosition
ADD PositionID INT IDENTITY(1,1) NOT NULL;
GO

ALTER TABLE dbo.tbl_MyFC_PlayersPerPosition
ADD CONSTRAINT PK_MyFC_PlayersPerPosition
PRIMARY KEY (PositionID);
GO

SELECT *
FROM dbo.tbl_MyFC_PlayersPerPosition;