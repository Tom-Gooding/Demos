select count(iso_code)
from covid_vaccines;

select * FROM covid_deaths
limit 10;

select * from covid_vaccines
limit 10;

-- both tables show up! hurrah!
select *
from covid_deaths
ORDER BY 3,4;

-- create numbered index col for each table
alter table covid_deaths
add column id serial Primary key;

alter table covid_vaccines
add column id serial Primary key;

select *
from covid_vaccines
LIMIT 10;

select location, date, total_cases, new_cases, total_deaths, population
from covid_deaths
limit 10;


-- Looking at total cases vs. total deaths
select location, date, total_cases, total_deaths, (total_deaths / total_cases)*100 as Death_pcn
from covid_deaths
where location = 'United States'
AND total_deaths IS NOT NULL
order BY 5 DESC;

-- shows the likelihood of dying of dying if you contract COVID in ___ country (US) at ene of dataset date
select location, date, total_cases, total_deaths, (total_deaths / total_cases)*100 as Death_pcn
from covid_deaths
where location = 'United States'
order BY 1,2 DESC;


--total cases vs. the total population
select location, date, population, total_cases, total_deaths, (total_cases/population)*100 as COVID_pop_pcn
from covid_deaths
where location = 'United States'
order by 1,2;


-- look at countries with highest infection rates compared do population
select 
    location, 
    population, 
    max(total_cases) as highest_infection_count, 
    max((total_cases/population))*100 as pcn_pop_infected
from covid_deaths
group by location, population
order by pcn_pop_infected DESC
limit 25;

SELECT 
    location, 
    population, 
    MAX(total_cases) AS highest_infection_count, 
    MAX((total_cases::numeric / NULLIF(population,0))) * 100 AS pcn_pop_infected
FROM covid_deaths
GROUP BY location, population
HAVING MAX((total_cases::numeric / NULLIF(population,0))) IS NOT NULL
ORDER BY pcn_pop_infected DESC
LIMIT 25;

-- look at countries with highest death rate per population
select location, max(cast(total_deaths as int)) as total_death_count
from covid_deaths
where continent is not NULL
GROUP BY location
ORDER BY total_death_count DESC;


-- breakdown by continent
select continent, max(cast(total_deaths as int)) as total_death_count
from covid_deaths
where continent is not NULL
group by continent
order by total_death_count DESC;


-- more accurate data on deaths by continent (in location_col, not in continent column)
select location, max(cast(total_deaths as int)) as total_death_count
from covid_deaths
where continent is NULL
group by location
order by total_death_count desc;

-- query 1 my language
select
    date,
    total_cases,
    total_deaths,
    (total_deaths/total_cases)*100 as Death_pcn
from covid_deaths
where continent is not NULL
order by 1,2;

-- examine global new cases by date
select date, sum(new_cases)
from covid_deaths
where continent is not NULL
group by date
order by 1,2;

select date, sum(new_cases), sum(new_deaths)
from covid_deaths
where continent is not NULL
group by date
order by 1,2;

select 
    date,
    sum(new_cases),
     sum(cast(new_deaths as int)),
     round(sum(cast(new_deaths as int))/sum(cast(new_cases as int))*100, 2) as Death_pcn
from covid_deaths
where continent is not NULL
group by date
order by 1,2;

select 
    sum(new_cases) as total_cases,
    sum(cast(new_deaths as int)) as total_deaths,
    sum(cast(new_deaths as int))/sum(new_cases)*100 as Death_pcn
from covid_deaths
where continent is not NULL
order by 1,2;

-- merge covid death and covid vaccine dfs together using INNER join on location and date cols
select *
from covid_deaths AS dea
JOIN covid_vaccines as vac
    on dea.location = vac.location
    AND dea.date = vac.date;

-- look at total population and total vaccination numbers
select dea.continent, dea.location, dea.date, vac.new_vaccinations
from covid_deaths AS dea
JOIN covid_vaccines as vac
    on dea.location = vac.location
    AND dea.date = vac.date
where dea.continent is not NULL
    AND vac.new_vaccinations is not null
order by 2,3;

-- add rolling sum of new vaccination
select dea.continent,
     dea.location,
     dea.date, 
     vac.new_vaccinations,
     sum(cast(vac.new_vaccinations as int)) over (PARTITION BY dea.location order by dea.location, dea.date) as rolling_vac
from covid_deaths AS dea
JOIN covid_vaccines as vac
    on dea.location = vac.location
    AND dea.date = vac.date
where dea.continent is not NULL
    AND vac.new_vaccinations is not null
order by 2,3;


-- use CTE

with popvsVac (continent, location, date, population, new_vaccinations, rolling_vac)
as 
(
    select dea.continent,
     dea.location,
     dea.date,
     dea.population, 
     vac.new_vaccinations,
     sum(cast(vac.new_vaccinations as int)) over (PARTITION BY dea.location order by dea.location, dea.date) as rolling_vac
from covid_deaths AS dea
JOIN covid_vaccines as vac
    on dea.location = vac.location
    AND dea.date = vac.date
where dea.continent is not NULL
    AND vac.new_vaccinations is not null
)
select *, (rolling_vac/population)*100
from popvsVac










-- examine new cases by date for USMCA/NAFTA
select date, sum(new_cases), location
from covid_deaths
where continent is not NULL
AND location in ('United States', 'Canada', 'Mexico')
group by date, location
order by 1,2;
