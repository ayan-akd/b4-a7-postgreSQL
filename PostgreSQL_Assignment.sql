-- Active: 1742470189212@@127.0.0.1@5432@bookstore_db

--!  Database Setup
CREATE DATABASE bookstore_db; --* Creating the postgres database

--! Table and table data Creation
--* Creating books table 
CREATE TABLE books(
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) CHECK (price > 0),
    stock INT NOT NULL,
    published_year VARCHAR(4) NOT NULL
);

--* Inserting data into the books table
INSERT INTO books(title, author, price, stock, published_year)
VALUES
    ('The Pragmatic Programmer', 'Andrew Hunt', 40.00, 10, '1999'),
    ('Clean Code', 'Robert C. Martin', 35.00, 5, '2008'),
    ('You Don''t Know JS', 'Kyle Simpson', 30.00, 8, '2014'),
    ('Refactoring', 'Martin Fowler', 50.00, 3, '1999'),
    ('Database Design Principles', 'Jane Smith', 20.00, 0, '2018');

--* Creating customers table 
CREATE TABLE customers(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    joined_date DATE NOT NULL
)

--* Inserting data into the customers table
INSERT INTO customers(name, email, joined_date)
VALUES
    ('Alice', 'alice@email.com', '2023-01-10'),
    ('Bob', 'bob@email.com', '2022-05-15'),
    ('Charlie', 'charlie@email.com', '2023-06-20');

--* Creating orders table
CREATE TABLE orders(
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id) NOT NULL,
    book_id INT REFERENCES books(id) NOT NULL,
    quantity INT CHECK (quantity > 0),
    order_date DATE DEFAULT now()
)

--* Inserting data into the orders table
INSERT INTO orders(customer_id, book_id, quantity, order_date)
VALUES
    (1, 2, 1, '2024-03-10'),
    (2, 1, 1, '2024-02-20'),
    (1, 3, 2, '2024-03-05');


--! PostgreSQL Queries
--* 1. Find books that are out of stock.
-- Here we are using WHERE to filter the books that have a stock of 0.
SELECT title FROM books WHERE stock = 0;

--* 2. Retrieve the most expensive book in the store.
-- Here we are using ORDER BY to sort the books by price in descending order and LIMIT to get the first row.
SELECT * FROM books ORDER BY price DESC LIMIT 1;

--* 3. Find the total number of orders placed by each customer.
-- Here we are using GROUP BY to group the orders by customer and COUNT to count the number of orders for each customer.
Select name, count(*) as total_orders From customers
JOIN orders ON customers.id = orders.customer_id
GROUP BY customers.name;

--* 4. Calculate the total revenue generated from book sales.
-- Here we are using SUM to calculate the total revenue and JOIN to combine the books and orders tables.
SELECT sum(quantity * price) as total_revenue From books
Join orders ON books.id = orders.book_id;

--* 5. List all customers who have placed more than one order.
-- Here we are using HAVING to filter the customers who have placed more than one order and GROUP BY to group the orders by customer.
SELECT name, count(*) as orders_count FROM customers
JOIN orders ON customers.id = orders.customer_id
GROUP BY customers.name
HAVING count(*) > 1;

--* 6. Find the average price of books in the store.
-- Here we are using TRUNC to truncate the average price of books to 2 decimal places.
SELECT TRUNC(avg(price),2) as avg_book_price FROM books

--* 7. Increase the price of all books published before 2000 by 10%.
-- Here we are using UPDATE to update the price of books that were published before 2000 and use SET to update the price.
UPDATE books
SET price = price + (price * 0.10) 
WHERE CAST(published_year as INT) < 2000;

--* 8. Delete customers who haven't placed any orders.
-- Here we are using NOT IN to filter the customers who have placed at least one order and DELETE to delete the customers who haven't placed any orders.
DELETE FROM customers WHERE id NOT IN (SELECT customer_id FROM orders);