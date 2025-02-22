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

SELECT date
FROM `bigquery-public-data.covid19_open_data.covid19_open_data` 
where country_name="Italy" 
and cumulative_deceased>8000 
order by date asc 
limit 1;

WITH india_cases_by_date AS 
( SELECT 
date, 
SUM( cumulative_confirmed ) AS cases 
FROM `bigquery-public-data.covid19_open_data.covid19_open_data` 
WHERE country_name ="India" 
AND date between '2020-02-21' and '2020-03-10' 
GROUP BY date 
ORDER BY date ASC 
) , 
india_previous_day_comparison AS (
  SELECT date, cases, 
  LAG(cases) OVER(ORDER BY date) AS previous_day, 
  cases - LAG(cases) OVER(ORDER BY date) AS net_new_cases 
  FROM india_cases_by_date 
  ) 
  select count(*) 
  from india_previous_day_comparison 
  where net_new_cases=0;


