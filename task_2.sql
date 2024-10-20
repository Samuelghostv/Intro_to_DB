-- 1. Create the database (if it doesn't already exist)
CREATE DATABASE IF NOT EXISTS alx_book_store;

-- 2. Switch to the new database
USE alx_book_store;

-- 3. Create the authors table
CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for each author
    name VARCHAR(255) NOT NULL,               -- Author's name
    bio TEXT                                  -- Short biography of the author
);

-- 4. Create the books table
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for each book
    title VARCHAR(255) NOT NULL,            -- Book title
    author_id INT,                          -- Links to the author (in the authors table)
    published_date DATE,                    -- When the book was published
    price DECIMAL(10, 2),                   -- Price of the book
    FOREIGN KEY (author_id) REFERENCES authors(author_id) -- Ensures valid author ID
);

-- 5. Create the customers table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for each customer
    name VARCHAR(255) NOT NULL,                 -- Customer's name
    email VARCHAR(255) UNIQUE NOT NULL,         -- Customer's email (must be unique)
    phone VARCHAR(15)                           -- Customer's phone number
);

-- 6. Create the orders table
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for each order
    customer_id INT NOT NULL,                -- Links to the customer who placed the order
    order_date DATE,                         -- When the order was placed
    total_amount DECIMAL(10, 2),             -- Total amount of the order
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) -- Ensures valid customer ID
);

-- 7. Create the order_details table
CREATE TABLE order_details (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for each order detail
    order_id INT NOT NULL,                          -- Links to the order
    book_id INT NOT NULL,                           -- Links to the book in the order
    quantity INT NOT NULL,                          -- Quantity of the book ordered
    FOREIGN KEY (order_id) REFERENCES orders(order_id), -- Ensures valid order ID
    FOREIGN KEY (book_id) REFERENCES books(book_id)     -- Ensures valid book ID
);


