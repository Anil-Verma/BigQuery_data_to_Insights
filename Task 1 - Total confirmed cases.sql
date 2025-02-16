/*
Task 1. Total confirmed cases
Build a query that will answer "What was the total count of confirmed cases on Date?" 

The query needs to return a single row containing the sum of confirmed cases across all countries. 
The name of the column should be total_cases_worldwide.

Columns to reference:
    cumulative_confirmed
    date

*/

SELECT
  SUM(cumulative_confirmed) AS total_cases_worldwide
FROM
  `bigquery-public-data.covid19_open_data.covid19_open_data`
WHERE
  date='2020-06-25';

