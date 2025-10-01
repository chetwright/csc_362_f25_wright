/*
	lab02_sol.sql
	Table Creation and Data Manipulation
	CSC 362
	Chet Wright
*/

DROP DATABASE IF EXISTS movie_ratings;
CREATE DATABASE movie_ratings;
USE movie_ratings;
DROP TABLE IF EXISTS consumers;
CREATE TABLE consumers (
	consumer_id INT AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	address VARCHAR(100),
	city VARCHAR(100),
	state VARCHAR(2),
	ZIP VARCHAR(5)
);
DROP TABLE IF EXISTS movies;
CREATE TABLE movies (
	movie_id INT AUTO_INCREMENT PRIMARY KEY,
	movie_title VARCHAR(100),
	release_date VARCHAR(10),/*format of xxxx-xx-xx*/
	genre VARCHAR(50)
);
DROP TABLE IF EXISTS ratings;
CREATE TABLE ratings (
	rating_id INT AUTO_INCREMENT PRIMARY KEY,
	consumer_id INT,
	movie_ID INT,
	rating INT,
	rating_date VARCHAR(10), /*Same format as before in movie release, note maybe 
				find way to limit rating to number 1-5 later*/
	FOREIGN KEY (consumer_id) REFERENCES consumers (consumer_id)
		ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (movie_id) REFERENCES movies (movie_id)
		ON DELETE CASCADE ON UPDATE CASCADE
);

SHOW CREATE TABLE consumers;
SHOW CREATE TABLE movies;
SHOW CREATE TABLE ratings;

INSERT INTO movies (movie_title, release_date, genre) VALUES
	('The Hunt For Red October', '1990-03-02', 'Action, Adventure, Thriller'),
	('Lady Bird', '2017-12-01', 'Comedy, Drama'),
	('Inception', '2010-08-16', 'Action, Adventure, Science Fiction'),
	('Monty Python and the Holy Grail', '1975-04-03', 'Comedy');

INSERT INTO consumers (first_name, last_name, address, city, state, ZIP) VALUES
	('Toru', 'Okada', '800 Glenridge Ave Hobart', 'Hobart', 'IN', '46343'),
	('Kumiko', 'Okada', '864 NW Bohemia St', 'Vincentown', 'NJ', '08088'),
	('Noboru', 'Wataya', '342 Joy Ridge St', 'Hermitage', 'TN', '37076'),
	('May', 'Kasahara', '5 Kent Rd', 'East Haven', 'CT', '06512');	
INSERT INTO ratings (movie_id, consumer_id, rating_date, rating) VALUES
	(1, 1, '2010-09-02', 4),
	(1, 3, '2012-08-05', 3),
	(1, 4, '2016-10-02', 1),
	(2, 3, '2017-03-27', 2),
	(2, 4, '2018-08-02', 4);

SELECT * FROM consumers;
SELECT * FROM movies;
SELECT * FROM ratings;

SELECT first_name, last_name, movie_title, rating
	FROM movies
		NATURAL JOIN ratings
		NATURAL JOIN consumers;
