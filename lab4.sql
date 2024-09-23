--4.1
/* No, you can not delete VA from the name table because of the 1 to M relationship*/

--4.2
/* No, beacuase 80 is not a valid fisp*/

--4.3
/*It took a couple tries to get the response i was looking for, can be improved*/

--4.5
/*Yes, very well*/

--4.6
-- Step 1: Find the most recent year
WITH latest_year AS (
    SELECT MAX(year) AS year
    FROM income
)

-- Step 2: Find the state with the highest income in that year
SELECT 
    n.name,
    i.income,
    i.year
FROM 
    income i
JOIN 
    name n ON i.fips = n.fips
JOIN 
    latest_year l ON i.year = l.year
ORDER BY 
    i.income DESC
LIMIT 1;
/* It works */

--4.7
WITH va_population AS (
    -- Step 1: Retrieve population data for Virginia (FIPS code '51') for the past six years
    SELECT 
        year,
        pop
    FROM 
        population
    WHERE 
        fips = '51' -- FIPS code for Virginia
    ORDER BY 
        year DESC
    LIMIT 6
)
-- Step 2: Calculate the year-over-year growth rate
SELECT
    current_year.year AS year,
    ((current_year.pop - previous_year.pop) / previous_year.pop) * 100 AS growth_rate
FROM 
    va_population current_year
JOIN 
    va_population previous_year ON current_year.year = previous_year.year + 1
ORDER BY 
    current_year.year DESC;
/* The code did not work*/

--4.8
/* ChatGPT does not always produce accurate results*/
