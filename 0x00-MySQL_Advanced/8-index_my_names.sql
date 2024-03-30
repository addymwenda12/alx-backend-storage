-- Create index idx_name_first on the table names and the first letter of name

-- Importing the table dump
source names.sql;

-- Creating the index
CREATE INDEX idx_name_first ON names (LEFT(name, 1));
