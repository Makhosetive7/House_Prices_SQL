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

--Number of house built (Neighborhood)
SELECT Neighborhood, COUNT(*) As Total_number_houses
FROM Local_housing_prices..Prices_Dataset
GROUP BY Neighborhood
ORDER BY Neighborhood;

--Total number of Houses built every year per Urban Neighborhood
SELECT  YearBuilt, COUNT(*) AS NumberOfHouses
FROM Local_housing_prices..Prices_dataset
WHERE Neighborhood = 'Urban'
GROUP BY YearBuilt
ORDER BY YearBuilt;

--Total number of Houses built every year per Rural Neighborhood
SELECT  YearBuilt, COUNT(*) AS NumberOfHouses
FROM Local_housing_prices..Prices_dataset
WHERE Neighborhood = 'Rural'
GROUP BY YearBuilt
ORDER BY YearBuilt;

--Total houses built in Neighborhood every year
SELECT Neighborhood, YearBuilt, COUNT(*) AS NumberOfHouses
FROM Local_housing_prices..Prices_dataset
GROUP BY YearBuilt, Neighborhood
ORDER BY YearBuilt, Neighborhood;

--Total number of Houses listed in the last 10years
SELECT Neighborhood, COUNT(*) As Houses_listed_in_past_10yrs
FROM Local_housing_prices..Prices_Dataset
WHERE YearBuilt BETWEEN 2013 AND 2023
GROUP BY Neighborhood;

--Total SquareFeet by Neighborhood
SELECT Neighborhood, SUM(SquareFeet) AS TotalSquareFeet
FROM Local_housing_prices..Prices_dataset
GROUP BY Neighborhood;

--Average price per  Neighborhood
SELECT Neighborhood,  round(Avg(Price), 3) As Urban_house_average_price
FROM Local_housing_prices..Prices_Dataset
GROUP BY  Neighborhood
ORDER BY  Neighborhood

--Average prices grouped by number of Bedrooms
SELECT Neighborhood, Bedrooms, AVG(Price) AS AveragePrice
FROM Local_housing_prices..Prices_dataset
GROUP BY Neighborhood, Bedrooms
ORDER BY Neighborhood, Bedrooms;


--Average prices grouped by number of Bathrooms
SELECT Neighborhood, Bathrooms, AVG(Price) AS AveragePrice
FROM Local_housing_prices..Prices_dataset
GROUP BY Neighborhood, Bathrooms
ORDER BY Neighborhood, Bathrooms;

--Average Average SquareFeet per Neighborhood
SELECT Neighborhood, AVG(SquareFeet) AS AverageSquareFeet
FROM Local_housing_prices..Prices_dataset
GROUP BY Neighborhood;

--Average Price by Neighborhood
SELECT Neighborhood, AVG(Price) AS AveragePrice
FROM Local_housing_prices..Prices_dataset
GROUP BY Neighborhood;

--Most Expensive House in Each Neighborhood
  SELECT Neighborhood, MAX(Price) AS MostExpensiveHouse
  FROM Local_housing_prices..Prices_dataset
  GROUP BY Neighborhood;
