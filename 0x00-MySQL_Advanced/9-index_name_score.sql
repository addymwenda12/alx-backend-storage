-- Importing the table dump
source names.sql;

-- Creating the index idx_name_first_score
CREATE INDEX idx_name_first_score ON names (LEFT(name, 1), score);
