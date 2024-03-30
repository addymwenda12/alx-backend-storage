-- This script ranks country origins of bands by the number of (non-unique) fans,
-- using the 'metal_bands' table.
-- The output columns are 'origin' and 'nb_fans'.
-- The script can be executed on any database.

SELECT origin, SUM(fans) AS nb_fans
FROM metal_bands
GROUP BY origin
ORDER BY nb_fans DESC;