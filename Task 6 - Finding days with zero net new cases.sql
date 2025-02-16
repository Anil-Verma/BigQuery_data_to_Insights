/*
Task 6. Finding days with zero net new cases
The following query is written to identify the number of days in India between Start date in India and Close date in India when there were zero increases in the number of confirmed cases. However it is not executing properly.

You need to update the query to complete it and obtain the result:

WITH india_cases_by_date AS (
  SELECT
    date,
    SUM(cumulative_confirmed) AS cases
  FROM
    `bigquery-public-data.covid19_open_data.covid19_open_data`
  WHERE
    country_name="India"
    AND date between '' and ''
  GROUP BY
    date
  ORDER BY
    date ASC
 )

, india_previous_day_comparison AS
(SELECT
  date,
  cases,
  LAG(cases) OVER(ORDER BY date) AS previous_day,
  cases - LAG(cases) OVER(ORDER BY date) AS net_new_cases
FROM india_cases_by_date
);
*/


