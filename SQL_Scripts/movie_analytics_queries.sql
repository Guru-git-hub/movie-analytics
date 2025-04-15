
--1. Top 10 Highest-Grossing Movies per Year:
SELECT movie_id, movie_title, release_year, box_office
FROM movies
WHERE release_year BETWEEN 2000 AND 2020
ORDER BY box_office DESC
LIMIT 10;

--2. Most Successful Director (by total box office):
SELECT directors.director_name, SUM(movies.box_office) AS total_box_office
FROM directors
JOIN movie_director ON directors.director_id = movie_director.director_id
JOIN movies ON movie_director.movie_id = movies.movie_id
GROUP BY directors.director_name
ORDER BY total_box_office DESC
LIMIT 1;

--3. Average Rating for Each Genre:
SELECT genres.genre_name, AVG(movies.rating) AS average_rating
FROM genres
JOIN movie_genre ON genres.genre_id = movie_genre.genre_id
JOIN movies ON movie_genre.movie_id = movies.movie_id
GROUP BY genres.genre_name
ORDER BY average_rating DESC;

--4. Most Frequent Actor-Director Collaborations:
SELECT actors.actor_name, directors.director_name, COUNT(*) AS collaboration_count
FROM actors
JOIN movie_actor ON actors.actor_id = movie_actor.actor_id
JOIN movie_director ON movie_actor.movie_id = movie_director.movie_id
JOIN directors ON movie_director.director_id = directors.director_id
GROUP BY actors.actor_name, directors.director_name
ORDER BY collaboration_count DESC
LIMIT 10;

--5. Identify Most Profitable Movie Genres:
SELECT genres.genre_name, SUM(movies.box_office - movies.production_cost) AS profit
FROM genres
JOIN movie_genre ON genres.genre_id = movie_genre.genre_id
JOIN movies ON movie_genre.movie_id = movies.movie_id
GROUP BY genres.genre_name
ORDER BY profit DESC
LIMIT 5;
