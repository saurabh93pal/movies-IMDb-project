-- Determine the total number of movies released each year and analyse the month-wise trend.
SELECT YEAR, COUNT(TITLE) AS 'NO_OF_MOVIES'
FROM MOVIE
GROUP BY YEAR;
-- from this query we got to know the number of movies released in each year.

SELECT MONTH(date_published) AS 'NO_OF_MONTH', COUNT(TITLE) AS 'NO_OF_MOVIES'
FROM MOVIE
GROUP BY MONTH(date_published)
ORDER BY NO_OF_MONTH;
-- i have used this steps to find the number of Movie released in each month

-- Calculate the number of movies produced in the USA or India in the year 2019
SELECT year, COUNT(TITLE) AS 'NO_OF_MOVIES'
FROM MOVIE
WHERE YEAR=2019 AND (COUNTRY LIKE '%USA%' OR COUNTRY LIKE '%India%')
GROUP BY YEAR;
-- with the help of this query we got to know the number of Movies released in India or USA in the year 2019