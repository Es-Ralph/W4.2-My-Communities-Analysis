USE MyFC;
GO

/*
Stored Procedure:
usp_Load_MyFC_PlayersPerPosition

Purpose:
Refresh the players-per-position table
using the latest results from the view.
*/

CREATE PROCEDURE dbo.usp_Load_MyFC_PlayersPerPosition
AS
BEGIN

    SET NOCOUNT ON;

    TRUNCATE TABLE dbo.tbl_MyFC_PlayersPerPosition;

    INSERT INTO dbo.tbl_MyFC_PlayersPerPosition
    (
        Position,
        NumberOfPlayers
    )
    SELECT
        Position,
        NumberOfPlayers
    FROM dbo.vw_MyFC_PlayersPerPosition;

END;
GO