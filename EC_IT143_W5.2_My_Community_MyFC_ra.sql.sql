USE MyFC;
GO

SELECT DB_NAME() AS CurrentDatabase;
GO


/********************************************************************************
NAME:    EC_IT143_W5.2_My_Community_MyFC_RA

PURPOSE:
Answer four business questions using the MyFC community database.

MODIFICATION LOG:
Ver      Date        Author                    Description
-----    ----------  ------------------------  --------------------------------
1.0      11/27/2026  Rapheal Akwasi Agyapong   Created script to answer four
                                               MyFC business questions.

RUNTIME:
Record the actual execution time shown by SSMS.

NOTES:
This script answers four business questions selected from the
My Communities Analysis assignment.
Each question includes its original author and a SQL query
that addresses the stakeholder's information needs.

********************************************************************************/

USE MyFC;
GO

/*========================================================
 Q1: BUSINESS USER QUESTION

 Original Author: Rapheal Akwasi Agyapong

 Stakeholder: Head coach responsible for squad planning
 and player development.

 Question:
 Which teams have the highest number of players in each
 playing position? This would help team managers understand
 squad composition.

 A1:
 This query joins the player, team, and position tables
 to count the number of players in each position per team.
========================================================*/

SELECT
    t.t_code AS Team_Code,
    p.p_name AS Position_Name,
    COUNT(DISTINCT pl.pl_id) AS Player_Count
FROM tblPlayerDim AS pl
INNER JOIN tblTeamDim AS t
    ON pl.t_id = t.t_id
INNER JOIN tblPositionDim AS p
    ON pl.p_id = p.p_id
GROUP BY
    t.t_code,
    p.p_name
ORDER BY
    Player_Count DESC;
GO

/*========================================================
 Q2: BUSINESS USER QUESTION

 Original Author: Rapheal Akwasi Agyapong

 Stakeholder: Club finance manager responsible for
 reviewing player compensation.

 Question:
 Which playing positions have the highest average monthly
 salary, and how does the average differ across positions?

 A2:
 This query joins the salary, player, and position tables.
 It uses the latest reporting date to calculate the
 average monthly salary for each playing position.
========================================================*/

WITH LatestSalaryDate AS
(
    SELECT MAX(as_of_date) AS as_of_date
    FROM tblPlayerFact
)

SELECT
    pos.p_name AS Position_Name,
    AVG(CAST(pf.mtd_salary AS DECIMAL(18,2)))
        AS Average_Monthly_Salary
FROM tblPlayerFact AS pf
INNER JOIN tblPlayerDim AS pl
    ON pf.pl_id = pl.pl_id
INNER JOIN tblPositionDim AS pos
    ON pl.p_id = pos.p_id
INNER JOIN LatestSalaryDate AS ld
    ON pf.as_of_date = ld.as_of_date
GROUP BY
    pos.p_name
ORDER BY
    Average_Monthly_Salary DESC;
GO

/*========================================================
 Q3: BUSINESS USER QUESTION

 Original Author: Rapheal Akwasi Agyapong

 Stakeholder: General manager responsible for monitoring
 team operating costs.

 Question:
 Which teams have the highest total monthly player salary,
 and how many players contribute to each total?

 A3:
 This query calculates the total monthly player salary
 and the number of players for each team. It uses the
 latest salary reporting date to avoid double-counting.
========================================================*/

WITH LatestSalaryDate AS
(
    SELECT MAX(as_of_date) AS as_of_date
    FROM tblPlayerFact
)

SELECT
    t.t_code AS Team_Code,
    SUM(pf.mtd_salary) AS Total_Monthly_Salary,
    COUNT(DISTINCT pl.pl_id) AS Player_Count
FROM tblPlayerFact AS pf
INNER JOIN tblPlayerDim AS pl
    ON pf.pl_id = pl.pl_id
INNER JOIN tblTeamDim AS t
    ON pl.t_id = t.t_id
INNER JOIN LatestSalaryDate AS ld
    ON pf.as_of_date = ld.as_of_date
GROUP BY
    t.t_code
ORDER BY
    Total_Monthly_Salary DESC;
GO

/*========================================================
 Q4: BUSINESS USER QUESTION

 Original Author: Bandha Elijah.

 Stakeholder: Football club manager responsible for
 player compensation and talent retention.

 Question:
 Which players earn the highest monthly salaries,
 and what teams and playing positions do they belong to?

 A4:
 This query joins the salary, player, team, and position
 tables to identify the highest-paid players using
 the latest available salary reporting date.
========================================================*/

WITH LatestSalaryDate AS
(
    SELECT MAX(as_of_date) AS as_of_date
    FROM tblPlayerFact
)

SELECT
    pl.pl_name AS Player_Name,
    t.t_code AS Team_Code,
    pos.p_name AS Position_Name,
    pf.mtd_salary AS Monthly_Salary
FROM tblPlayerFact AS pf
INNER JOIN tblPlayerDim AS pl
    ON pf.pl_id = pl.pl_id
INNER JOIN tblTeamDim AS t
    ON pl.t_id = t.t_id
INNER JOIN tblPositionDim AS pos
    ON pl.p_id = pos.p_id
INNER JOIN LatestSalaryDate AS ld
    ON pf.as_of_date = ld.as_of_date
ORDER BY
    pf.mtd_salary DESC;
GO