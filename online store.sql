-- Drop tables if they exist
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

-- Create customerss table
CREATE TABLE customerss (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(50),
    email VARCHAR(50)
);

-- Create productess table
CREATE TABLE productess (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(50),
    price NUMERIC(10,2)
);

-- Create ordersses table
CREATE TABLE ordersses (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    product_id INT REFERENCES products(product_id),
    quantity INT,
    order_date DATE
);



-- Insert customers
INSERT INTO customerss (customer_name, email)
VALUES
('Shiva', 'shiva@example.com'),
('Sumedha', 'sumedha@example.com'),
('Ravi', 'ravi@example.com'),
('Anil', 'anil@example.com');

-- Insert products
INSERT INTO productess (product_name, price)
VALUES
('Book', 150.00),
('Pen', 10.00),
('Notebook', 50.00),
('Eraser', 5.00);

-- Insert orders
INSERT INTO ordersses (customer_id, product_id, quantity, order_date)
VALUES
(1, 1, 2,'2025-10-19'),  -- Shiva buys Boo



SELECT o.order_id, c.customer_name, p.product_name, o.quantity, p.price, o.order_date
FROM ordersses o
JOIN customerss c ON o.customer_id = c.customer_id
JOIN productess p ON o.product_id = p.product_id;



SELECT o.order_id, c.customer_name, p.product_name, o.quantity
FROM ordersses o
JOIN customerss c ON o.customer_id = c.customer_id
JOIN productess p ON o.product_id = p.product_id
WHERE o.quantity > 3;

UPDATE ordersses
SET quantity = 10
WHERE order_id = 1;

-- Verify update
SELECT * FROM ordersses WHERE order_id = 1;

DELETE FROM ordersses
WHERE order_id = 3;

-- Verify delete
SELECT * FROM ordersses;

SELECT * FROM customerss;SELECT * FROM productess;
SELECT * FROM ordersses;
SELECT * FROM ordersses WHERE order_id = 1;


