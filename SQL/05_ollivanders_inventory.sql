-- Print the id, age, coins_needed, and power of the wands Ron's interested in
SELECT
    id,
    age,
    coins_needed,
    power
FROM
(
    -- Inner query assigns a row number (rn) for each row partitioned by POWER and AGE, ordered by COINS_NEEDED
    SELECT 
        w.id,                               -- Select wand ID
        wp.age,                          -- Select wand's age
        w.coins_needed,            -- Select coins needed for the wand
        w.power,                         -- Select power of the wand
        ROW_NUMBER() OVER           -- Assign row number (rn) within each group (partition) defined by POWER and AGE, ordered by COINS_NEEDED
             (
                PARTITION BY 
                 w.code,   
                 w.power  
                ORDER BY w.coins_needed, w.power DESC
            ) AS rn
    FROM
        wands AS w                     -- Alias WANDS table as W
    INNER JOIN
        wands_property AS wp    -- Join WANDS_PROPERTY table as P
        ON
        w.code = wp.code            -- Join condition based on wand code
    WHERE
        is_evil = 0                         -- Filter out evil wands
) AS ranked                                -- Alias the result set of the inner query as "ranked"

WHERE
    rn = 1                                      -- Filter out only the rows with the minimum COINS_NEEDED within each group

ORDER BY
    power DESC,                              -- Sort in order of descending power
    age DESC;                                   -- If there's a tie in POWER, order by AGE in descending order