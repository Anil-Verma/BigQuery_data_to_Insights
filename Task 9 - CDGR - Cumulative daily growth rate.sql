/*
Task 9. CDGR - Cumulative daily growth rate
The following query is trying to calculate the CDGR on Date(Cumulative Daily Growth Rate) for France since the day the first case was reported.The first case was reported on Jan 24, 2020.

The CDGR is calculated as:

((last_day_cases/first_day_cases)^1/days_diff)-1)

Where :

last_day_cases is the number of confirmed cases on May 10, 2020

first_day_cases is the number of confirmed cases on Jan 24, 2020

days_diff is the number of days between Jan 24 - May 10, 2020

The query isn’t executing properly. Can you fix the error to make the query execute successfully?

WITH
  france_cases AS (
  SELECT
    date,
    SUM(cumulative_confirmed) AS total_cases
  FROM
    `bigquery-public-data.covid19_open_data.covid19_open_data`
  WHERE
    country_name="France"
    AND date IN ('2020-01-24',
      '')
  GROUP BY
    date
  ORDER BY
    date)
, summary as (
SELECT
  total_cases AS first_day_cases,
  LEAD(total_cases) AS last_day_cases,
  DATE_DIFF(LEAD(date) OVER(ORDER BY date),date, day) AS days_diff
FROM
  france_cases
LIMIT 1
)

select first_day_cases, last_day_cases, days_diff, SQRT((last_day_cases/first_day_cases),(1/days_diff))-1 as cdgr
from summary


*/

WITH france_cases AS ( 
  SELECT date, 
  SUM(cumulative_confirmed) AS total_cases 
  FROM `bigquery-public-data.covid19_open_data.covid19_open_data` 
  WHERE country_name="France" 
  AND date IN ('2020-01-24', '2020-06-25') 
  GROUP BY date 
  ORDER BY date
  ) , 
  summary as ( 
    SELECT 
    total_cases AS first_day_cases, 
    LEAD(total_cases) OVER(ORDER BY date) AS last_day_cases, 
    DATE_DIFF(LEAD(date) OVER(ORDER BY date),date, day) AS days_diff 
    FROM france_cases LIMIT 1 
    ) 
select 
first_day_cases, 
last_day_cases, 
days_diff, 
POW((last_day_cases/first_day_cases),(1/days_diff))-1 as cdgr 
from summary;



