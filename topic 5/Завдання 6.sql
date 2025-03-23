USE shopdb;

-- Завдання 6
-- Використовуючи вкладені запити та ShopDB отримати імена покупців та імена співробітників у яких TotalPrice товару більше 1000.

SELECT 
		(SELECT FName 
         FROM customers 
	     WHERE CustomerNo = (SELECT CustomerNo 
							 FROM orders
							 WHERE orders.OrderID = orderdetails.OrderID)) AS FNC,
        (SELECT LName 
         FROM customers 
	     WHERE CustomerNo = (SELECT CustomerNo 
							 FROM orders
							 WHERE orders.OrderID = orderdetails.OrderID)) AS LNC,
        
        (SELECT FName 
         FROM employees 
	     WHERE EmployeeID = (SELECT EmployeeID 
							 FROM orders
							 WHERE orders.OrderID = orderdetails.OrderID)) AS FNE,
        (SELECT LName 
         FROM employees 
	     WHERE EmployeeID = (SELECT EmployeeID 
							 FROM orders
							 WHERE orders.OrderID = orderdetails.OrderID)) AS LNE,
        SUM(TotalPrice)
FROM orderdetails

WHERE (SELECT SUM(TotalPrice) 
	   FROM orderdetails AS od 
	   WHERE od.OrderID = orderdetails.OrderID) > 1000

GROUP BY orderdetails.OrderID;
