-- Print the id, age, coins_needed, and power of the wands Ron's interested in
SELECT 
    w.id, 
    wp.age, 
    w.coins_needed,
    w.power
FROM
    wands AS w
INNER JOIN
    wands_property AS wp
    ON
    w.code = wp.code
-- Select only non-evil wands
WHERE is_evil = 0
ORDER BY
    -- Sort in order of descending power
    power DESC,
    -- If more than one wand has same power, sort the result in order of descending age
    age DESC;