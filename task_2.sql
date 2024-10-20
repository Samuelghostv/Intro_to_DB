-- 1. Create the database (if it doesn't already exist)
CREATE DATABASE IF NOT EXISTS alx_book_store;

-- 2. Use the database
USE alx_book_store;

-- 3. Create the Authors table (with correct table and column names)
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for each author
    author_name VARCHAR(255) NOT NULL,        -- Correct column name for author name
    bio TEXT                                  -- Short biography of the author
);

-- 4. Create the Books table
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for each book
    title VARCHAR(255) NOT NULL,            -- Book title
    author_id INT,                          -- Links to the author (in the Authors table)
    published_date DATE,                    -- When the book was published
    price DECIMAL(10, 2),                   -- Price of the book
    FOREIGN KEY (author_id) REFERENCES Authors(author_id) -- Ensures valid author ID
);

-- 5. Create the Customers table
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for each customer
    name VARCHAR(255) NOT NULL,                 -- Customer's name
    email VARCHAR(215) UNIQUE NOT NULL,         -- Customer's email (must be unique)
    phone VARCHAR(15)  
    address TEXT                                  -- Customer's phone number(new column)
);

-- 6. Create the Orders table
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for each order
    customer_id INT NOT NULL,                -- Links to the customer who placed the order
    order_date DATE,                         -- When the order was placed
    total_amount DECIMAL(10, 2),             -- Total amount of the order
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) -- Ensures valid customer ID
);

-- 7. Create the Order_Details table
CREATE TABLE Order_details (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for each order detail
    order_id INT NOT NULL,                          -- Links to the order
    book_id INT NOT NULL,                           -- Links to the book in the order
    quantity INT NOT NULL,                          -- Quantity of the book ordered
    FOREIGN KEY (order_id) REFERENCES orders(order_id), -- Ensures valid order ID
    FOREIGN KEY (book_id) REFERENCES books(book_id)     -- Ensures valid book ID
);



