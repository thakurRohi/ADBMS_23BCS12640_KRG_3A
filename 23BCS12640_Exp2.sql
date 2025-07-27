

CREATE DATABASE orgdb;
USE orgdb;


CREATE TABLE staff (
    staff_id INT PRIMARY KEY,
    staff_name VARCHAR(60),
    team VARCHAR(40),
    supervisor_id INT
);


INSERT INTO staff (staff_id, staff_name, team, supervisor_id) VALUES 
(101, 'Aarav', 'Admin', NULL),
(102, 'Bhavna', 'Accounts', 101),
(103, 'Chirag', 'Tech', 101),
(104, 'Divya', 'Accounts', 102),
(105, 'Ekta', 'Tech', 103),
(106, 'Farhan', 'Admin', 101);


SELECT 
    s.staff_name AS StaffName,
    s.team AS StaffTeam,
    sup.staff_name AS SupervisorName,
    sup.team AS SupervisorTeam
FROM 
    staff s
LEFT JOIN 
    staff sup ON s.supervisor_id = sup.staff_id;




CREATE DATABASE orgdb2;
USE orgdb2;


CREATE TABLE YearData (
    record_id INT,
    fiscal_year INT,
    net_value INT
);


CREATE TABLE YearQuery (
    record_id INT,
    fiscal_year INT
);


INSERT INTO YearData (record_id, fiscal_year, net_value)
VALUES
(101, 2017, 110),
(107, 2021, 25),
(113, 2018, 55),
(101, 2018, 120),
(102, 2010, 130),
(103, 2011, 15),
(111, 2021, 80),
(107, 2018, 5);


INSERT INTO YearQuery (record_id, fiscal_year)
VALUES
(101, 2018),
(102, 2010),
(103, 2011),
(107, 2017),
(107, 2018),
(107, 2021),
(113, 2018);

SELECT 
    q.record_id,
    q.fiscal_year,
    IFNULL(y.net_value, 0) AS net_value
FROM 
    YearQuery q
LEFT JOIN 
    YearData y ON q.record_id = y.record_id AND q.fiscal_year = y.fiscal_year;