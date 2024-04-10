SELECT start_date, new_end_date 
FROM (
    SELECT s.start_date, MIN(e.end_date) AS new_end_date 
    FROM (
        /*Choose the start dates that are not end dates of other projects*/
        SELECT start_date FROM projects WHERE start_date NOT IN (SELECT end_date FROM projects)
    ) AS s, (
        /*Choose the end dates that are not start dates of other projects*/
        SELECT end_date FROM projects WHERE end_date NOT IN (SELECT start_date FROM projects)
    ) AS e
    WHERE start_date <end_date
    GROUP BY start_date
) AS derived_table
ORDER BY
    /*  Order by the number of days it took to complete the project in ascending order*/
    datediff(new_end_date, start_date),
    /* Then order  by the start date of the project*/
    start_date ASC;