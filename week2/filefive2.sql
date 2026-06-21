SELECT Segment,
       CASE
           WHEN AVG(Sales) > 500 THEN 'High Value'
           WHEN AVG(Sales) > 200 THEN 'Medium Value'
           ELSE 'Low Value'
       END AS Customer_Type
FROM `sample - superstore`
GROUP BY Segment;