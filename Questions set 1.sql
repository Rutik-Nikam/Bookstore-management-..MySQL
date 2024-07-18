 use books_store;
 
-- Question set 1  -: BASIC LEVEL 

-- Q 1 List all authors in the database.

SELECT * FROM Authors;


-- Q 2 .Retrieve all publishers' names and addresses.

SELECT name, address FROM Publishers;


-- Q 3 .Display all books with their titles and genres.

SELECT title, genre FROM Books;


-- Q 4  . Find all customers' names and emails.

SELECT name, email FROM Customers;


--  Q 5 .List all orders with their order dates and total amounts.

SELECT order_id, order_date, total_amount FROM Orders;


-- Q 6 .Count the number of books in the 'Fantasy' genre.

SELECT COUNT(*) FROM Books WHERE genre = 'Fantasy';


-- Q 7 .Get the address of the customer with ID 101

SELECT address FROM Customers WHERE customer_id = 101;


-- Q 8 .Retrieve all customers whose phone numbers start with '123'.

SELECT * FROM Customers WHERE phone LIKE '123%';
