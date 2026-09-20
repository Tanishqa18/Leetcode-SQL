# Write your MySQL query statement below
SELECT results
FROM (
    SELECT name AS results
    FROM Users
    JOIN MovieRating USING (user_id)
    GROUP BY user_id, name
    ORDER BY COUNT(*) DESC, name
    LIMIT 1
) AS user_result

UNION ALL

SELECT results
FROM (
    SELECT title AS results
    FROM Movies
    JOIN MovieRating USING (movie_id)
    WHERE created_at >= '2020-02-01'
      AND created_at < '2020-03-01'
    GROUP BY movie_id, title
    ORDER BY AVG(rating) DESC, title
    LIMIT 1
) AS movie_result;
