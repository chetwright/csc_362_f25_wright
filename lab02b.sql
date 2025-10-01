/*
  Lab 02b: MariaDB Tutorial
  CSC 362 Database Systems
  By: Chet Wright
*/

/* Create the database (dropping the previous version if necessary */
DROP DATABASE IF EXISTS school;

CREATE DATABASE school;

USE school;


/* Create the three tables from 7.22 */
CREATE TABLE instructors (
    PRIMARY KEY (inst_last_name),
    inst_first_name       VARCHAR(50),
    inst_last_name        VARCHAR(50),
    campus_phone    	  VARCHAR(8)

);


CREATE TABLE instructor_categories (
	PRIMARY KEY (inst_last_name,category_taught),
	inst_first_name		VARCHAR(50),
	inst_last_name		VARCHAR(50),
	category_taught		VARCHAR(4),
	max_level		VARCHAR(20)
);

CREATE TABLE languages(
	PRIMARY KEY (inst_last_name,lang),
	inst_first_name		VARCHAR(50),
	inst_last_name		VARCHAR(50),
	lang			VARCHAR(20)
);


	
/* Populate the tables with sample data */
INSERT INTO instructors (inst_first_name, inst_last_name, campus_phone)
VALUES ('Kira', 'Bently', '363-9948'),
       ('Timothy', 'Ennis', '527-4992'),
       ('Shannon', 'Black', '336-5992'),
       ('Estela', 'Rosales', '322-6992');

INSERT INTO instructor_categories (inst_first_name, inst_last_name, category_taught, max_level)
VALUES ('Kira', 'Bently', 'DTP', 'Intermediate'),
       ('Kira', 'Bently', 'OS', 'Advanced'),
       ('Kira', 'Bently', 'SS', 'Basic'),
       ('Kira', 'Bently', 'WP', 'Advanced'),
       ('Timothy', 'Ennis', 'DB', 'Intermediate'),
       ('Timothy', 'Ennis', 'OS', 'Basic'),
       ('Timothy', 'Ennis', 'UT', 'Basic'),
       ('Timothy', 'Ennis', 'WP', 'Advanced');
INSERT INTO languages (inst_first_name, inst_last_name, lang)
VALUES ('Kira', 'Bently', 'French'),
       ('Kira', 'Bently', 'Spanish'),
       ('Timothy', 'Ennis', 'German'),
       ('Timothy', 'Ennis', 'Spanish'),
       ('Shannon', 'Black', 'French'),
       ('Shannon', 'Black', 'German'),
       ('Estela', 'Rosales', 'French'),
       ('Estela', 'Rosales', 'Italian'),
       ('Estela', 'Rosales', 'Spanish');

/* Display languages spoken  */
SELECT inst_last_name FROM instructors;

SELECT lang AS 'Rosales Languages'
FROM languages
JOIN instructors USING (inst_last_name)
WHERE inst_last_name = 'Rosales';

SELECT category_taught AS 'Ennis Categories'
FROM instructor_categories
JOIN instructors USING (inst_last_name)
WHERE inst_last_name = 'Ennis';


/* End of file lab02_b.sql */
