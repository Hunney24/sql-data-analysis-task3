SELECT 
    TABLE_NAME,
    COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'ecommerce_analytics'
ORDER BY TABLE_NAME, ORDINAL_POSITION;
-----
USE ecommerce_analytics;
SHOW COLUMNS FROM customers;

SELECT customer_id, name, country, age
FROM customers
WHERE age > 30
ORDER BY age DESC
LIMIT 10;

SELECT country, COUNT(*) AS customer_count
FROM customers
GROUP BY country
ORDER BY customer_count DESC;

SELECT AVG(age) AS average_age
FROM customers;

SHOW COLUMNS FROM orders;

SELECT 
    o.order_id,
    c.name,
    o.total_usd,
    o.country
FROM  orders o
INNER JOIN customers c
    ON o.customer_id = c.customer_id
LIMIT 10;

SELECT 
    c.customer_id,
    c.name,
    o.order_id
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
LIMIT 10;

SELECT order_id, customer_id, total_usd
FROM orders
WHERE total_usd > (SELECT AVG(total_usd) FROM orders)
LIMIT 10;

CREATE OR REPLACE VIEW order_summary AS
SELECT order_id, customer_id, total_usd, country
FROM orders;

SELECT * FROM order_summary
LIMIT 10;

CREATE INDEX idx_orders_customer
ON orders(customer_id);

SHOW INDEX FROM orders;
