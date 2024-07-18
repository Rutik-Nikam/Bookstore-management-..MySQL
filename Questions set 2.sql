
-- Question set 2  -: INTERMEDIATE LEVEL 

-- Q 1 . List all books along with their authors' names.

SELECT Books.title, Authors.name AS author_name 
FROM Books 
JOIN Authors ON Books.author_id = Authors.author_id;


-- Q 2 Find all books published by 'Scribner'.

SELECT Books.title 
FROM Books 
JOIN Publishers ON Books.publisher_id = Publishers.publisher_id 
WHERE Publishers.name = 'Scribner';


-- Q 3 List the customers who have placed orders amounting to more than $500.

SELECT Customers.name, Customers.email 
FROM Customers 
JOIN Orders ON Customers.customer_id = Orders.customer_id 
WHERE Orders.total_amount > 500;


-- Q 4 .List all books along with their authors and publishers.

SELECT Books.title, Authors.name AS author_name, Publishers.name AS publisher_name 
FROM Books 
JOIN Authors ON Books.author_id = Authors.author_id 
JOIN Publishers ON Books.publisher_id = Publishers.publisher_id;


-- Q 5 .Retrieve the details of all orders made in June 2023.

SELECT * FROM Orders WHERE order_date BETWEEN '2023-06-01' AND '2023-06-30';


-- Q 6 .List the top 3 authors who have the most books in stock.

SELECT Authors.name, SUM(Books.stock_quantity) AS total_stock 
FROM Books 
JOIN Authors ON Books.author_id = Authors.author_id 
GROUP BY Authors.name 
ORDER BY total_stock DESC 
LIMIT 3;


-- Q 7 Calculate the total sales amount for each customer.

SELECT Customers.name, SUM(Orders.total_amount) AS total_sales 
FROM Customers 
JOIN Orders ON Customers.customer_id = Orders.customer_id 
GROUP BY Customers.name;


-- Q 8 Get the monthly sales totals for the year 2023.

SELECT MONTH(order_date) AS month, SUM(total_amount) AS monthly_sales 
FROM Orders 
WHERE YEAR(order_date) = 2023 
GROUP BY MONTH(order_date);


-- Q 9 .List all books along with their total order quantities.

SELECT Books.title, SUM(Order_Details.quantity) AS total_ordered 
FROM Books 
JOIN Order_Details ON Books.book_id = Order_Details.book_id 
GROUP BY Books.title;


-- Q 10 .Find all books that were published after the year 2000.

SELECT * FROM Books WHERE published_date > '2000-01-01';

