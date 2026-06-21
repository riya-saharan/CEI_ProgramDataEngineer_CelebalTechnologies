SELECT YEAR(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS Year,
       MONTH(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS Month,
       SUM(Sales) AS Total_Sales
FROM `sample - superstore`
GROUP BY Year, Month
ORDER BY Year, Month;