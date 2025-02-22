/*
Task 5. Identifying specific day

Build a query that will answer: "On what day did the total number of deaths cross Death count in Italy in Italy?" 

The query should return the date in the format yyyy-mm-dd.

Columns to reference:
    country_name
    cumulative_deceased
*/

SELECT sum(cumulative_confirmed) as total_confirmed_cases, sum(cumulative_deceased) as total_deaths, 
(sum(cumulative_deceased)/sum(cumulative_confirmed))*100 as case_fatality_ratio 
FROM `bigquery-public-data.covid19_open_data.covid19_open_data` 
where country_name="Italy" 
AND date BETWEEN '2020-06-01' and '2020-06-30';
