

CREATE DATABASE BookStoreDB;
USE BookStoreDB;


CREATE TABLE Writer (
    writer_id INT PRIMARY KEY,
    writer_name VARCHAR(120),
    nationality VARCHAR(60)
);


CREATE TABLE Publication (
    pub_id INT PRIMARY KEY,
    book_title VARCHAR(120),
    writer_id INT,
    FOREIGN KEY (writer_id) REFERENCES Writer(writer_id)
);


INSERT INTO Writer (writer_id, writer_name, nationality) VALUES
(11, 'Amitav Ghosh', 'India'),
(12, 'Margaret Atwood', 'Canada'),
(13, 'Isabel Allende', 'Chile');


INSERT INTO Publication (pub_id, book_title, writer_id) VALUES
(201, 'The Glass Palace', 11),
(202, 'The Handmaid''s Tale', 12),
(203, 'The House of the Spirits', 13);


SELECT 
    P.book_title AS Publication_Title,
    W.writer_name AS Writer_Name,
    W.nationality AS Writer_Nationality
FROM 
    Publication P
INNER JOIN 
    Writer W ON P.writer_id = W.writer_id;
    



CREATE DATABASE CollegeDB;
USE CollegeDB;


CREATE TABLE Division (
    division_id INT PRIMARY KEY,
    division_name VARCHAR(110)
);


CREATE TABLE Subject (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(110),
    division_id INT,
    FOREIGN KEY (division_id) REFERENCES Division(division_id)
);


INSERT INTO Division (division_id, division_name) VALUES
(21, 'Information Technology'),
(22, 'Automobile Engineering'),
(23, 'Electronics'),
(24, 'Architecture'),
(25, 'Statistics');


INSERT INTO Subject (subject_id, subject_name, division_id) VALUES
(301, 'Algorithms', 21),
(302, 'Computer Networks', 21),
(303, 'Software Engineering', 21),
(304, 'Vehicle Dynamics', 22),
(305, 'Engine Design', 22),
(306, 'Digital Circuits', 23),
(307, 'Microprocessors', 23),
(308, 'Urban Planning', 24),
(309, 'Probability', 25),
(310, 'Statistical Methods', 25);


CREATE USER 'student01'@'localhost' IDENTIFIED BY 'studpass01';
GRANT SELECT ON CollegeDB.Subject TO 'student01'@'localhost';


SELECT division_name
FROM Division
WHERE division_id IN (
    SELECT division_id
    FROM Subject
    GROUP BY division_id
    HAVING COUNT(subject_id) > 2
);