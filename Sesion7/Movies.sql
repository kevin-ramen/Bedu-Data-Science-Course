DROP DATABASE IF EXISTS Netflix;
CREATE DATABASE IF NOT EXISTS Netflix;
USE Netflix;
CREATE TABLE IF NOT EXISTS users(
	userId INT PRIMARY KEY,
    gender CHAR(1),
    age INT,
    occupation INT,
    zipcode NVARCHAR(10)
);

CREATE TABLE IF NOT EXISTS movie(
	movieId INT PRIMARY KEY,
    title VARCHAR(80),
    genre VARCHAR(80)
);

CREATE TABLE IF NOT EXISTS rating(
    userId INT,
    movieId INT,
    rating INT,
    time_stamp BIGINT,
    FOREIGN KEY (userId) REFERENCES users(userId),
    FOREIGN KEY (movieId) REFERENCES movie(movieId)
);
Select * from movie;
