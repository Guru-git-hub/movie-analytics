-- movies table
CREATE TABLE movies (
    movie_id INT PRIMARY KEY,
    title VARCHAR(100),
    genre VARCHAR(50),
    release_year INT,
    rating DECIMAL(3,1)
);

-- directors table
CREATE TABLE directors (
    director_id INT PRIMARY KEY,
    name VARCHAR(100)
);

-- movie_directors table (many-to-many)
CREATE TABLE movie_directors (
    movie_id INT,
    director_id INT,
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
    FOREIGN KEY (director_id) REFERENCES directors(director_id)
);

-- actors table
CREATE TABLE actors (
    actor_id INT PRIMARY KEY,
    name VARCHAR(100)
);

-- movie_actors table (many-to-many)
CREATE TABLE movie_actors (
    movie_id INT,
    actor_id INT,
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
    FOREIGN KEY (actor_id) REFERENCES actors(actor_id)
);
