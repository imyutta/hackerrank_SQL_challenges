/*
output the names of those students whose best friends got offered a higher salary than them
*/
SELECT s.name       -- Selects the names of students
FROM students AS s
INNER JOIN friends AS f         -- Joins students with their friends
ON s.id = f.id
INNER JOIN packages AS p        -- Joins students with the salary packages
ON s.id = p.id
INNER JOIN packages AS pf       -- Joins friends with their salary packages
ON f.friend_id = pf.id
WHERE p.salary < pf.salary          -- Filters the students whose best friends were offered higher salaries
/* order by the salary amount offered to the best friends */
ORDER BY pf.salary;