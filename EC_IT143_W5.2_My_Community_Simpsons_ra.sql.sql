USE Simpsons;
GO

SELECT DB_NAME() AS CurrentDatabase;
GO


/********************************************************************************
NAME:    EC_IT143_W5.2_My_Community_Simpsons_RA

PURPOSE:
Answer four business questions using the Simpsons community database.

MODIFICATION LOG:
Ver      Date        Author                    Description
-----    ----------  ------------------------  --------------------------------
1.0      11/27/2026  Rapheal Akwasi Agyapong   Created script to answer four
                                               Simpsons business questions.

RUNTIME:
Record the actual execution time shown by SSMS.

NOTES:
This script answers four business questions selected from the
My Communities Analysis assignment.
Each question includes its original author and a SQL query
that addresses the stakeholder's information needs.

********************************************************************************/

USE Simpsons;
GO

USE Simpsons;
GO

SELECT DB_NAME() AS CurrentDatabase;
GO


/********************************************************************************
NAME:    EC_IT143_W5.2_My_Community_Simpsons_RA

PURPOSE:
Answer four business and financial analysis questions using
the Simpsons community database.

MODIFICATION LOG:
Ver      Date        Author                    Description
-----    ----------  ------------------------  --------------------------------
1.0      11/27/2026  Rapheal Akwasi Agyapong   Created script to answer four
                                               Simpsons business questions.

RUNTIME:
Record the actual execution time shown by SSMS.

NOTES:
This script answers four business questions selected for the
My Communities Analysis assignment.
Each question includes its original author and a SQL query
that addresses the stakeholder's information needs.

********************************************************************************/

USE Simpsons;
GO


/*========================================================
 Q1: BUSINESS USER QUESTION

 Original Author: Rapheal Akwasi Agyapong

 Stakeholder: Family budget coordinator who monitors
 household spending.

 Question:
 Which merchants receive the largest total debit payments,
 and how many transactions does each merchant receive?

 A1:
 This query groups debit transactions by merchant and
 calculates the total payments and number of transactions.
========================================================*/

SELECT
    Description AS Merchant,
    SUM(Debit) AS Total_Debit_Payments,
    COUNT(*) AS Transaction_Count
FROM FBS_Viza_Costmo
WHERE Debit IS NOT NULL
GROUP BY
    Description
ORDER BY
    Total_Debit_Payments DESC;
GO


/*========================================================
 Q2: BUSINESS USER QUESTION

 Original Author: Rapheal Akwasi Agyapong

 Stakeholder: Family financial planner interested in
 spending by family member and department.

 Question:
 Which family members have the highest total debit
 spending, and what departments do they belong to?

 A2:
 This query joins the transaction table with Family_Data
 to calculate debit spending for each family member
 and display their employment department.
========================================================*/

SELECT
    fd.Name AS Family_Member,
    fd.Department,
    SUM(fc.Debit) AS Total_Debit_Spending
FROM FBS_Viza_Costmo AS fc
INNER JOIN Family_Data AS fd
    ON fc.Member_Name = fd.Name
WHERE
    fc.Debit IS NOT NULL
GROUP BY
    fd.Name,
    fd.Department
ORDER BY
    Total_Debit_Spending DESC;
GO


/*========================================================
 Q3: BUSINESS USER QUESTION

 Original Author: Rapheal Akwasi Agyapong

 Stakeholder: Household budget coordinator who reviews
 spending categories.

 Question:
 Which spending categories account for the highest total
 expenses for each card member?

 A3:
 This query groups Planet_Express transactions by card
 member and spending category to calculate total expenses.
========================================================*/

SELECT
    Card_Member,
    Category,
    SUM(Amount) AS Total_Expenses
FROM Planet_Express
GROUP BY
    Card_Member,
    Category
ORDER BY
    Card_Member,
    Total_Expenses DESC;
GO


/*========================================================
 Q4: BUSINESS USER QUESTION

 Original Author: Bandha Elijah.

 Stakeholder: Family financial planner responsible for
 comparing spending across employment departments.

 Question:
 Which employment departments have the highest total
 transaction expenses recorded in Planet_Express?

 A4:
 This query joins Planet_Express with Family_Data using
 the card member's name and calculates total expenses
 for each employment department.
========================================================*/

SELECT
    fd.Department,
    SUM(pe.Amount) AS Total_Department_Expenses,
    COUNT(*) AS Transaction_Count
FROM Planet_Express AS pe
INNER JOIN Family_Data AS fd
    ON pe.Card_Member = fd.Name
GROUP BY
    fd.Department
ORDER BY
    Total_Department_Expenses DESC;
GO