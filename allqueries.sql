-- Assignment: Subqueries, CTEs & Window Functions
-- Dataset: Sample Superstore
USE superstore_db;
-- Query 1: Customers with Above Average Sales
-- (Subquery)

SELECT `Customer ID`,
       SUM(Sales) AS Total_Sales
FROM `sample - superstore`
GROUP BY `Customer ID`
HAVING SUM(Sales) >
(
    SELECT AVG(customer_sales)
    FROM
    (
        SELECT SUM(Sales) AS customer_sales
        FROM `sample - superstore`
        GROUP BY `Customer ID`
    ) x
);


-- Query 2: Highest Sales Order Per Customer
-- (Correlated Subquery)


SELECT *
FROM `sample - superstore` s
WHERE Sales =
(
    SELECT MAX(Sales)
    FROM `sample - superstore`
    WHERE `Customer ID` = s.`Customer ID`
);


-- Query 3: Total Sales Per Customer
-- (CTE)


WITH CustomerSales AS
(
    SELECT `Customer ID`,
           `Customer Name`,
           SUM(Sales) AS Total_Sales
    FROM `sample - superstore`
    GROUP BY `Customer ID`,
             `Customer Name`
)
SELECT *
FROM CustomerSales
ORDER BY Total_Sales DESC;


-- Query 4: Customer Ranking by Sales
-- (Window Function - RANK)


WITH CustomerSales AS
(
    SELECT `Customer ID`,
           `Customer Name`,
           SUM(Sales) AS Total_Sales
    FROM `sample - superstore`
    GROUP BY `Customer ID`,
             `Customer Name`
)
SELECT *,
       RANK() OVER (ORDER BY Total_Sales DESC) AS Sales_Rank
FROM CustomerSales;


-- Query 5: ROW_NUMBER per Customer
-- (Window Function)


SELECT `Customer ID`,
       `Order ID`,
       Sales,
       ROW_NUMBER() OVER
       (
           PARTITION BY `Customer ID`
           ORDER BY Sales DESC
       ) AS Row_Num
FROM `sample - superstore`;


-- Query 6: Top 10 Customers by Sales
-- (CTE)


WITH CustomerSales AS
(
    SELECT `Customer ID`,
           `Customer Name`,
           SUM(Sales) AS Total_Sales
    FROM `sample - superstore`
    GROUP BY `Customer ID`,
             `Customer Name`
)
SELECT *
FROM CustomerSales
ORDER BY Total_Sales DESC
LIMIT 10;


-- Query 7: Single Order Customers

SELECT `Customer ID`,
       COUNT(`Order ID`) AS Order_Count
FROM `sample - superstore`
GROUP BY `Customer ID`
HAVING COUNT(`Order ID`) = 1;


-- Query 8: Final Combined Query
-- (CTE + Window Function)


WITH CustomerSales AS
(
    SELECT `Customer ID`,
           `Customer Name`,
           SUM(Sales) AS Total_Sales
    FROM `sample - superstore`
    GROUP BY `Customer ID`,
             `Customer Name`
)
SELECT *,
       RANK() OVER (ORDER BY Total_Sales DESC) AS Customer_Rank
FROM CustomerSales;


-- Query 9: Regional Sales Analysis


SELECT Region,
       SUM(Sales) AS Total_Sales
FROM `sample - superstore`
GROUP BY Region
ORDER BY Total_Sales DESC;


-- Query 10: Category Wise Sales

SELECT Category,
       SUM(Sales) AS Total_Sales
FROM `sample - superstore`
GROUP BY Category
ORDER BY Total_Sales DESC;