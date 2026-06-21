SELECT SUM(Sales) AS Total_Sales
FROM `sample - superstore`;

SELECT Region,
       SUM(Sales) AS Total_Sales
FROM `sample - superstore`
GROUP BY Region
ORDER BY Total_Sales DESC;

SELECT Category,
       SUM(Sales) AS Total_Sales
FROM `sample - superstore`
GROUP BY Category
ORDER BY Total_Sales DESC;

SELECT `Product Name`,
       SUM(Sales) AS Total_Sales
FROM `sample - superstore`
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 10;