USE MyFC;
GO

/*
Purpose:
Create a physical table using the results
from vw_MyFC_PlayersPerPosition.
*/

IF OBJECT_ID('dbo.tbl_MyFC_PlayersPerPosition', 'U') IS NOT NULL
    DROP TABLE dbo.tbl_MyFC_PlayersPerPosition;
GO

SELECT
    Position,
    NumberOfPlayers

INTO dbo.tbl_MyFC_PlayersPerPosition

FROM dbo.vw_MyFC_PlayersPerPosition;
GO

SELECT *
FROM dbo.tbl_MyFC_PlayersPerPosition;