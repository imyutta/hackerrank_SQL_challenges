-- Selecting company code and founder along with counts of distinct employee roles
SELECT     
    c.company_code, c.founder, 
    -- Counting distinct lead managers amount 
    COUNT(DISTINCT e.lead_manager_code), 
    -- Counting distinct senior managers amount 
    COUNT(DISTINCT e.senior_manager_code),
    -- Counting distinct managers amount 
    COUNT(DISTINCT e.manager_code), 
    -- Counting distinct employee amount 
    COUNT(DISTINCT e.employee_code) 
FROM employee AS e
-- Joining employee table with company table on company code
INNER JOIN company AS c ON e.company_code = c.company_code
-- Grouping results by company code and founder
GROUP BY c.company_code, c.founder
-- Sorting the results by company code in ascending order
ORDER BY c.company_code ASC;