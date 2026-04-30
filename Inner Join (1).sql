use sis04t25;
-- 1. Produto, fornecedor e país (categoria 2)
SELECT p.ProductName, s.SupplierName, s.Country
FROM Products p
INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID
WHERE p.CategoryID = 2;

-- 2. Pedido, data e transportadora
SELECT o.OrderID, o.OrderDate, s.ShipperName
FROM Orders o
INNER JOIN Shippers s ON o.ShipperID = s.ShipperID;

-- 3. Produto e cidade do fornecedor (preço > 50)
SELECT p.ProductName, s.City
FROM Products p
INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID
WHERE p.Price > 50;

-- 4. Pedidos com transportadora Speedy Express
SELECT o.OrderID, s.ShipperName
FROM Orders o
INNER JOIN Shippers s ON o.ShipperID = s.ShipperID
WHERE s.ShipperName = 'Speedy Express';

-- 5. Produtos e fornecedores do Brazil ou USA
SELECT p.ProductName, s.SupplierName
FROM Products p
INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID
WHERE s.Country IN ('Brazil', 'USA');

-- 6. Pedidos de 2023 com telefone da transportadora
SELECT o.OrderID, o.OrderDate, s.Phone
FROM Orders o
INNER JOIN Shippers s ON o.ShipperID = s.ShipperID
WHERE YEAR(o.OrderDate) = 2023;

-- 7. Produtos com preço entre 10 e 20
SELECT s.SupplierName, p.ProductName
FROM Products p
INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID
WHERE p.Price BETWEEN 10 AND 20;

-- 8. Pedidos ordenados por transportadora
SELECT o.OrderID, s.ShipperName
FROM Orders o
INNER JOIN Shippers s ON o.ShipperID = s.ShipperID
ORDER BY s.ShipperName ASC;

-- 9. Todos fornecedores e seus produtos (LEFT)
SELECT s.SupplierName, p.ProductName
FROM Suppliers s
LEFT JOIN Products p ON s.SupplierID = p.SupplierID;

-- 10. Transportadoras e quantidade de pedidos
SELECT s.ShipperName, COUNT(o.OrderID) AS TotalPedidos
FROM Shippers s
LEFT JOIN Orders o ON s.ShipperID = o.ShipperID
GROUP BY s.ShipperName;

-- 11. Produtos e fornecedores (RIGHT)
SELECT p.ProductName, s.SupplierName
FROM Products p
RIGHT JOIN Suppliers s ON p.SupplierID = s.SupplierID;

-- 12. Fornecedores da Alemanha e seus produtos
SELECT s.SupplierName, p.ProductName
FROM Suppliers s
LEFT JOIN Products p ON s.SupplierID = p.SupplierID
WHERE s.Country = 'Germany';

-- 13. Transportadoras e pedidos (RIGHT)
SELECT s.ShipperName, o.OrderID
FROM Orders o
RIGHT JOIN Shippers s ON o.ShipperID = s.ShipperID;

-- 14. Produto, fornecedor e transportadora (pedido 10248)
SELECT p.ProductName, sup.SupplierName, sh.ShipperName
FROM Orders o
INNER JOIN OrderDetails od ON o.OrderID = od.OrderID
INNER JOIN Products p ON od.ProductID = p.ProductID
INNER JOIN Suppliers sup ON p.SupplierID = sup.SupplierID
INNER JOIN Shippers sh ON o.ShipperID = sh.ShipperID
WHERE o.OrderID = 10248;

-- 15. Fornecedor, cidade e data (United Package)
SELECT sup.SupplierName, sup.City, o.OrderDate
FROM Orders o
INNER JOIN OrderDetails od ON o.OrderID = od.OrderID
INNER JOIN Products p ON od.ProductID = p.ProductID
INNER JOIN Suppliers sup ON p.SupplierID = sup.SupplierID
INNER JOIN Shippers sh ON o.ShipperID = sh.ShipperID
WHERE sh.ShipperName = 'United Package';

-- 16. Fornecedores com produtos nunca pedidos
SELECT sup.SupplierName
FROM Suppliers sup
INNER JOIN Products p ON sup.SupplierID = p.SupplierID
LEFT JOIN OrderDetails od ON p.ProductID = od.ProductID
WHERE od.OrderID IS NULL;

-- 17. Contato e produto (categorias 1,3,5 e UK)
SELECT sup.ContactName, p.ProductName
FROM Products p
INNER JOIN Suppliers sup ON p.SupplierID = sup.SupplierID
WHERE p.CategoryID IN (1, 3, 5)
AND sup.Country = 'UK';

-- 18. Total de pedidos por fornecedor
SELECT sup.SupplierName, COUNT(DISTINCT o.OrderID) AS TotalPedidos
FROM Suppliers sup
INNER JOIN Products p ON sup.SupplierID = p.SupplierID
INNER JOIN OrderDetails od ON p.ProductID = od.ProductID
INNER JOIN Orders o ON od.OrderID = o.OrderID
GROUP BY sup.SupplierName;

-- 19. Produtos acima da média
SELECT p.ProductName, c.CategoryName, s.SupplierName
FROM Products p
INNER JOIN Categories c ON p.CategoryID = c.CategoryID
INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID
WHERE p.Price > (SELECT AVG(Price) FROM Products);

-- 20. Desafio final: pedidos + fornecedor + transportadora
SELECT o.OrderID, sup.SupplierName, sh.ShipperName
FROM Orders o
INNER JOIN OrderDetails od ON o.OrderID = od.OrderID
INNER JOIN Products p ON od.ProductID = p.ProductID
INNER JOIN Suppliers sup ON p.SupplierID = sup.SupplierID
INNER JOIN Shippers sh ON o.ShipperID = sh.ShipperID;

