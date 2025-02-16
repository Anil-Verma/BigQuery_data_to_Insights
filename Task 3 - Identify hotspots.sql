/*
Task 3. Identify hotspots

Build a query that will answer "List all the states in the United States of America that had more than 2000 confirmed cases on 2020-06-25?" 
The query needs to return the State Name and the corresponding confirmed cases arranged in descending order. 
Name of the fields to return state and total_confirmed_cases.


Columns to reference:
    country_code
    subregion1_name (for state information)
    cumulative_confirmed
*/

WITH
  confirmed_cases AS (
  SELECT
    subregion1_name AS state,
    SUM(cumulative_confirmed) AS total_confirmed_cases
  FROM
    `bigquery-public-data.covid19_open_data.covid19_open_data`
  WHERE
    country_code='US'
    AND date='2020-06-25'
    AND subregion1_name IS NOT NULL
  GROUP BY
    1 )
SELECT
  state,
  total_confirmed_cases
FROM
  confirmed_cases
WHERE
  total_confirmed_cases > 2000
ORDER BY
  total_confirmed_cases DESC ;