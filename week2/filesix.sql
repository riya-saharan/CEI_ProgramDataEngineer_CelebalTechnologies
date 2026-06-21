SELECT Region,
       SUM(Profit) AS Total_Profit
FROM `sample - superstore`
GROUP BY Region
ORDER BY Total_Profit DESC;