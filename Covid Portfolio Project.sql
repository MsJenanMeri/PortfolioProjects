-- Select Data that we are going to be using
SELECT location, date, total_cases, new_cases, total_deaths, population
FROM PortfolioProject..CovidDeaths$
ORDER BY 1,2

-- Looking at Total Cases Vs Total Deaths in the United States
SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases) * 100 AS Death_Percentage
FROM PortfolioProject..CovidDeaths$
WHERE location LIKE '%states%'
ORDER BY 1,2

-- Looking at Total Cases Vs Population in the United States
SELECT location, date, total_cases, population, (total_cases/population) * 100 AS Percent_Population_Infected
FROM PortfolioProject..CovidDeaths$
WHERE location LIKE '%states%'
ORDER BY 1,2

-- Looking at Countries with highest infection rate compared to population
SELECT location, MAX(total_cases) AS Highest_infection_count, population, MAX((total_cases/population)) * 100 AS Percent_Population_Infected
FROM PortfolioProject..CovidDeaths$
GROUP BY population, location
ORDER BY Percent_Population_Infected DESC

-- Showing the Countries with the Highest Death Count Per Population
SELECT location, MAX(cast(total_deaths as int)) AS Total_Death_Count
FROM PortfolioProject..CovidDeaths$
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY Total_Death_Count DESC

-- CONTINENT STATISTICS

-- Showing the continets witht he highest death count per popualtion
SELECT continent, MAX(cast(total_deaths as int)) AS Total_Death_Count
FROM PortfolioProject..CovidDeaths$
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY Total_Death_Count DESC

-- Global Numbers
SELECT SUM(new_cases) AS total_cases, SUM(cast(new_deaths as int)) AS total_deaths, SUM(cast(new_deaths as int))/SUM(new_cases) * 100 AS Death_Percentage
FROM PortfolioProject..CovidDeaths$
WHERE continent IS NOT NULL
order by 1,2

-- Looking at Total Popualtion Vs Vaccinations
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(Cast(vac.new_vaccinations as int)) OVER (Partition BY dea.location ORDER BY dea.location,
dea.date) AS Rolling_People_Vaccinated
FROM PortfolioProject..CovidDeaths$ dea
JOIN PortfolioProject..CovidVaccinations$ vac
	ON dea.location = vac.location
	AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
ORDER BY 2,3

-- Use CTE
WITH PopvsVac (continent, location, date, population, new_vaccinations, Rolling_People_Vaccinated)
AS 
(
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(Cast(vac.new_vaccinations as int)) OVER (Partition BY dea.location ORDER BY dea.location,
dea.date) AS Rolling_People_Vaccinated
FROM PortfolioProject..CovidDeaths$ dea
JOIN PortfolioProject..CovidVaccinations$ vac
	ON dea.location = vac.location
	AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
)
SELECT *, (Rolling_People_Vaccinated / population) * 100
FROM PopvsVac

-- Temp table
DROP TABLE if exists #Percent_Population_Vaccinated
CREATE TABLE #Percent_Population_Vaccinated
(
Continent nvarchar(255), 
location nvarchar(255),
Date datetime,
population numeric, 
New_Vaccinations numeric,
Rolling_People_Vaccinated numeric,
)

INSERT INTO #Percent_Population_Vaccinated
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(Cast(vac.new_vaccinations as int)) OVER (Partition BY dea.location ORDER BY dea.location,
dea.date) AS Rolling_People_Vaccinated
FROM PortfolioProject..CovidDeaths$ dea
JOIN PortfolioProject..CovidVaccinations$ vac
	ON dea.location = vac.location
	AND dea.date = vac.date
WHERE dea.continent IS NOT NULL

SELECT *, (Rolling_People_Vaccinated / population) * 100
FROM #Percent_Population_Vaccinated

-- Creating View to Store Data for later Visualizations
Create View Percent_Population_Vaccinated AS 
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(Cast(vac.new_vaccinations as int)) OVER (Partition BY dea.location ORDER BY dea.location,
dea.date) AS Rolling_People_Vaccinated
FROM PortfolioProject..CovidDeaths$ dea
JOIN PortfolioProject..CovidVaccinations$ vac
	ON dea.location = vac.location
	AND dea.date = vac.date
WHERE dea.continent IS NOT NULL

SELECT * 
FROM Percent_Population_Vaccinated