SELECT 
    m.id, 
    h.name,
    SUM(m.max_scores)
FROM
    (
    SELECT
        hacker_id AS id,
        MAX(score) AS max_scores
    FROM
        submissions
    GROUP BY
        challenge_id, id
) AS m
        
INNER JOIN
     hackers AS h
    ON  m.id = h.hacker_id
    
GROUP BY
    m.id,
    h.name
HAVING
    SUM(m.max_scores) > 0
ORDER BY
    SUM(m.max_scores) DESC,
    m.id ASC;