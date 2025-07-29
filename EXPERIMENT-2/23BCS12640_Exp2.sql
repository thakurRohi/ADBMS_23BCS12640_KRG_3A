--1(a)
CREATE DATABASE OrgDB;
USE OrgDB;

CREATE TABLE Staff (
    staffId INT PRIMARY KEY,
    staffName VARCHAR(50),
    teamName VARCHAR(50),
    supervisorId INT
);

INSERT INTO Staff (staffId, staffName, teamName, supervisorId) VALUES 
(101, 'Riya', 'Design', NULL),
(102, 'Kunal', 'Marketing', 101),
(103, 'Zara', 'Development', 101),
(104, 'Manav', 'Marketing', 102),
(105, 'Neha', 'Development', 103),
(106, 'Amit', 'Design', 101);


SELECT 
    s.staffName AS Employee,
    s.teamName AS Team,
    sup.staffName AS Supervisor,
    sup.teamName AS SupervisorTeam
FROM 
    Staff s
LEFT JOIN 
    Staff sup ON s.supervisorId = sup.staffId;

-- 2(b)
CREATE DATABASE FinanceDB;
USE FinanceDB;

CREATE TABLE FinancialRecords (
    recordId INT,
    recordYear INT,
    netProfit INT
);

CREATE TABLE LookupRequests (
    requestId INT,
    requestYear INT
);


INSERT INTO FinancialRecords (recordId, recordYear, netProfit) VALUES
(101, 2020, 500),
(105, 2021, 200),
(109, 2019, 320),
(101, 2019, 450),
(102, 2015, 600),
(103, 2016, 75),
(110, 2021, 390),
(105, 2020, 0);


INSERT INTO LookupRequests (requestId, requestYear) VALUES
(101, 2019),
(102, 2015),
(103, 2016),
(105, 2018),
(105, 2020),
(105, 2021),
(109, 2019);


SELECT 
    l.requestId AS RecordID,
    l.requestYear AS Year,
    ISNULL(f.netProfit, 0) AS NetProfit
FROM 
    LookupRequests l
LEFT JOIN 
    FinancialRecords f 
ON 
    l.requestId = f.recordId AND l.requestYear = f.recordYear;

--2(b)

