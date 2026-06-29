CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100),
    phone BIGINT,
    city VARCHAR(50),
    country VARCHAR(50)
);

ALTER TABLE customers
ALTER COLUMN country TYPE VARCHAR(255);


SELECT *
FROM Customers;


CREATE TABLE BOOKS(
book_id INT PRIMARY KEY,
title VARCHAR(200),
Author VARCHAR(100),
Genre VARCHAR(50),
published_year INT,
price FLOAT,
Stock INT
);

CREATE TABLE ORDERS(
order_id INT PRIMARY KEY,
Customer_id INT,
book_id INT,
order_date DATE,
quantity INT,
Total_Amount NUMERIC(10,2),



CONSTRAINT fk_customer
FOREIGN KEY (customer_id) REFERENCES customers(customer_id),

CONSTRAINT fk_book
FOREIGN KEY (book_id) REFERENCES books(book_id)
);