Task 10. Create a Looker Studio report
Create a Looker Studio report that plots the following for the United States:

Number of Confirmed Cases
Number of Deaths
Date range : Date Range

SELECT
  date,
  SUM(cumulative_confirmed) AS country_cases,
  SUM(cumulative_deceased) AS country_deaths
FROM
  `bigquery-public-data.covid19_open_data.covid19_open_data`
WHERE
  date BETWEEN '2020-03-23'
  AND '2020-04-19'
  AND country_name ="United States of America"
GROUP BY
  date;