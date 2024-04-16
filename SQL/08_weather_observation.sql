/*
A median is defined as a number separating the higher half of a data set from the lower half. 
Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to  decimal places.
*/
SELECT
    ROUND(lat_n, 4) AS median_lat_n
FROM (
    /* Subquery: Selects latitude, assigns row numbers, and counts total rows */
    SELECT lat_n,
                 ROW_NUMBER() OVER(ORDER BY lat_n) AS row_num, -- Assigns row numbers based on ascending latitude
                 COUNT(*) OVER() AS total_rows -- Counts total number of rows
    FROM station
) as subquery
WHERE 
    /* Filters rows where the row number matches the median or the next row after the median */
    row_num IN (
    (total_rows +1) / 2, -- Middle row number
    (total_rows +2) /2 -- Next row number after the middle
    );