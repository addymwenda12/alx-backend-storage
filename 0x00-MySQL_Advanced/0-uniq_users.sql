-- This script creates a 'users' table with the following requirements:
--   - It has three columns: 'id', 'email', and 'name'
--   - 'id' is an auto-incrementing integer, never null, and the primary key
--   - 'email' is a string of up to 255 characters, never null, and unique
--   - 'name' is a string of up to 255 characters
--   - If the table already exists, the script should not fail
--   - The script can be executed on any database

CREATE TABLE IF NOT EXISTS users (
    -- 'id' is an auto-incrementing integer, never null, and the primary key
    id INT AUTO_INCREMENT PRIMARY KEY,
    -- 'email' is a string of up to 255 characters, never null, and unique
    email VARCHAR(255) NOT NULL UNIQUE,
    -- 'name' is a string of up to 255 characters
    name VARCHAR(255)
);
