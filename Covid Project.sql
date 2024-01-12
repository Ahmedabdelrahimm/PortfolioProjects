SELECT *
FROM Portfolio..CovidDeaths
where continent is not null
ORDER BY location,date;


-- Looking at Total Cases vs Total Deaths

Select continent,location, date, total_cases, new_cases, total_deaths, population 
FROM Portfolio..CovidDeaths
where continent is not null
order by location,date;

--Likelihood of death if you contract covid

Select continent,Location, Date, total_cases, total_deaths, round((total_deaths/total_cases)*100,2) AS "Death Percentage"
FROM Portfolio..CovidDeaths
where location = 'egypt'  And continent is not null
order by 2 ;

--Percentae of population who got covid

Select continent,Location, Date, total_cases, population, round((total_cases/population)*100,4) AS "Population Percentage"
FROM Portfolio..CovidDeaths
where location = 'egypt' And continent is not null
order by 2 ;


--Countries with the highest infection rate compared to it's population

Select continent,Location, Population, MAX(total_cases) AS "Highest Total Cases",  round((MAX(total_cases/population))*100,2) AS "Infection Percentage"
FROM Portfolio..CovidDeaths
where continent is not null
Group by location,continent, population
order by 4 desc;

--Countries with the highest death rate compared to it's population

Select continent,Location, Population, MAX(total_deaths) AS "Highest Total Deaths",  round((MAX(total_deaths/population))*100,2) AS "Death Percentage"
FROM Portfolio..CovidDeaths
where continent is not null
Group by location,continent, population
order by 4 desc;

--Countries with the highest death count 

Select continent,Location, MAX(cast(total_deaths as int)) AS "Highest Total Deaths"
FROM Portfolio..CovidDeaths
where continent is not null
Group by continent,location
order by 2 desc;

--LET'S BREAK THINGS DOWN BY CONTINENT  

Select location, MAX(cast(total_deaths as int)) AS "Highest Total Deaths"
FROM Portfolio..CovidDeaths
where continent is null
Group by location
order by 2 desc;

Select continent, MAX(cast(total_deaths as int)) AS "Highest Total Deaths"
FROM Portfolio..CovidDeaths
where continent is not null
Group by continent
order by 2 desc;

--Global Stats

Select Date, sum(new_cases) as "Total cases", sum(cast(new_deaths as int)) as "Total Death", round((sum(cast(new_deaths as int))/sum(new_cases))*100,2) AS "Global Death Percentage"
FROM Portfolio..CovidDeaths
where continent is not null
group by date
order by 1;

--Total Global cases and deaths

Select sum(new_cases) as "Total cases", sum(cast(new_deaths as int)) as "Total Death", round((sum(cast(new_deaths as int))/sum(new_cases))*100,2) AS "Global Death Percentage"
FROM Portfolio..CovidDeaths
where continent is not null
--group by date
order by 1;

-- Looking at total population vs Vaccinations

SELECT dea.continent, dea.location, dea.date, dea.population, dea.total_cases, vac.new_vaccinations
, sum(convert(int,vac.new_vaccinations)) 
Over (partition by dea.location order by dea.location,dea.date) as TotalPeopleVaccinated
FROM Portfolio..CovidDeaths dea 
Join Portfolio..CovidVaccinations vac 
on dea.location= vac.location 
And dea.date= vac.date
where dea.continent is not null
order by 2,3

-- using CTE

WITH PopsvsVac (continent, location, date, population, total_cases, new_vaccinations, totalpeoplevaccinated)
as (
SELECT dea.continent, dea.location, dea.date, dea.population, dea.total_cases, vac.new_vaccinations
, sum(convert(int,vac.new_vaccinations)) 
Over (partition by dea.location order by dea.location,dea.date) as TotalPeopleVaccinated
FROM Portfolio..CovidDeaths dea 
Join Portfolio..CovidVaccinations vac 
on dea.location= vac.location 
And dea.date= vac.date
where dea.continent is not null
)
Select * , round(TotalPeopleVaccinated/population,2)*100 as "People Vaccinated %"
from PopsvsVac
order by 2,3


-- Temp Table

drop table if exists PercentPopulationVaccinated 
create table PercentPopulationVaccinated 
(
continent nvarchar(255),
location nvarchar(255),
date datetime,
population numeric,
total_cases NUMERIC,
new_vaccination numeric,
Totalpeoplevaccinated numeric
)


Insert into PercentPopulationVaccinated 
SELECT dea.continent, dea.location, dea.date, dea.population, dea.total_cases, vac.new_vaccinations
, sum(convert(int,vac.new_vaccinations)) 
Over (partition by dea.location order by dea.location,dea.date) as TotalPeopleVaccinated
FROM Portfolio..CovidDeaths dea 
Join Portfolio..CovidVaccinations vac 
on dea.location= vac.location 
And dea.date= vac.date
where dea.continent is not null

Select * , round(TotalPeopleVaccinated/population,2)*100 as "People Vaccinated %"
from PercentPopulationVaccinated
order by 1,2,3


-- Creating view to store data for visualization

create view PercentPopVac as
	SELECT dea.continent, dea.location, dea.date, dea.population, dea.total_cases, vac.new_vaccinations
, sum(convert(int,vac.new_vaccinations)) 
Over (partition by dea.location order by dea.location,dea.date) as TotalPeopleVaccinated
FROM Portfolio..CovidDeaths dea 
Join Portfolio..CovidVaccinations vac 
on dea.location= vac.location 
And dea.date= vac.date
where dea.continent is not null

select *
from PercentPopVac


create view continent as
Select location, MAX(cast(total_deaths as int)) AS "Highest Total Deaths"
FROM Portfolio..CovidDeaths
where continent is null
Group by location
