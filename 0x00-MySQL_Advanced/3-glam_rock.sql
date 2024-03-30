-- This script lists all bands with 'Glam rock' as their main style,
-- ranked by their longevity (in years until 2022).
-- The output columns are 'band_name' and 'lifespan'.
-- The script uses the 'formed' and 'split' attributes to compute the 'lifespan'.
-- The script can be executed on any database after importing the 'metal_bands' table.

SELECT band_name, IFNULL(YEAR(split) - YEAR(formed), 2022 - YEAR(formed)) AS lifespan
FROM metal_bands
WHERE style LIKE '%Glam rock%'
ORDER BY lifespan DESC;