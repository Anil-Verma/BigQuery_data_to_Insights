/*
Task 4. Fatality ratio

Build a query that will answer "What was the case-fatality ratio in Italy for the month of Month 2020?" 
Case-fatality ratio here is defined as (total deaths / total confirmed cases) * 100.

Write a query to return the ratio for the month of Month 2020 and contain the following fields in the output: 
total_confirmed_cases, total_deaths, case_fatality_ratio.

Columns to reference:
    country_name
    cumulative_confirmed
    cumulative_deceased
*/

SELECT 
sum(cumulative_confirmed) as total_confirmed_cases, 
sum(cumulative_deceased) as total_deaths, 
(sum(cumulative_deceased)/sum(cumulative_confirmed))*100 as case_fatality_ratio 
FROM `bigquery-public-data.covid19_open_data.covid19_open_data` 
where country_name="Italy" and date='2020-06-25';
