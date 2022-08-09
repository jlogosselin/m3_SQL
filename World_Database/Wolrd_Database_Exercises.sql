
-- ACTIVITY 1:


select top 10 * from city
select top 10 * from country
select top 10 * from countrylanguage

----------------------------------------
----------------------------------------
----------------------------------------
----------------------------------------
----------------------------------------

-- ACTIVITY 2:



select * from city
where Population < 10000
order by Population desc

----------------------------------------
----------------------------------------
----------------------------------------
----------------------------------------
----------------------------------------

-- ACTIVITY 3:

-- the following returns all 4079 rows (but does not use the GROUP BY clause):


select co.Region as region,
	co.Name as country,
	ci.Name as city
from city ci
inner join country co
on co.Code = ci.CountryCode
order by co.Region, co.Name, ci.Name


-- the following uses the GROUP BY clause, as prescribed by the exercise, but only returns 4056 rows...:


select co.Region as region,
	co.Name as country,
	ci.Name as city
from city ci
inner join country co
on co.Code = ci.CountryCode
group by co.Region, co.Name, ci.Name
order by co.Region, co.Name, ci.Name

----------------------------------------
----------------------------------------
----------------------------------------
----------------------------------------
----------------------------------------

-- ACTIVITY 4:


-- testing the table:

select cl.CountryCode as country_code, co.Name as country_name, cl.Language from countrylanguage cl
full join country co
on co.Code = cl.CountryCode
where cl.Language = 'French'
order by cl.Percentage desc

select * from countrylanguage
where CountryCode = 'FRA'

select * from countrylanguage
where CountryCode = 'BEL'

select * from countrylanguage
where CountryCode = 'SPM'


-- solution:


select CountryCode as country_code,
	Language as language_spoken,
	STRING_AGG(IsOfficial, ',') as is_official_or_not,
	Percentage from countrylanguage
where Language = 'French'
group by CountryCode, Language, Percentage
order by Percentage desc


----------------------------------------
----------------------------------------
----------------------------------------
----------------------------------------
----------------------------------------

-- ACTIVITY 5:


select Name as countryNameWithNoYearOfIndependence, Continent, Population
from country
where IndepYear is null
order by Population


----------------------------------------
----------------------------------------
----------------------------------------
----------------------------------------
----------------------------------------

-- ACTIVITY 6:

select c.Continent as continent,
	c.Name as countryName,
	cl.Language as languageSpoken,
	cl.Percentage
from country c
full join countrylanguage cl
on cl.CountryCode = c.Code
order by c.Name asc, cl.Percentage desc


----------------------------------------
----------------------------------------
----------------------------------------
----------------------------------------
----------------------------------------

-- ACTIVITY 7:


select c.Name as countryName, c.Continent from country c
full join countrylanguage cl
on cl.CountryCode = c.Code
where cl.Language is null
order by c.Continent, c.Name asc


----------------------------------------
----------------------------------------
----------------------------------------
----------------------------------------
----------------------------------------

-- ACTIVITY 8:


-- standard solution from one table:

select Name, Population
from country
where Population is not null
order by Population asc


-- solution:

select co.Name as countryName, sum(city.Population) as totalCityPopulation
from country co
inner join city city
on city.CountryCode = co.Code
group by co.Name
order by sum(city.Population) asc


----------------------------------------
----------------------------------------
----------------------------------------
----------------------------------------
----------------------------------------

-- ACTIVITY 9:


select country.Continent, avg(city.Population) as averageCityPopulation
from city
full join country
on country.Code = city.CountryCode
group by country.Continent
order by avg(city.Population) desc


----------------------------------------
----------------------------------------
----------------------------------------
----------------------------------------
----------------------------------------

-- ACTIVITY 10:


select top 10 Name, GNP
from country
order by GNP desc

----------------------------------------
----------------------------------------
----------------------------------------
----------------------------------------
----------------------------------------

-- ACTIVITY 11:


-- solution:

select ci.Name as capitalCity,
	c.Name as countryName,
	ci.Population as cityPopulation,
	cl.Language as officialLanguage
from country c
inner join countrylanguage cl
on cl.CountryCode = c.Code
inner join city ci
on ci.ID = c.Capital
order by ci.Name



-- better solution:


select ci.Name as capitalCity,
	c.Name as countryName,
	ci.Population as cityPopulation,
	STRING_AGG(cl.Language, ',') as officialLanguages
from country c
inner join countrylanguage cl
on cl.CountryCode = c.Code
inner join city ci
on ci.ID = c.Capital
group by ci.Name, c.Name, ci.Population
order by ci.Name



----------------------------------------
----------------------------------------
----------------------------------------
----------------------------------------
----------------------------------------

-- ACTIVITY 12:



select co.Name as countryName, ci.Name as capitalName
from city ci
right join country co
on co.Capital = ci.ID
order by co.Name
