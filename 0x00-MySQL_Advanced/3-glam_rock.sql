-- This script lists all bands with 'Glam rock' as their main style,
-- ranked by their longevity (in years until the current year).
-- The output columns are 'band_name' and 'lifespan'.
-- The script uses the 'formed' and 'split' attributes to compute the 'lifespan'.
-- The script can be executed on any database after importing the 'metal_bands' table.

SELECT band_name, IFNULL(YEAR(split) - YEAR(formed), YEAR(CURDATE()) - YEAR(formed)) AS lifespan
FROM metal_bands
WHERE style LIKE '%Glam rock%'
ORDER BY lifespan DESC;