USE Northwind
--1
SELECT COUNT (*) As Pedidos_Realizados From Orders
--2
SELECT FirstName From Employees WHERE Title like 'Sales Representative'
--3
SELECT c.CategoryName, SUM(od.UnitPrice * od.Quantity) AS TotalVentas FROM Products p INNER JOIN Categories c ON p.CategoryID = c.CategoryID INNER JOIN [Order Details] od ON p.ProductID = od.ProductID GROUP BY c.CategoryName;
--5
SELECT TOP 5 p.ProductName, SUM(od.Quantity) AS UnidadesVendidas FROM Products p INNER JOIN [Order Details] od ON p.ProductID = od.ProductID GROUP BY p.ProductName ORDER BY SUM(od.Quantity) DESC;
--6
SELECT c.Country, COUNT(*) AS TotalPedidos FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID GROUP BY c.Country ORDER BY TotalPedidos DESC;
--7
SELECT AVG(Quantity) AS Promedio_Unidades_Vendidas_Por_Pedido FROM [Order Details];
--8
SELECT * FROM Products WHERE ProductName LIKE '%chocolate%';
--9
SELECT FirstName FROM Employees WHERE BirthDate > '1960-01-01';
--10
SELECT p.ProductName, p.UnitPrice, s.CompanyName AS SupplierName FROM Products p INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID;



