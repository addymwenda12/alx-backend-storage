-- Create index idx_name_first on the table names and the first letter of name

-- Importing the table dump
source names.sql;

-- Verifying if the index exists and matches the expected details
SELECT *
FROM information_schema.statistics
WHERE table_name = 'names'
AND index_name = 'idx_name_first'
AND seq_in_index = 1
AND column_name = 'name'
AND collation = 'A'
AND cardinality = 26
AND sub_part = 1
AND packed IS NULL
AND is_nullable = 'YES'
AND index_type = 'BTREE'
AND index_comment = '';
