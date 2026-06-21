SELECT Region,
       SUM(Sales) AS Total_Sales
FROM `sample - superstore`
GROUP BY Region
ORDER BY Total_Sales DESC;