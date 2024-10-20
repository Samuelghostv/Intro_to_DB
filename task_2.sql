
CREATE DATABASE IF NOT EXISTS alx_book_store;

USE alx_book_store;

-- Create the books table
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for each book
    title VARCHAR(255) NOT NULL,            -- Book title
    author_id INT,                          -- The ID of the author (will connect to the authors table)
    published_date DATE,                    -- When the book was published
    price DECIMAL(10, 2),                   -- Price of the book
    FOREIGN KEY (author_id) REFERENCES authors(author_id) -- Link to authors table
);

-- Create the authors table
CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for each author
    name VARCHAR(255) NOT NULL,               -- Author's name
    bio TEXT                                  -- Short biography of the author
);

-- Create the customers table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for each customer
    name VARCHAR(255) NOT NULL,                 -- Customer's name
    email VARCHAR(255) UNIQUE NOT NULL,         -- Customer's email (must be unique)
    phone VARCHAR(15)                           -- Customer's phone number
);

-- Create the orders table
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for each order
    customer_id INT NOT NULL,                -- The customer who placed the order
    order_date DATE,                         -- When the order was placed
    total_amount DECIMAL(10, 2),             -- Total amount for the order
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) -- Link to customers table
);

-- Create the order_details table
CREATE TABLE order_details (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for each order detail
    order_id INT NOT NULL,                          -- The order this detail belongs to
    book_id INT NOT NULL,                           -- The book in this order detail
    quantity INT NOT NULL,                          -- Number of books ordered
    FOREIGN KEY (order_id) REFERENCES orders(order_id), -- Link to orders table
    FOREIGN KEY (book_id) REFERENCES books(book_id)     -- Link to books table
);
