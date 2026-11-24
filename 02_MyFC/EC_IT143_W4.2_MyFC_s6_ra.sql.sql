USE MyFC;
GO

/*
Purpose:
Refresh the MyFC players-per-position table
using the latest results from the view.

TRUNCATE removes existing records.
INSERT loads new records from the view.
*/

TRUNCATE TABLE dbo.tbl_MyFC_PlayersPerPosition;
GO

INSERT INTO dbo.tbl_MyFC_PlayersPerPosition
(
    Position,
    NumberOfPlayers
)
SELECT
    Position,
    NumberOfPlayers
FROM dbo.vw_MyFC_PlayersPerPosition;
GO

-- Display the refreshed table.
SELECT *
FROM dbo.tbl_MyFC_PlayersPerPosition;
GO