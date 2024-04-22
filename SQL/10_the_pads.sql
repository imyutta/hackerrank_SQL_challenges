
SELECT 
    CONCAT(name, "(", LEFT(occupation,1), ")" ) 
FROM occupations AS list_of_names 
ORDER BY name ASC;
SELECT 
    CONCAT("There are a total of ", COUNT(occupation), " ", LCASE(occupation), "s.") AS total_number 
FROM occupations 
GROUP BY occupation 
ORDER BY COUNT(occupation) ASC;