-- Advance Queries

-- 1.Retrieve the total number of books sold for each genre
SELECT SUM(o.quantity),b.genre
FROM Orders o
JOIN books b
ON o.book_id = b.book_id
GROUP BY b.genre

-- 2.Find the average price of books in the 'Fantasy' genre
SELECT AVG(price)
FROM BOOKS
WHERE genre = 'Fantasy'

-- 3.List customers who have placed at least 2 orders
SELECT customer_ID,COUNT(order_id)
FROM orders 
GROUP BY customer_ID
HAVING COUNT(order_id) >= 2




-- 4.Find the most frequently ordered book
SELECT o.book_id,b.title,COUNT(o.order_id) AS order_count
FROM Books b
JOIN Orders o 
ON b.book_id = o.book_id
Group by o.book_id,b.title
order by order_count desc
limit 1;


-- 5.Show the top 3 most expensive books of 'fantasy' genre

SELECT *
FROM Books
WHERE genre = 'Fantasy'
ORDER BY price desc
limit 3;




-- 6.Retrive the total quantity of books sold by each author
SELECT b.author,SUM(o.quantity) as total_book_sold
FROM Orders o
JOIN Books b
ON o.book_id = b.book_id
GROUP BY b.author



-- 7.List the cities where customers who spent over $30 are located
SELECT DISTINCT c.city
FROM Customers c
JOIN Orders o 
ON c.customer_id = o.customer_id
WHERE o.total_amount > 30



-- 8.Find the customer who spent the most on orders
SELECT c.name,c.customer_id,SUM(o.total_amount) as total_spent
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id,c.name
ORDER BY total_spent desc
LIMIT 1;



-- 9.Calculate the stock remaining after fulfilling all the orders
SELECT b.book_id,b.title,b.stock,COALESCE(SUM(o.quantity),0) as order_quantity, 
b.stock-COALESCE(SUM(o.quantity),0) AS remaining_stock
FROM Books b
LEFT JOIN Orders o
ON b.book_id = o.book_id
GROUP BY b.book_id,b.title

