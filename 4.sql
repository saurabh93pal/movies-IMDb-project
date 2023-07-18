-- Retrieve the unique list of genres present in the dataset.
SELECT DISTINCT GENRE
FROM GENRE;
-- i have took these steps to find the unique list of Genre in the dataset

-- Identify the genre with the highest number of movies produced overall.
SELECT GENRE, COUNT(TITLE) AS 'NO_OF_MOVIES'
FROM MOVIE
INNER JOIN GENRE ON MOVIE_ID=ID
GROUP BY GENRE
ORDER BY NO_OF_MOVIES DESC
LIMIT 1;
-- From this query we got to know the genre with number of movies produced.

-- Determine the count of movies that belong to only one genre.
SELECT GENRE, COUNT(TITLE) AS 'NO_OF_MOVIES'
FROM MOVIE
INNER JOIN GENRE ON MOVIE_ID=ID
GROUP BY GENRE;
-- i took this steps to find the number of movies if genres.

-- Calculate the average duration of movies in each genre.
SELECT GENRE,
ROUND(AVG(DURATION)) AS 'AVERAGE_DURATION'
FROM MOVIE
INNER JOIN GENRE ON MOVIE_ID=ID
GROUP BY GENRE;
-- by using these steps we got to know the average duration of each genre.

-- Find the rank of the 'thriller' genre among all genres in terms of the number of movies produced.
with CTE as (SELECT genre, COUNT(*) AS movie_count,
       RANK() OVER (ORDER BY COUNT(*) DESC) AS genre_rank
FROM genre
GROUP BY genre
ORDER BY genre_rank)
select genre, genre_rank from CTE where genre = 'Thriller';
-- with the help of this query we got to know the rank of thriller movie according to the number of movies produced.