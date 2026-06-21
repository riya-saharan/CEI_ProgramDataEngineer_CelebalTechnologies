SELECT Category,
       SUM(Sales) AS Total_Sales
FROM `sample - superstore`
GROUP BY Category
ORDER BY Total_Sales DESC;