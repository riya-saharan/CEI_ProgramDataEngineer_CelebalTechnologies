SELECT Category,
       AVG(Sales) AS Avg_Sales
FROM `sample - superstore`
GROUP BY Category;