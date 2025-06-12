CREATE DATABASE Research_Project;

USE Research_Project;

CREATE TABLE Agency (
	ID  INTEGER  NOT NULL PRIMARY KEY,
    Agency_Name VARCHAR(250)
);

CREATE TABLE Employee (
	SSN INTEGER NOT NULL PRIMARY KEY,
    Emp_Name VARCHAR(250),
    Salary INTEGER,
    Agency_ID INTEGER,
    FOREIGN KEY (Agency_ID) REFERENCES Agency(ID)
);

CREATE TABLE Project (
	ID INTEGER NOT NULL,
    Project_Name VARCHAR(250),
    Manager_ID INTEGER,
    Budget INTEGER,
    Duration INTEGER,
    Agency_ID INTEGER,
    UNIQUE (ID, Agency_Id),
    FOREIGN KEY (Manager_ID) REFERENCES Employee(SSN),
    FOREIGN KEY (Agency_Id) REFERENCES Agency(ID)
);

CREATE TABLE Employee_Project (
	ID INTEGER NOT NULL PRIMARY KEY,
    Employee_ID INTEGER,
    Project_ID INTEGER,
    FOREIGN KEY (Employee_ID) REFERENCES Employee(SSN),
    FOREIGN KEY (Project_ID) REFERENCES Project(ID)
);

INSERT INTO Agency (ID, Agency_Name) VALUES
(1, 'National Science Foundation'),
(2, 'Space Research Organization'),
(3, 'Environmental Protection Agency'),
(4, 'Department of Energy'),
(5, 'Health Research Council');

INSERT INTO Employee (SSN, Emp_Name, Salary, Agency_ID) VALUES
(1001, 'Alice Johnson', 75000, 1),
(1002, 'Bob Smith', 80000, 2),
(1003, 'Charlie Lee', 72000, 3),
(1004, 'Diana Adams', 68000, 1),
(1005, 'Ethan Brown', 85000, 4);

INSERT INTO Project (ID, Project_Name, Manager_ID, Budget, Duration, Agency_ID) VALUES
(201, 'AI Research', 1001, 500000, 12, 1),
(202, 'Space Rover', 1002, 1200000, 18, 2),
(203, 'Climate Study', 1003, 400000, 10, 3),
(204, 'Nuclear Energy', 1005, 900000, 15, 4),
(205, 'Cancer Research', 1004, 650000, 20, 1);

INSERT INTO Employee_Project (ID, Employee_ID, Project_ID) VALUES
(1, 1001, 201),
(2, 1002, 202),
(3, 1003, 203),
(4, 1004, 205),
(5, 1005, 204);

INSERT INTO Employee_Project (ID, Employee_ID, Project_ID) VALUES
(6, 1004, 201),
(7, 1001, 205),
(8, 1003, 204),
(9, 1002, 203),
(10, 1005, 202);