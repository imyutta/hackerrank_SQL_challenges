-- Selecting hacker_id and name from the hackers table
SELECT 
    h.hacker_id, h.name
FROM
    -- Joining the submissions table with the challenges table based on challenge_id
    submissions AS s
INNER JOIN
    challenges AS c ON s.challenge_id = c.challenge_id
INNER JOIN
    -- Joining the difficulty table with the challenges table based on difficulty_level
    difficulty AS d ON c.difficulty_level = d.difficulty_level
INNER JOIN
    -- Joining the hackers table with the submissions table based on hacker_id
    hackers AS h ON h.hacker_id = s.hacker_id
WHERE
    -- Filtering the results: ensure that the score of the submission matches the difficulty score
    s.score = d.score
GROUP BY
    -- Grouping the results by hacker_id and name
    h.hacker_id, h.name
-- Selecting hackers who achieved full scores for more than 1 challenge
HAVING COUNT(h.hacker_id)>1

-- Ordering the results by the count of hacker_id in descending order and then by hacker_id in ascending order
ORDER BY 
    COUNT(h.hacker_id) DESC,
    h.hacker_id ASC;
    
