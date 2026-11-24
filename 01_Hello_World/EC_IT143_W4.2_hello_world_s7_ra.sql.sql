USE EC_IT143_DA;
GO

CREATE PROCEDURE dbo.usp_load_hello_world
AS
BEGIN

    SET NOCOUNT ON;

    TRUNCATE TABLE dbo.tbl_hello_world;

    INSERT INTO dbo.tbl_hello_world
    (
        HelloMessage
    )
    SELECT
        HelloMessage
    FROM dbo.vw_hello_world;

END;
GO