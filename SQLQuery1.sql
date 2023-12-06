select *
from Local_housing_prices..Prices_dataset

--Data cleaning
--Rounding of prices to 2 decimal places
UPDATE Local_housing_prices..Prices_dataset
SET Price = CONVERT(DECIMAL(10,2), Price);

--Inspecting unique values
select distinct Bedrooms from  Local_housing_prices..Prices_dataset
select distinct Bathrooms from  Local_housing_prices..Prices_dataset
select distinct YearBuilt from  Local_housing_prices..Prices_dataset
select distinct Price from  Local_housing_prices..Prices_dataset

--Group Rural houses separately
SELECT SquareFeet, Bedrooms, Bathrooms, Neighborhood, YearBuilt, Price
FROM Local_housing_prices..Prices_dataset
WHERE Neighborhood = 'Rural';

--Group Urban homes separately
SELECT SquareFeet, Bedrooms, Bathrooms, Neighborhood, YearBuilt, Price
FROM Local_housing_prices..Prices_dataset
WHERE Neighborhood = 'Urban';

--Number of house built in rural areas(Neighborhood)
SELECT count(*) As Total_number_of_rural_houses
FROM Local_housing_prices..Prices_Dataset
WHERE Neighborhood = 'Rural'

--Number of house built in urban areas(Neighborhood)
SELECT count(*) As Total_number_of_urban_houses
FROM Local_housing_prices..Prices_Dataset
WHERE Neighborhood = 'Urban'

--List of Houses built in the last 10years
Select SquareFeet, Bedrooms, Bathrooms, Neighborhood, YearBuilt, Price  As Houses_listed_in_past_10yrs
FROM Local_housing_prices..Prices_Dataset
WHERE YearBuilt between 2013 and 2023
ORDER BY YearBuilt Asc

--Total number of Houses listed in the last 10years
Select count(*) As Houses_listed_in_past_10yrs
FROM Local_housing_prices..Prices_Dataset
WHERE YearBuilt between 2013 and 2023

--List of Urban Houses built in the last 10years
SELECT SquareFeet, Bedrooms, Bathrooms, Neighborhood, YearBuilt, Price  As Urban_Houses_in_past_10yrs
FROM Local_housing_prices..Prices_Dataset
WHERE Neighborhood = 'Urban' and YearBuilt between 2013 and 2023
ORDER BY YearBuilt Asc

--Number of Rural houses built in the last 10 years
SELECT SquareFeet, Bedrooms, Bathrooms, Neighborhood, YearBuilt, Price  As Urban_Houses_in_past_10yrs
FROM Local_housing_prices..Prices_Dataset
WHERE Neighborhood = 'Rural' and YearBuilt between 2013 and 2023
ORDER BY YearBuilt Asc

--Average price for Urban houses
SELECT round(Avg(Price), 3) As Urban_house_average_price
FROM Local_housing_prices..Prices_Dataset
WHERE Neighborhood = 'Urban'

--Average price for Rural houses
SELECT round(Avg(Price), 3) As Rural_house_average_price
FROM Local_housing_prices..Prices_Dataset
WHERE Neighborhood = 'Rural'

--Average prices grouped by number of Bedrooms
SELECT Bedrooms, AVG(Price) AS AveragePrice
FROM Local_housing_prices..Prices_dataset
GROUP BY Bedrooms;

--Average prices grouped by number of Bathrooms
SELECT Bathrooms, AVG(Price) AS AveragePrice
FROM Local_housing_prices..Prices_dataset
GROUP BY Bathrooms;

--Average SquareFeet for all Houses
SELECT AVG(SquareFeet) AS AverageSquareFeet
FROM Local_housing_prices..Prices_dataset;

--Average Average SquareFeet per Neighborhood
SELECT Neighborhood, AVG(SquareFeet) AS AverageSquareFeet
FROM Local_housing_prices..Prices_dataset
GROUP BY Neighborhood;

--Most expensive House in Urban Neighbouhood
SELECT max(Price) as Most_expensive_urban_house
FROM Local_housing_prices..Prices_dataset
WHERE Neighborhood = 'Urban'

--Least expensive House in Urban Neighbouhood
SELECT min(Price) as Least_expensive_urban_house
FROM Local_housing_prices..Prices_dataset
WHERE Neighborhood = 'Urban'

--Most expensive House in Rural Neighbouhood
SELECT max(Price) as Most_expensive_Rural_house
FROM Local_housing_prices..Prices_dataset
WHERE Neighborhood = 'Rural'

--Least expensive House in Rural Neighbouhood
SELECT min(Price) as Least_expensive_Rural_house
FROM Local_housing_prices..Prices_dataset
WHERE Neighborhood = 'Rural'


