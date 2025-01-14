/*
Julia Piascik and Bolen Alfreh
Group Project
Animal Management System
Course: CS-311 Database Design
Date: Jan 7. 2025
*/

DROP DATABASE animals;
CREATE DATABASE animals;
USE animals;

-- Table: TYPE_ANIMAL
CREATE TABLE TYPE_ANIMAL (
    ANIMAL_TYPE INT NOT NULL UNIQUE,
    TYPE_NAME VARCHAR(50) NOT NULL,
    PRIMARY KEY (ANIMAL_TYPE)
);

INSERT INTO TYPE_ANIMAL (ANIMAL_TYPE, TYPE_NAME)
VALUES
(1, 'Dog'),    
(2, 'Cat'),    
(3, 'Bird'),   
(4, 'Rabbit'), 
(5, 'Reptile'); 


-- Table: SHELTER
CREATE TABLE SHELTER (
    SHELTER_ID INT NOT NULL UNIQUE,
    SHELTER_NAME VARCHAR(50) NOT NULL,
    SHELTER_ADDRESS VARCHAR(100) NOT NULL,
    PRIMARY KEY (SHELTER_ID)
);

INSERT INTO SHELTER (SHELTER_ID, SHELTER_NAME, SHELTER_ADDRESS)
VALUES
(101, 'Happy Paws Shelter', '34 River Lane, Shelltown, CT'),
(102, 'Safe Haven Animal Shelter', '78 Haven Road, Westville, CT'),
(103, 'Furry Friends Shelter', '91 Forest St, Henryburg, CT'),
(104, 'Save Our Friends Shelter', '101 Clover St, Stamford, CT');


-- Table: ANIMALS
CREATE TABLE ANIMALS (
    ANIMAL_ID INT NOT NULL UNIQUE,
    ANIMAL_LNAME VARCHAR(50) NOT NULL,
    ANIMAL_FNAME VARCHAR(50) NOT NULL,
    ANIMAL_AGE INT NOT NULL,
    ANIMAL_TYPE INT NOT NULL,
    SHELTER_ID INT NOT NULL,
    CHECK (ANIMAL_AGE > 0),
    PRIMARY KEY (ANIMAL_ID),
    FOREIGN KEY (ANIMAL_TYPE) REFERENCES TYPE_ANIMAL (ANIMAL_TYPE),
    FOREIGN KEY (SHELTER_ID) REFERENCES SHELTER (SHELTER_ID)
);

INSERT INTO ANIMALS (ANIMAL_ID, ANIMAL_LNAME, ANIMAL_FNAME, ANIMAL_AGE, ANIMAL_TYPE, SHELTER_ID) 
VALUES 
(111, 'Piascik', 'Buddy', 3, 1, 101), 
(222, 'Alfreh', 'Luna', 2, 2, 102), 
(333, 'Riesco', 'Chirpy', 1, 3, 101),
(444, 'Camaran', 'Daisy', 5, 1, 103),
(666, 'Blue', 'Paris', 2, 2, 103),
(555, 'Smith', 'Mittens', 4, 2, 102),
(888, 'Chi', 'Cherry', 1, 5, 102); 


-- Table: STAFF
CREATE TABLE STAFF (
    STAFF_ID INT NOT NULL UNIQUE,
    STAFF_LNAME VARCHAR(50) NOT NULL,
    STAFF_FNAME VARCHAR(50) NOT NULL,
    STAFF_ROLE VARCHAR(50) NOT NULL, 
    SHELTER_ID INT NOT NULL,
    STAFF_EXPERIENCE INT NOT NULL,
    CHECK (STAFF_EXPERIENCE > 0),
    PRIMARY KEY (STAFF_ID),
    FOREIGN KEY (SHELTER_ID) REFERENCES SHELTER (SHELTER_ID)
);

INSERT INTO STAFF (STAFF_ID, STAFF_LNAME, STAFF_FNAME, STAFF_ROLE, STAFF_EXPERIENCE, SHELTER_ID) 
VALUES 
(123, 'Smith', 'Emily', 'Manager', 5, 101),       
(234, 'Johnson', 'Michael', 'Veterinarian', 8, 102), 
(778, 'Brown', 'Sarah', 'Adoption Representative', 3, 101),
(345, 'Grey', 'Julia', 'Adoption Representative', 1, 102),
(001, 'Brown', 'Olivia', 'Adoption Representative', 9, 103),  
(456, 'Davis', 'John', 'Volunteer', 2, 103),      
(567, 'Miller', 'Anna', 'Admin', 6, 102);        


-- Table: MEDICAL_RECORDS
CREATE TABLE MEDICAL_RECORDS (
    RECORD_ID INT NOT NULL UNIQUE,
    TYPE_NAME VARCHAR(50) NOT NULL,
    ANIMAL_ID INT NOT NULL,
    SHELTER_ID INT NOT NULL,
    PRIMARY KEY (RECORD_ID),
    FOREIGN KEY (SHELTER_ID) REFERENCES SHELTER (SHELTER_ID),
    FOREIGN KEY (ANIMAL_ID) REFERENCES ANIMALS (ANIMAL_ID)
);

INSERT INTO MEDICAL_RECORDS (RECORD_ID, TYPE_NAME, ANIMAL_ID, SHELTER_ID)
VALUES
(1, 'Vaccination', 111, 101), 
(2, 'Spay/Neuter', 222, 102),
(3, 'Routine Check-up', 333, 101), 
(4, 'Vaccination', 444, 103), 
(5, 'Spay/Neuter', 555, 102); 


-- Table: ADOPTERS
CREATE TABLE ADOPTERS (
    ADOPTER_ID INT NOT NULL UNIQUE,
    ADOPTER_LNAME VARCHAR(50) NOT NULL,
    ADOPTER_FNAME VARCHAR(50) NOT NULL,
    ADOPTER_PHONE  VARCHAR(15) NOT NULL UNIQUE,
    ADOPTER_EMAIL VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY (ADOPTER_ID)
);

INSERT INTO ADOPTERS (ADOPTER_ID, ADOPTER_LNAME, ADOPTER_FNAME, ADOPTER_PHONE, ADOPTER_EMAIL)
VALUES
(112, 'Smith', 'John', '203-456-7890', 'john.smith235@gmail.com'),
(223, 'Johnson', 'Mary', '203-654-3710', 'maryjohnson@gmail.com'),
(334, 'Brown', 'James', '203-183-4567', 'jamesb@gmail.com'),
(445, 'Davis', 'Linda', '203-987-6543', 'lindadavis919@gmail.com'),
(556, 'Wilson', 'Patricia', '203-232-3353', 'pwilson@gmail.com');


-- Table: ADOPTIONS
CREATE TABLE ADOPTIONS (
    ADOPTION_ID INT NOT NULL UNIQUE,
    ADOPTION_DATE DATE NOT NULL,
    ANIMAL_ID INT NOT NULL UNIQUE,
    SHELTER_ID INT NOT NULL,
    STAFF_ID INT NOT NULL,
    ADOPTER_ID INT NOT NULL,
    PRIMARY KEY (ADOPTION_ID),
    FOREIGN KEY (SHELTER_ID) REFERENCES SHELTER (SHELTER_ID),
    FOREIGN KEY (ADOPTER_ID) REFERENCES ADOPTERS (ADOPTER_ID),
    FOREIGN KEY (STAFF_ID) REFERENCES STAFF (STAFF_ID),
    FOREIGN KEY (ANIMAL_ID) REFERENCES ANIMALS (ANIMAL_ID)
);

INSERT INTO ADOPTIONS (ADOPTION_ID, ADOPTION_DATE, ANIMAL_ID, SHELTER_ID, STAFF_ID, ADOPTER_ID)
VALUES
(1, '2025-01-01', 111, 101, 123, 112),   
(2, '2025-01-02', 222, 102, 234, 223),   
(3, '2025-01-03', 333, 101, 345, 334),   
(4, '2025-01-04', 444, 103, 456, 445),   
(5, '2025-01-04', 666, 103, 456, 445), 
(6, '2025-01-05', 555, 102, 567, 556);   


-- Data Retrieval

-- Find all animals that are housed at shelter 103, and filter them by age to show only animals older than 2 years:
SELECT ANIMAL_ID, ANIMAL_LNAME, ANIMAL_FNAME, ANIMAL_AGE
FROM ANIMALS
WHERE SHELTER_ID = 103
AND ANIMAL_AGE > 2
ORDER BY ANIMAL_AGE DESC;

-- Find all adopters who adopted from shelter 102:
SELECT ADOPTERS.ADOPTER_ID, ADOPTERS.ADOPTER_LNAME, ADOPTERS.ADOPTER_FNAME, ADOPTERS.ADOPTER_PHONE, ADOPTERS.ADOPTER_EMAIL
FROM ADOPTERS
INNER JOIN ADOPTIONS ON ADOPTERS.ADOPTER_ID = ADOPTIONS.ADOPTER_ID
WHERE ADOPTIONS.SHELTER_ID = 102;

-- Aggregations

-- Calculate the average experience of staff working at shelter 103:
SELECT AVG(STAFF_EXPERIENCE) AS avg_experience
FROM STAFF
WHERE SHELTER_ID = 103;

-- Count how many dogs were adopted and list their names, ages and id:
SELECT ANIMALS.ANIMAL_ID, ANIMALS.ANIMAL_LNAME, ANIMALS.ANIMAL_FNAME, ANIMALS.ANIMAL_AGE, COUNT(ADOPTIONS.ADOPTION_ID) AS ADOPTION_COUNT
FROM ANIMALS
INNER JOIN ADOPTIONS ON ANIMALS.ANIMAL_ID = ADOPTIONS.ANIMAL_ID
WHERE ANIMALS.ANIMAL_TYPE = 1
GROUP BY ANIMALS.ANIMAL_ID, ANIMALS.ANIMAL_LNAME, ANIMALS.ANIMAL_FNAME, ANIMALS.ANIMAL_AGE;

-- Count which animal types has the max and min number of adoptions:

-- MAX:
SELECT ANIMALS.ANIMAL_TYPE, TYPE_ANIMAL.TYPE_NAME, COUNT(ADOPTIONS.ADOPTION_ID) AS ADOPTION_COUNT
FROM ANIMALS
INNER JOIN ADOPTIONS ON ANIMALS.ANIMAL_ID = ADOPTIONS.ANIMAL_ID
INNER JOIN TYPE_ANIMAL ON ANIMALS.ANIMAL_TYPE = TYPE_ANIMAL.ANIMAL_TYPE
GROUP BY ANIMALS.ANIMAL_TYPE, TYPE_ANIMAL.TYPE_NAME
ORDER BY ADOPTION_COUNT DESC
LIMIT 1;

-- MIN:
SELECT ANIMALS.ANIMAL_TYPE, TYPE_ANIMAL.TYPE_NAME, COUNT(ADOPTIONS.ADOPTION_ID) AS ADOPTION_COUNT
FROM ANIMALS
INNER JOIN ADOPTIONS ON ANIMALS.ANIMAL_ID = ADOPTIONS.ANIMAL_ID
INNER JOIN TYPE_ANIMAL ON ANIMALS.ANIMAL_TYPE = TYPE_ANIMAL.ANIMAL_TYPE
GROUP BY ANIMALS.ANIMAL_TYPE, TYPE_ANIMAL.TYPE_NAME
ORDER BY ADOPTION_COUNT ASC
LIMIT 1;

-- Joins

-- Get a list of animals along with their adopter’s name and contact information: 
SELECT ANIMALS.ANIMAL_LNAME, ANIMALS.ANIMAL_FNAME, ADOPTERS.ADOPTER_LNAME, ADOPTERS.ADOPTER_FNAME, ADOPTERS.ADOPTER_PHONE
FROM ANIMALS
INNER JOIN ADOPTIONS ON ANIMALS.ANIMAL_ID = ADOPTIONS.ANIMAL_ID
INNER JOIN ADOPTERS ON ADOPTIONS.ADOPTER_ID = ADOPTERS.ADOPTER_ID;

-- Get a list of all medical records descriptions from shelter 101 along with their animal’s name and adopter's contact information: 
SELECT MEDICAL_RECORDS.RECORD_ID, MEDICAL_RECORDS.TYPE_NAME AS MEDICAL_TYPE, ANIMALS.ANIMAL_LNAME AS ANIMAL_LNAME, ANIMALS.ANIMAL_FNAME AS ANIMAL_FNAME, ADOPTERS.ADOPTER_LNAME, ADOPTERS.ADOPTER_FNAME, ADOPTERS.ADOPTER_PHONE, ADOPTERS.ADOPTER_EMAIL
FROM MEDICAL_RECORDS
INNER JOIN ANIMALS ON MEDICAL_RECORDS.ANIMAL_ID = ANIMALS.ANIMAL_ID
INNER JOIN ADOPTIONS ON ANIMALS.ANIMAL_ID = ADOPTIONS.ANIMAL_ID  -- Join to ADOPTIONS table
INNER JOIN ADOPTERS ON ADOPTIONS.ADOPTER_ID = ADOPTERS.ADOPTER_ID  -- Join to ADOPTERS table
WHERE ADOPTIONS.SHELTER_ID = 101;

-- Subqueries

-- List all animals whose ages are above the average age of all animals:
SELECT ANIMAL_LNAME, ANIMAL_FNAME, ANIMAL_AGE
FROM ANIMALS
WHERE ANIMAL_AGE > (SELECT AVG(ANIMAL_AGE) FROM ANIMALS);

-- List all the staff that works at shelter 103 with experience more than 3 years:
SELECT STAFF_ID, STAFF_LNAME, STAFF_FNAME, STAFF_ROLE, STAFF_EXPERIENCE
FROM STAFF
WHERE SHELTER_ID = 103
AND STAFF_EXPERIENCE > 3;


-- Data Manipulation

-- Add a new animal to the shelter with given details: 
INSERT INTO ANIMALS (ANIMAL_ID, ANIMAL_LNAME, ANIMAL_FNAME, ANIMAL_AGE, ANIMAL_TYPE, SHELTER_ID)
VALUES (777, 'Dawson', 'Buster', 4, 1, 101);
SELECT * FROM ANIMALS;

-- Update Buddy’s age (ANIMAL_ID = 111) once he has been in the shelter for another extra year: 
UPDATE ANIMALS
SET ANIMAL_AGE = ANIMAL_AGE + 1
WHERE ANIMAL_ID = 111;
SELECT * FROM ANIMALS;

SET SQL_SAFE_UPDATES = 0;

-- Delete shelters with no animals: 
DELETE FROM SHELTER
WHERE NOT EXISTS (
	SELECT 1
    FROM ANIMALS
    WHERE ANIMALS.SHELTER_ID = SHELTER.SHELTER_ID
);

SELECT * FROM SHELTER;
