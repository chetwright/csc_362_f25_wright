/*
	lab02_sol.sql
	Table Creation and Data Manipulation
	CSC 362
	Chet Wright
*/

DROP DATABASE IF EXISTS movie_ratings;
CREATE DATABASE movie_ratings;
USE movie_ratings;

CREATE TABLE consumers (
	consumer_id INT AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	address VARCHAR(100),
	city VARCHAR(100),
	state VARCHAR(2),
	ZIP VARCHAR(5)
);

CREATE TABLE movies (
	movie_id INT AUTO_INCREMENT PRIMARY KEY,
	movie_title VARCHAR(100),
	release_date VARCHAR(10),/*format of xxxx-xx-xx*/
	genre VARCHAR(50)
);

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
		ON DELETE CASCODE ON UPDATE CASCADE
);
INSERT INTO movies (movie_title, release_date, genre) VALUES

INSERT INTO consumers (first_name, last_name, address, city, state, ZIP) VALUES
	('Toru', 'Okada', '800 Glenridge Ave Hobart', 'Hobart', 'IN', '46343'),
	('Kumiko', 'Okada', '864 NW Bohemia St', 'Vincentown', 'NJ', '08088'),
	('Noboru', 'Wataya', '342 Joy Ridge St', 'Hermitage', 'TN', '37076'),
	('May', 'Kasahara', '5 Kent Rd', 'East Haven', 'CT', '06512');	
