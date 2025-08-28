USE ROLE ice_cream_writer;

USE WAREHOUSE andres_wh;

USE SCHEMA ice_cream_db.public;
USE ROLE ice_cream_writer;
SELECT current_role();

-- Create a table for flavours
CREATE TABLE flavors (
    flavor_id INT AUTOINCREMENT,
    flavor_name STRING,
    price DECIMAL (5, 2),
    PRIMARY KEY (flavor_id) 
);

-- Create a table for customers
CREATE TABLE customers (
    customer_id INT AUTOINCREMENT,
    customer_name STRING,
    email STRING,
    PRIMARY KEY (customer_id)
);

-- Create a table for transactions
CREATE TABLE transactions (
    transaction_id INT AUTOINCREMENT,
    customer_id INT,
    flavor_id INT,
    quantity INT,
    transaction_date TIMESTAMP,
    PRIMARY KEY (transaction_id),
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
    FOREIGN KEY (flavor_id) REFERENCES flavors (flavor_id)
);


-- Step 5: Insert sample data
INSERT INTO flavors (flavor_name, price) VALUES
('Vanilla', 2.50),
('Chocolate', 2.75),
('Strawberry', 2.50),
('Mint Chocolate Chip', 3.00),
('Cookie Dough', 3.25);

INSERT INTO customers (customer_name, email) VALUES
('Andres Trujllo', 'andres.trujillo@example.com'),
('Miguel Gonzalez', 'Miguel.gonzalez@example.com'),
('Alice Johnson', 'alice.johnson@example.com');

INSERT INTO transactions (
    customer_id, flavor_id, quantity, transaction_date
) VALUES
(1, 1, 2, CURRENT_TIMESTAMP),
(2, 2, 1, CURRENT_TIMESTAMP),
(3, 3, 3, CURRENT_TIMESTAMP),
(1, 4, 1, CURRENT_TIMESTAMP),
(2, 5, 2, CURRENT_TIMESTAMP);

SELECT * FROM flavors;
SELECT * FROM customers;

USE ROLE ice_cream_reader;

SELECT CURRENT_SECONDARY_ROLES();
SELECT * FROM transactions;