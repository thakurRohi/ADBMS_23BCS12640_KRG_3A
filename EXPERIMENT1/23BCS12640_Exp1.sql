
CREATE DATABASE UniversityDB;
USE UniversityDB;


CREATE TABLE Departments (
    departmentId INT PRIMARY KEY,
    departmentName VARCHAR(100)
);

CREATE TABLE Courses (
    courseId INT PRIMARY KEY,
    courseTitle VARCHAR(100),
    departmentId INT,
    FOREIGN KEY (departmentId) REFERENCES Departments(departmentId)
);


INSERT INTO Departments (departmentId, departmentName) VALUES
(1, 'Information Technology'),
(2, 'Aerospace Engineering'),
(3, 'Chemical Engineering'),
(4, 'Architecture'),
(5, 'Statistics');

INSERT INTO Courses (courseId, courseTitle, departmentId) VALUES
(201, 'Web Development', 1),
(202, 'Computer Networks', 1),
(203, 'Cloud Computing', 1),
(204, 'Flight Mechanics', 2),
(205, 'Propulsion Systems', 2),
(206, 'Organic Chemistry', 3),
(207, 'Process Control', 3),
(208, 'Building Design', 4),
(209, 'Probability Theory', 5),
(210, 'Regression Analysis', 5);


CREATE LOGIN studentUser WITH PASSWORD = 'securePass123';
USE UniversityDB;
CREATE USER studentUser FOR LOGIN studentUser;


GRANT SELECT ON dbo.Courses TO studentUser;


SELECT departmentName
FROM Departments
WHERE departmentId IN (
    SELECT departmentId
    FROM Courses
    GROUP BY departmentId
    HAVING COUNT(courseId) > 2
);


-- 1(b)


CREATE DATABASE LibraryDB;
USE LibraryDB;


CREATE TABLE Authors (
    authorID INT PRIMARY KEY,
    fullName VARCHAR(100),
    nationality VARCHAR(50)
);


CREATE TABLE Books (
    bookID INT PRIMARY KEY,
    bookTitle VARCHAR(100),
    writtenBy INT,
    FOREIGN KEY (writtenBy) REFERENCES Authors(authorID)
);


INSERT INTO Authors (authorID, fullName, nationality) VALUES
(1, 'Paulo Coelho', 'Brazil'),
(2, 'Chimamanda Ngozi Adichie', 'Nigeria'),
(3, 'Kazuo Ishiguro', 'United Kingdom');


INSERT INTO Books (bookID, bookTitle, writtenBy) VALUES
(101, 'The Alchemist', 1),
(102, 'Half of a Yellow Sun', 2),
(103, 'Never Let Me Go', 3);


SELECT
    B.bookTitle AS Title,
    A.fullName AS Author,
    A.nationality AS Country
FROM
    Books B
    INNER JOIN Authors A ON B.writtenBy = A.authorID;
