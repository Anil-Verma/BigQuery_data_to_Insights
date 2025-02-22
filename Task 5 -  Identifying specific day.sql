/*
Task 5. Identifying specific day

Build a query that will answer: "On what day did the total number of deaths cross Death count in Italy in Italy?" 

The query should return the date in the format yyyy-mm-dd.

Columns to reference:
    country_name
    cumulative_deceased
*/

SELECT
  SUM(cumulative_confirmed) AS total_confirmed_cases,
  SUM(cumulative_deceased) AS total_deaths,
  (SUM(cumulative_deceased)/SUM(cumulative_confirmed))*100 AS case_fatality_ratio
FROM
  `bigquery-public-data.covid19_open_data.covid19_open_data`
WHERE
  country_name="Italy"
  AND date BETWEEN '2020-06-01'
  AND '2020-06-30';
