-- covid19 Data Analysis using SQL:
 
 -- find out fully vaccinated percentage
SELECT * FROM covid19.covid19;
SELECT iso_code, location, 100*max(people_fully_vaccinated)/population AS fullyVaccinatedPercentage
FROM covid19.covid19
group by iso_code order by fullyVaccinatedPercentage DESC;

-- Likelihood of being infected
SELECT iso_code, location, 100*max(total_cases)/population AS infectedPercentage
FROM covid19.covid19
group by iso_code order by infectedPercentage DESC;

SELECT iso_code, location, 100*max(total_cases)/population AS infectedPercentage
FROM covid19.covid19
group by iso_code order by infectedPercentage DESC;

-- countries where high death rate than global 
select iso_code, location, avg(total_deaths) as avg_deaths
from covid19.cases_n_casulities 
group by iso_code, location
order by avg_deaths DESC;

-- density of total cases country-wise
select iso_code, location, 100*max(total_cases)/ population as percentpopulationInfected, population
from covid19.covid19 group by iso_code
order by percentpopulationinfected DESC;

-- Continent wise breakdown

select continent, max(total_cases) as totalcases, max(total_deaths) as totaldeaths, population from
covid19.cases_n_casulities where iso_code not like "AFG%" group by continent

select continent, max(total_cases) as totalcases, max(total_deaths) as totaldeaths, population from
covid19.cases_n_casulities group by continent


select continent, max(total_cases) as totalcases, max(total_deaths) as totaldeaths,
sum(population) over (partition by continent)
from covid19.cases_n_casulities group by continent










