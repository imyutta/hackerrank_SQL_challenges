-- Creating a new_table to store the results of the query
WITH 
    new_table
    AS (
        -- Selecting hacker_id, name from hackers table, and counting the number of occurrences for each hacker_id
        SELECT 
            c.hacker_id AS id, 
            h.name AS student_name, 
            COUNT(c.hacker_id) AS counter
        FROM
            hackers AS h
        INNER JOIN
            challenges AS c
            ON c.hacker_id = h.hacker_id
        -- Grouping the results by hacker_id and name
        GROUP BY
            c.hacker_id,
            h.name
    )

-- Selecting id, student_name, and counter from the new_table    
SELECT 
    id,
    student_name,
    counter
FROM new_table
-- Filtering the results
WHERE 
    -- Selecting the rows where the counter is equal to the maximum counter value in the new_table
    counter = (SELECT MAX(counter) FROM new_table)
    OR
    -- Selecting rows where the counter is unique in the new_table
    counter IN (
        SELECT counter 
        FROM new_table
        GROUP BY counter
        HAVING COUNT(counter) = 1)
-- Ordering the results by counter in descending order and then by id   
ORDER BY
    counter DESC,
    id;