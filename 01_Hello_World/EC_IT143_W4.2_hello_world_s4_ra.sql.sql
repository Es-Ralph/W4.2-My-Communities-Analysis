USE EC_IT143_DA;
GO

CREATE VIEW dbo.vw_hello_world
AS
SELECT
    'Hello World!' AS HelloMessage;
GO

SELECT *
FROM dbo.vw_hello_world;