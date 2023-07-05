-- ***********************
-- Name: Shawn Ogbomo
-- ID: 022609127
-- Date: Monday, June 14, 2021
-- Purpose: Lab 03 DBS211
-- ***********************
-- Q1 SOLUTION --
CREATE TABLE L5_MOVIES
(
    m_id NUMBER PRIMARY KEY,
    title VARCHAR(35) NOT NULL,
    release_year NUMBER NOT NULL,
    director NUMBER NOT NULL,
    score DECIMAL(3,2)
    CHECK (score <= 5 AND score>= 0)
);

CREATE TABLE L5_ACTORS
(
    a_id NUMBER PRIMARY KEY, 
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(30) NOT NULL
);

CREATE TABLE L5_CASTINGS
(
    movie_id NUMBER
    ,actor_id NUMBER
    ,m_id NUMBER
    ,a_id NUMBER
    ,PRIMARY KEY (movie_id, actor_id)
    ,CONSTRAINT L5_MOVIES FOREIGN KEY (m_id)
    REFERENCES L5_MOVIES(m_id)
    ,CONSTRAINT L5_ACTORS FOREIGN KEY (a_id)
    REFERENCES L5_ACTORS
);


CREATE TABLE L5_DIRECTORS
(
    director_id NUMBER PRIMARY KEY ,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(30) NOT NULL
);

-- Q2 SOLUTION --
    INSERT INTO L5_DIRECTORS VALUES(1010, 'Rob', 'Minkoff');
    INSERT INTO L5_DIRECTORS VALUES(1020, 'Bill', 'Condon');
    INSERT INTO L5_DIRECTORS VALUES(1050, 'Josh', 'Cooley');
    INSERT INTO L5_DIRECTORS VALUES(2010, 'Brad', 'Bird');
    INSERT INTO L5_DIRECTORS VALUES(3020, 'Lake', 'Bell');
    SELECT *
    FROM L5_DIRECTORS;
   
    INSERT INTO L5_MOVIES VALUES (100, 'The Lion King', 2019, 3020, 3.50);
    INSERT INTO L5_MOVIES VALUES (200, 'Beauty and the Beast', 2017, 1050, 4.20);
    INSERT INTO L5_MOVIES VALUES (300, 'Toy Story 4', 2019, 1020, 4.50);
    INSERT INTO L5_MOVIES VALUES (400, 'Mission Impossible', 2018,	2010, 5.00);
    INSERT INTO L5_MOVIES VALUES (500, 'The Secret Life of Pets', 2016,	1010, 3.90);
    SELECT   M_ID, TITLE, RELEASE_YEAR, DIRECTOR, to_char(SCORE,'999999.00') AS SCORE 
    FROM L5_MOVIES
    ORDER BY m_id;
   


-- Q3 SOLUTION --
/*Yes the order of deletion is important when removing because there are tables that contain primary keys which are being 
referenced in other tables. To remove the tables successfully, the foreign key constraints must be removed from the child tables before the parent tables.
*/
DROP TABLE L5_DIRECTORS;
DROP TABLE L5_CASTINGS;
DROP TABLE L5_MOVIES;
DROP TABLE L5_ACTORS;

-- Q4 SOLUTION --
CREATE TABLE DEPARTMENTS2 AS
(SELECT * FROM DEPARTMENTS1);

-- Q5 SOLUTION --
ALTER TABLE DEPARTMENTS2
ADD username VARCHAR2(30);


-- Q6 SOLUTION --
UPDATE DEPARTMENTS2 SET Department_Name='IT'
WHERE Location_id = 1700;

-- Q7 SOLUTION --
DELETE 
FROM DEPARTMENTS2
WHERE Location_id IS NULL;
--Q8 SOLUTION --
DELETE FROM DEPARTMENTS2;
--Q9 SOLUTION --
DROP TABLE DEPARTMENTS2;