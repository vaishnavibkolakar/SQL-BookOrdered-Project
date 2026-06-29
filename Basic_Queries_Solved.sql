-- Basic Queries

-- 1) Retrieve all books in the 'Fiction' Genre;

SELECT *
FROM Books
WHERE genre = 'Fiction'

-- 2. Find books published after the year 1950
SELECT *
FROM Books
WHERE published_year > 1950

-- 3.List all customers from canada
SELECT *
FROM customers
WHERE country = 'Canada'

-- 4.SHow orders placed in November 2023
SELECT *
FROM orders o
WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30'

--5.Retrieve the total stock 0f books available
SELECT SUM(stock)
FROM books



--6.Find the detail of the most expensive book
SELECT *
FROM Books
ORDER BY price desc
LIMIT 1;



--7.Show all customers who ordered more than 1 quantity of a book
SELECT c.customer_id,c.name
FROM Customers c
JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.quantity > 1



--8.Retrieve all orders where the total amount exceeds $20

SELECT *
FROM Orders 
WHERE total_amount > 1887.75



--9.List all genres available in the books table
SELECT genre
FROM Books
GROUP BY genre



--10.Find the book with the lowest stock
SELECT book_id,title,MIN(stock) as lowest_stock
FROM Books
GROUP BY book_id



--11.Calculate the total revenue generated from all orders
SELECT SUM(total_amount) as total_revenue
FROM orders