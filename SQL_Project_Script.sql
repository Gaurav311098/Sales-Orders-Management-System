-- creating Databse 
create database SQL_Project_1;
use SQL_Project_1;

-- view all tables data
select * from customers;
select * from products;
select * from employees;
select * from order_items;
select * from Orders;
select * from Payments;

-- view tables datatypes and constraints
describe customers;
describe products;
describe employees;
describe order_items;
describe orders;
describe Payments;

-- Customer Insights
-- List all active customers
SELECT * FROM Customers WHERE status = 'Active';

-- List all inactive customers
SELECT * FROM Customers WHERE status = 'Inactive';

-- Top 10 cities by number of customers
SELECT city, COUNT(customer_id) AS total_customers
FROM Customers
GROUP BY city
ORDER BY total_customers DESC
LIMIT 10;

-- Top 5 customers by total spending
SELECT 
c.name AS customer_name,
SUM(oi.total_price) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
WHERE o.order_status NOT IN ('Cancelled', 'Returned')
GROUP BY c.customer_id
ORDER BY total_spent DESC
LIMIT 5;

-- Product Analysis
-- Available products with low stock (e.g., less than 20 units)
SELECT * FROM Products
WHERE status = 'Available' AND stock_quantity < 20;

-- Total products in each category
SELECT category, COUNT(Product_id) AS product_count
FROM Products
GROUP BY category;

-- Order Analysis
-- Total orders by status
SELECT order_status, COUNT(order_id) AS total_orders
FROM Orders
GROUP BY order_status;

-- Monthly order count
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month,COUNT(*) AS total_orders
FROM Orders
GROUP BY month
ORDER BY month;

-- Sales & Revenue Reports
-- Revenue per product (from Order_Items)
SELECT b.name AS product_name,SUM(a.total_price) AS revenue
FROM Order_Items a
JOIN Products b ON a.product_id = b.product_id
GROUP BY b.name
ORDER BY revenue DESC;

-- Total revenue and number of orders per month
SELECT 
DATE_FORMAT(o.order_date, '%Y-%m') AS month,
COUNT(DISTINCT o.order_id) AS total_orders,
SUM(oi.total_price) AS total_revenue
FROM Orders o
JOIN Order_Items oi ON o.order_id = oi.order_id
WHERE o.order_status NOT IN ('Cancelled', 'Returned')
GROUP BY month
ORDER BY month;

-- Employee Performance
-- Orders handled by each employee
SELECT 
e.name AS employee_name,
COUNT(o.order_id) AS total_orders
FROM Orders o
JOIN Employees e ON o.employee_id = e.employee_id
GROUP BY e.name
ORDER BY total_orders DESC;

-- Payment Reports
-- Payment status summary
SELECT payment_status, COUNT(payment_id) AS total_payments
FROM Payments
GROUP BY payment_status;

-- Revenue by payment method
SELECT payment_method, SUM(amount_paid) AS total_collected
FROM Payments
WHERE payment_status = 'Paid'
GROUP BY payment_method;