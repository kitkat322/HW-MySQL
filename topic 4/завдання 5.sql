-- Використовуючи JOIN's та ShopDB отримати імена покупців та імена співробітників у яких TotalPrice товару більше 1000.

USE ShopDB;

SELECT c.FName, c.LName, e.FName, e.LName, SUM(od.TotalPrice) FROM Employees AS e
	JOIN Orders AS o
		ON o.EmployeeID = e.EmployeeID
	JOIN Customers AS c
		ON c.CustomerNo = o.CustomerNo
	JOIN OrderDetails AS od
		ON o.OrderID = od.OrderID
    GROUP BY c.FName, c.LName, e.FName, e.LName
	HAVING SUM(od.TotalPrice) > 1000;