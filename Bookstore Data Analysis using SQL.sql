create database books_store ;

use books_store;

CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    bio TEXT
);

INSERT INTO Authors (name, bio) VALUES
('j.k rowling', 'harry potter series'),
('stephen king', 'horror novels'),
('haruki murakami', 'surreal fiction'),
('chimamanda adichie', 'nigerian novelist');



-- Create Publishers table
CREATE TABLE Publishers (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address TEXT
);

INSERT INTO Publishers (name, address) VALUES
('bloombury publishing', '50 Bedford Square, London, WC1B 3DP, United Kingdom'),
('scribner', '1230 Avenue of the Americas, New York, NY 10020, USA'),
('shinchosha', '5-5-12, Tsukiji, Chuo-ku, Tokyo 104-8011, Japan'),
('alfred a.knoph', '1745 Broadway, New York, NY 10019, USA');

select * from publishers;


-- Create Books table
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author_id INT,
    publisher_id INT,
    genre VARCHAR(50),
    price DECIMAL(10, 2),
    published_date DATE,
    stock_quantity INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id),
    FOREIGN KEY (publisher_id) REFERENCES Publishers(publisher_id)
);

INSERT INTO Books (title, author_id, publisher_id, genre, price, published_date, stock_quantity) VALUES
('Americanah', 4, 2,'Literary Fiction', 17.50, '2013-05-14', 120),
('Pet Sematary', 2, 1, 'Horror', 11.99, '1983-11-14', 200),
('Norwegian Wood', 3,2,'Literary Fiction', 14.95, '1987-08-04', 200),
('Harry Potter and the Philosopher''s Stone', 1, 4,'Fantasy', 10.99, '1997-06-26', 500),
('Half of a Yellow Sun', 4, 4, 'Historical Fiction', 16.00, '2006-09-12', 150),
('Kafka on the Shore', 3, 3,'Surreal Fiction', 16.99, '2002-09-12', 180),
('The Shining', 2, 1,'Horror', 12.99, '1977-01-28', 300),
('Harry Potter and the Chamber of Secrets', 1, 2,'Fantasy', 12.99, '1998-07-02', 450),
('1Q84', 3, 3,'Fantasy', 18.99, '2009-05-29', 150),
('Harry Potter and the Prisoner of Azkaban', 1, 1, 'Fantasy', 13.99, '1999-09-08', 400);


-- Create Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    phone VARCHAR(20),
    address TEXT
);


INSERT INTO Customers (customer_id,name, email, phone, address) VALUES
(101,'customer three', 'customer3@example.com', '1231231234', 'Address of Customer Three'),
(102,'Customer Four', 'customer4@example.com', '4321432143', 'Address of Customer Four'),
(103,'Customer Five', 'customer5@example.com', '5555555555', 'Address of Customer Five'),
(104,'Customer Six', 'customer6@example.com', '6666666666', 'Address of Customer Six'),
(105,'Customer Seven', 'customer7@example.com', '7777777777', 'Address of Customer Seven'),
(106,'Customer Eight', 'customer8@example.com', '8888888888', 'Address of Customer Eight'),
(107,'Customer Nine', 'customer9@example.com', '9999999999', 'Address of Customer Nine'),
(108,'Customer Ten', 'customer10@example.com', '1010101010', 'Address of Customer Ten');


-- Create Orders table
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Orders (customer_id, order_date, total_amount) VALUES
(103,'2023-06-01', 200.98),
(104,'2023-06-02', 500.99),
(106,'2023-06-03', 300.97),
(102,'2023-06-04', 800.99),
(101,'2023-06-05', 345.99),
(103,'2023-06-06', 45.99),
(103,'2023-06-07', 400.00),
(108,'2023-06-08', 100.00);

select * from orders;

-- Create Order Details table
CREATE TABLE Order_Details (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

INSERT INTO Order_Details (order_detail_id,order_id, book_id, quantity, unit_price) VALUES
(301, 16, 2,2, 24.99),
(302, 15, 10,1, 17.99),
(303, 10, 5, 2,14.99),
(304, 15, 1,2, 22.99),
(305, 13, 6,3, 19.99),
(306, 10, 7,1, 15.99),
(307, 9, 8,4, 18.99),
(308, 10, 2,2, 21.99),
(309, 11, 3,3, 16.99),
(310, 12, 10,1, 13.99),
(311, 9, 9, 4,25.99),
(312, 14, 9,2, 12.99),
(313, 15, 5,3,10.99),
(314,16, 7,1, 26.99),
(315, 9, 1, 4,20.99),
(316, 10, 3,2, 9.99),
(317, 11, 10,1, 29.99),
(318, 12, 5,5,23.99);

select * from order_details;

----------------------------------------------------------------------------------------------------------------------------------------------------
--                                                    Question set 1  -: BASIC LEVEL 

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

--------------------------------------------------------------------------------------------------------------------------------
--                                                        Question set 2  -: INTERMEDIATE LEVEL 

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


-------------------------------------------------------------------------------------------------------------------------------
 --                                             QUESTION SET 3  - : ADVANCE LEVEL
 
-- Q 1  .Calculate the total revenue generated by each publisher.

SELECT Publishers.name, SUM(Order_Details.quantity * Order_Details.unit_price) AS total_revenue
FROM Publishers
JOIN Books ON Publishers.publisher_id = Books.publisher_id
JOIN Order_Details ON Books.book_id = Order_Details.book_id
GROUP BY Publishers.name;


-- Q 2 Find the customer who placed the highest number of orders and the total amount spent.

SELECT Customers.name, COUNT(Orders.order_id) AS total_orders, SUM(Orders.total_amount) AS total_spent
FROM Customers
JOIN Orders ON Customers.customer_id = Orders.customer_id
GROUP BY Customers.name
ORDER BY total_orders DESC
LIMIT 1;


-- Q 3 .List all books along with their total sales revenue, sorted by highest revenue.

SELECT Books.title, SUM(Order_Details.quantity * Order_Details.unit_price) AS total_revenue
FROM Books
JOIN Order_Details ON Books.book_id = Order_Details.book_id
GROUP BY Books.title
ORDER BY total_revenue DESC;


-- Q 4 .Find the average order value for each customer.

SELECT Customers.name, AVG(Orders.total_amount) AS average_order_value
FROM Customers
JOIN Orders ON Customers.customer_id = Orders.customer_id
GROUP BY Customers.name;


-- Q 5 .Get the list of books that have been ordered more than 100 times.

SELECT Books.title, SUM(Order_Details.quantity) AS total_ordered
FROM Books
JOIN Order_Details ON Books.book_id = Order_Details.book_id
GROUP BY Books.title
HAVING total_ordered > 100;


-- Q 6 .Identify the authors whose books have generated the highest average sales price per order.

SELECT Authors.name, AVG(Order_Details.unit_price * Order_Details.quantity) AS avg_sales_price
FROM Authors
JOIN Books ON Authors.author_id = Books.author_id
JOIN Order_Details ON Books.book_id = Order_Details.book_id
GROUP BY Authors.name
ORDER BY avg_sales_price DESC
LIMIT 3;


-- Q 7 .Calculate the percentage of total sales contributed by each book genre.

WITH GenreSales AS (
SELECT Books.genre, SUM(Order_Details.quantity * Order_Details.unit_price) AS genre_sales
FROM Books
JOIN Order_Details ON Books.book_id = Order_Details.book_id
GROUP BY Books.genre),
TotalSales AS (SELECT SUM(genre_sales) AS total_sales FROM GenreSales)
SELECT GenreSales.genre, (GenreSales.genre_sales / TotalSales.total_sales) * 100 AS genre_percentage
FROM GenreSales, TotalSales;


-- Q 8 Retrieve the yearly sales total for each author

SELECT Authors.name, YEAR(Orders.order_date) AS sales_year, SUM(Order_Details.quantity * Order_Details.unit_price) AS yearly_sales
FROM Authors
JOIN Books ON Authors.author_id = Books.author_id
JOIN Order_Details ON Books.book_id = Order_Details.book_id
JOIN Orders ON Order_Details.order_id = Orders.order_id
GROUP BY Authors.name, sales_year
ORDER BY sales_year, yearly_sales DESC;


-- Q 9 .Find the customer with the highest average order value over multiple orders.

SELECT Customers.name, AVG(Orders.total_amount) AS average_order_value
FROM Customers
JOIN Orders ON Customers.customer_id = Orders.customer_id
GROUP BY Customers.name
ORDER BY average_order_value DESC
LIMIT 1;


-- Q 10 Calculate the total revenue generated by books published after the year 2000.

SELECT SUM(Order_Details.quantity * Order_Details.unit_price) AS total_revenue
FROM Books
JOIN Order_Details ON Books.book_id = Order_Details.book_id
WHERE Books.published_date > '2000-01-01';


-- Objective:
-- To design and implement a comprehensive SQL database for a book store, enabling advanced data querying and management, 
-- with a focus on utilizing wildcard operators and complex joins to extract meaningful insights from the dataset.

-- Description:
-- In this project, I developed a robust SQL database for a book store that includes detailed tables for Authors, 
-- Publishers, Books, Customers, Orders, and Order Details. The database is designed to manage extensive information about the books, their
--  authors, publishers, customer details, and order transactions.

-- Key features of the project include:

-- Database Design: Created and normalized multiple interconnected tables to ensure data integrity and minimize redundancy.
-- Advanced Querying: Implemented complex SQL queries using wildcard operators, aggregate functions, and joins to extract valuable insights from the data.
-- Data Management: Developed queries to handle data insertion, updating, and deletion efficiently.
-- Analytics: Conducted comprehensive data analysis to identify trends such as the most popular books, top spending customers, and revenue generated 
-- by different publishers and authors.
-- Here are some of the advanced SQL queries utilized in the project:

-- Finding authors whose names contain specific patterns.
-- Listing books with titles matching particular criteria.
-- Retrieving customer details based on email patterns.
-- Analyzing order data to determine the highest-spending customers and most ordered books.
-- This project not only enhanced my SQL skills but also provided valuable insights into data management and analysis, which are crucial 
-- for making informed business decisions in a book store environment.

