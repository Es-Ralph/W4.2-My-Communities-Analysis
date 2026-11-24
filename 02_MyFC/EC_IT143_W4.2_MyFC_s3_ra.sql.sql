USE MyFC;
GO

SELECT
    pos.p_name AS Position,
    COUNT(DISTINCT pl.pl_id) AS NumberOfPlayers

FROM dbo.tblPlayerDim AS pl

INNER JOIN dbo.tblPositionDim AS pos
    ON pl.p_id = pos.p_id

GROUP BY
    pos.p_name

ORDER BY
    pos.p_name;