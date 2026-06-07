//Explore the data
-- View first 5 rows
SELECT *
FROM `sample - superstore`
LIMIT 5;

-- Count total records
SELECT COUNT(*) AS Total_Records
FROM `sample - superstore`;

//Sales by Region
SELECT Region,
       SUM(Sales) AS Total_Sales
FROM `sample - superstore`
GROUP BY Region
ORDER BY Total_Sales DESC;

//Sales by Category
SELECT Category,
       SUM(Sales) AS Total_Sales
FROM `sample - superstore`
GROUP BY Category
ORDER BY Total_Sales DESC;

//Top 10 Products by Sales
SELECT `Product Name`,
       SUM(Sales) AS Total_Sales
FROM `sample - superstore`
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 10;

//Top 10 Customers by Sales
SELECT `Customer Name`,
       SUM(Sales) AS Total_Sales
FROM `sample - superstore`
GROUP BY `Customer Name`
ORDER BY Total_Sales DESC
LIMIT 10;

//Monthly Sales Trend
SELECT YEAR(`Order Date`) AS Year,
       MONTH(`Order Date`) AS Month,
       SUM(Sales) AS Total_Sales
FROM `sample - superstore`
GROUP BY YEAR(`Order Date`),
         MONTH(`Order Date`)
ORDER BY Year, Month;

//Average Sales by Category
SELECT Category,
       AVG(Sales) AS Avg_Sales
FROM `sample - superstore`
GROUP BY Category;

//Duplicate Orders
SELECT `Order ID`,
       COUNT(*) AS Duplicate_Count
FROM `sample - superstore`
GROUP BY `Order ID`
HAVING COUNT(*) > 1;

//Data Quality check
SELECT COUNT(*) AS Missing_Sales
FROM `sample - superstore`
WHERE Sales IS NULL;

//Total Sales
SELECT SUM(Sales) AS Total_Sales
FROM `sample - superstore`;