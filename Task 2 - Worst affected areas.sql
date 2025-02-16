/*
Task 2. Worst affected areas

Build a query for answering "How many states in the US had more than 150 Death Count on 2020-06-25?" 

The query needs to list the output in the field count_of_states.

Note: Don't include NULL values.

Columns to reference:
    country_name
    subregion1_name (for state information)
    cumulative_deceased
*/

WITH
  death_in_states AS (
  SELECT
    subregion1_name,
    SUM(cumulative_deceased) AS death_count
  FROM
    `bigquery-public-data.covid19_open_data.covid19_open_data`
  WHERE
    country_name = "United States of America"
    AND date = "2020-06-25"
    AND subregion1_name IS NOT NULL
  GROUP BY
    1 )
SELECT
  COUNT(*) AS count_of_states
FROM
  death_in_states
WHERE
  death_count > 150 ;