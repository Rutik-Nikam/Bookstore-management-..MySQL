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
