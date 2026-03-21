-- Q1: List all customers from Mumbai along with their total order value
SELECT c.customer_id, SUM(oi.units_sold * p.unit_price) AS total_value
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Stores s ON o.store_id = s.store_id
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
WHERE s.store_city = 'Mumbai'
GROUP BY c.customer_id;

-- Q2: Find the top 3 products by total quantity sold
SELECT p.product_name, SUM(oi.units_sold) AS total_quantity
FROM Products p
JOIN Order_Items oi ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_quantity DESC
LIMIT 3;

-- Q3: List all sales representatives and number of unique customers handled
SELECT r.rep_name, COUNT(DISTINCT o.customer_id) AS customer_count
FROM Sales_Reps r
LEFT JOIN Orders o ON r.rep_id = o.rep_id
GROUP BY r.rep_name;

-- Q4: Orders where total value > 10000
SELECT o.order_id, SUM(oi.units_sold * p.unit_price) AS total_value
FROM Orders o
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
GROUP BY o.order_id
HAVING total_value > 10000
ORDER BY total_value DESC;

-- Q5: Products never ordered
SELECT p.product_name
FROM Products p
LEFT JOIN Order_Items oi ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;
