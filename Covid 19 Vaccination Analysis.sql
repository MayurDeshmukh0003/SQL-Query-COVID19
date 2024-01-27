use [covid19]; 
#Database

SELECT  max(total_cases) AS Total_Cases
FROM [dbo].[vaccination-data]
group by location;
#total cases as per location wise 

SELECT SUM(Total_Cases) AS Grand_Total
FROM (
    SELECT MAX(total_cases) AS Total_Cases
    FROM [dbo].[vaccination-data]
    GROUP BY location
) AS MaxTotalPerLocation;
#total cases universally

SELECT location, MAX(total_deaths) AS max_total_deaths
FROM [dbo].[vaccination-data]
GROUP BY location;
#total death location wise 

select sum(total_deaths) as Grand_Total_Death from (SELECT location, MAX(total_deaths) AS max_total_deaths
FROM [dbo].[vaccination-data]
GROUP BY location) as Max_Total_Deaths ;
#deaths by locations

SELECT SUM(Max_Total_Deaths) AS Total_Deaths
FROM (
    SELECT MAX(total_deaths) AS Max_Total_Deaths
    FROM [dbo].[vaccination-data]
    GROUP BY location
) AS MaxDeathsByLocation;   
# Total deaths

SELECT location, MAX(total_vaccinations) AS max_total_vaccinations
FROM [dbo].[vaccination-data]
GROUP BY location;
#vaccination done according to location

select sum (max_total_vaccinations) as Total_Vaccination_Done 
from (SELECT location, MAX(total_vaccinations) AS max_total_vaccinations
	FROM [dbo].[vaccination-data]
		GROUP BY location) as total_vaccination_donee;
#Total vaccination done

SELECT location, MAX(people_vaccinated_per_hundred) AS max_people_vaccinated_per_hundred
FROM [dbo].[vaccination-data]
GROUP BY location;
#people vaccination per 100

SELECT location, MAX(hospital_beds_per_thousand) AS max_hospital_beds_per_thousand
FROM [dbo].[vaccination-data]
GROUP BY location;
#Hospital Beds per Thousand

SELECT location, AVG(excess_mortality) AS avg_excess_mortality
FROM [dbo].[vaccination-data]
GROUP BY location;
#Excess Mortality Rate

SELECT location, AVG(positive_rate) AS avg_positive_rate
FROM [dbo].[vaccination-data]
GROUP BY location;
#Positive Rate (%):

SELECT location, MAX(life_expectancy) AS max_life_expectancy
FROM [dbo].[vaccination-data]
GROUP BY location;
#Life Expectancy

SELECT location, MAX(icu_patients_per_million) AS max_icu_patients_per_million
FROM [dbo].[vaccination-data]
GROUP BY location;
#ICU Patients per Million

###################################################################################################


#Alalysis

SELECT TOP 5 location, MAX(total_cases) AS max_total_cases
FROM [dbo].[vaccination-data]
GROUP BY location
ORDER BY max_total_cases DESC;
#Top 5 Countries by Total Cases

SELECT location, AVG(excess_mortality) AS avg_excess_mortality
FROM [dbo].[vaccination-data]
GROUP BY location
ORDER BY avg_excess_mortality DESC;
#Countries with the Highest Excess Mortality Rate

SELECT date, SUM(total_vaccinations) OVER (ORDER BY date) AS cumulative_vaccinations
FROM [dbo].[vaccination-data]
ORDER BY date;
#Vaccination Progress Over Time

SELECT continent, AVG(positive_rate) AS avg_positive_rate
FROM [dbo].[vaccination-data]
GROUP BY continent;
#Average Positive Rate Across Continents

SELECT location, population, median_age, gdp_per_capita
FROM [dbo].[vaccination-data];
#Demographic Analysis


###################################################################################################