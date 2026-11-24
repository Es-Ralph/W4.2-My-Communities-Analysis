USE MyFC;
GO

/*
View Name: vw_MyFC_PlayersPerPosition

Purpose:
This view counts the number of players
in each football position.

Source Tables:
tblPlayerDim
tblPositionDim
*/

CREATE VIEW dbo.vw_MyFC_PlayersPerPosition
AS

SELECT
    pos.p_name AS Position,
    COUNT(DISTINCT pl.pl_id) AS NumberOfPlayers

FROM dbo.tblPlayerDim AS pl

INNER JOIN dbo.tblPositionDim AS pos
    ON pl.p_id = pos.p_id

GROUP BY
    pos.p_name;
GO

SELECT *
FROM dbo.vw_MyFC_PlayersPerPosition;