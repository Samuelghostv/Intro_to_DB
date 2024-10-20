-- Switching to the specified database
USE alx_book_store;

-- Query the information schema for the full description of the 'books' table
SELECT 
    COLUMN_NAME, 
    COLUMN_TYPE, 
    IS_NULLABLE, 
    COLUMN_DEFAULT, 
    COLUMN_KEY, 
    EXTRA 
FROM 
    INFORMATION_SCHEMA.COLUMNS 
WHERE 
    TABLE_NAME = 'Books' 
    AND TABLE_SCHEMA = 'Alx_book_store';