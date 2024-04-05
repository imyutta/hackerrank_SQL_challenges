-- Selecting the hacker ID, hacker name, and sum of maximum scores
SELECT 
    m.id, -- Selecting hacker ID from 'm' table
    h.name, -- Selecting hacker name from 'h' table
    SUM(m.max_scores) -- Summing up maximum scores
FROM
    (
    -- Subquery to find the maximum challenge score for each hacker 
    SELECT
        hacker_id AS id, -- Selecting hacker ID
        MAX(score) AS max_scores -- Finding the maximum score for each challenge
    FROM
        submissions
    GROUP BY
        challenge_id, id
) AS m
        
INNER JOIN
     hackers AS h -- Joining with the hackers table
    ON  m.id = h.hacker_id
    
GROUP BY
    m.id, -- Grouping by hacker ID from subquery
    h.name -- Grouping by hacker name
HAVING
    SUM(m.max_scores) > 0  -- Filtering out hackers with zero total maximum scores
ORDER BY
    SUM(m.max_scores) DESC, -- Sorting by sum of maximum scores in descending order
    m.id ASC; -- Sorting hacker IDs in ascending order