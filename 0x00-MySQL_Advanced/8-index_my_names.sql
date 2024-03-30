-- Create index idx_name_first on the table names and the first letter of name

-- Importing the table dump
source names.sql;

-- Checking if the index exists
SHOW INDEX FROM names WHERE Key_name = 'idx_name_first';
