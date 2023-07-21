-- 1 -- Determine the average duration of movies released by Bolly Movies compared to the industry average.
SELECT
    AVG(CASE WHEN COUNTRY = 'India' and Languages = 'Hindi' THEN duration END) AS bolly_movies_average_duration,
    AVG(duration) AS industry_average_duration
FROM
    MOVIE;
-- average duation of bollywood movies are higher than industry average duration.

-- 2 -- Analyse the correlation between the number of votes and the average rating for movies produced by Bolly Movies.
SELECT
    sum(TOTAL_VOTES) AS NO_OF_VOTE,
    AVG(avg_rating) AS AVG_RATING
FROM ratings
inner join movie on id=movie_id
WHERE COUNTRY= 'INDIA' and languages= 'Hindi'
;

-- 3 -- Find the production house that has consistently produced movies with high ratings over the past three years.
SELECT
    production_company,
    AVG(avg_rating) AS average_rating
FROM movie
JOIN ratings ON movie_id = id
GROUP BY
    production_company
HAVING
    COUNT(DISTINCT year) = 3
ORDER BY
    average_rating DESC;



-- 4 -- Identify the top three directors who have successfully delivered commercially successful movies with high ratings.
SELECT 
    name_id as director_name,
    AVG(avg_rating) AS average_rating
FROM role_mapping
JOIN movie  ON movie_id = id
JOIN ratings using (movie_id)
GROUP BY director_name
HAVING COUNT(*) >= 5
ORDER BY average_rating DESC
LIMIT 3;
