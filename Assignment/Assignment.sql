CREATE TABLE Department(DeptID NUMBER PRIMARY KEY,DeptName VARCHAR2(30),Location VARCHAR2(30),Budget NUMBER);
desc Department;
CREATE TABLE Employee(EmpID NUMBER PRIMARY KEY,Name VARCHAR2(30),DeptID NUMBER,Salary NUMBER,ManagerID NUMBER,HireDate DATE,Gender CHAR(1),FOREIGN KEY (DeptID)REFERENCES Department(DeptID),FOREIGN KEY (ManagerID)REFERENCES Employee(EmpID));
desc Employee;
CREATE TABLE Project(ProjectID NUMBER PRIMARY KEY,ProjectName VARCHAR2(30),DeptID NUMBER,StartDate DATE,EndDate DATE,FOREIGN KEY (DeptID)REFERENCES Department(DeptID));
desc Project;
CREATE TABLE WorksOn(EmpID NUMBER,ProjectID NUMBER,HoursWorked NUMBER,PRIMARY KEY(EmpID,ProjectID),FOREIGN KEY(EmpID)REFERENCES Employee(EmpID),FOREIGN KEY(ProjectID)REFERENCES Project(ProjectID));
desc WorksOn;
INSERT INTO Department VALUES (101,'Development','Chennai',5000000);
INSERT INTO Department VALUES (102,'Testing','Coimbatore',3000000);
INSERT INTO Department VALUES (103,'HR','Madurai',1500000);
INSERT INTO Department VALUES (104,'Finance','Trichy',2500000);
select *from department;
INSERT INTO Employee VALUES (100,'Thiyagarasan',101,85000,NULL,TO_DATE('2022-01-10','YYYY-MM-DD'),'M');
INSERT INTO Employee VALUES (101,'Kumaran',102,90000,NULL,TO_DATE('2021-05-15','YYYY-MM-DD'),'M');
INSERT INTO Employee VALUES (102,'Nithish',103,75000,NULL,TO_DATE('2020-08-20','YYYY-MM-DD'),'M');
INSERT INTO Employee VALUES (103,'Praveen',104,95000,NULL,TO_DATE('2019-03-11','YYYY-MM-DD'),'M');
INSERT INTO Employee VALUES (104,'Thamizh',101,55000,100,TO_DATE('2023-02-14','YYYY-MM-DD'),'M');
INSERT INTO Employee VALUES (105,'Arun',101,62000,100,TO_DATE('2023-07-20','YYYY-MM-DD'),'M');
INSERT INTO Employee VALUES (106,'Vignesh',102,58000,101,TO_DATE('2022-11-05','YYYY-MM-DD'),'M');
INSERT INTO Employee VALUES (107,'Surya',102,64000,101,TO_DATE('2024-01-12','YYYY-MM-DD'),'M');
INSERT INTO Employee VALUES (108,'Ajith',103,48000,102,TO_DATE('2023-09-01','YYYY-MM-DD'),'M');
INSERT INTO Employee VALUES (109,'Karthick',103,52000,102,TO_DATE('2024-03-16','YYYY-MM-DD'),'M');
INSERT INTO Employee VALUES (110,'Hari',104,60000,103,TO_DATE('2022-06-30','YYYY-MM-DD'),'M');
INSERT INTO Employee VALUES (111,'Rahul',104,70000,103,TO_DATE('2024-02-18','YYYY-MM-DD'),'M');
select *from Employee;
INSERT INTO Project VALUES
(1,'FinanceHub',101,TO_DATE('2025-01-01','YYYY-MM-DD'),TO_DATE('2025-12-31','YYYY-MM-DD'));
INSERT INTO Project VALUES
(2,'Hospital Management',101,TO_DATE('2025-02-01','YYYY-MM-DD'),TO_DATE('2025-11-30','YYYY-MM-DD'));
INSERT INTO Project VALUES
(3,'College Portal',102,TO_DATE('2025-03-01','YYYY-MM-DD'),TO_DATE('2025-10-30','YYYY-MM-DD'));
INSERT INTO Project VALUES
(4,'Inventory System',104,TO_DATE('2025-04-15','YYYY-MM-DD'),TO_DATE('2025-12-15','YYYY-MM-DD'));
select *from Project;
INSERT INTO WorksOn VALUES (100,1,120);
INSERT INTO WorksOn VALUES (100,2,80);
INSERT INTO WorksOn VALUES (104,1,95);
INSERT INTO WorksOn VALUES (105,1,60);
INSERT INTO WorksOn VALUES (105,2,70);
INSERT INTO WorksOn VALUES (106,3,90);
INSERT INTO WorksOn VALUES (107,3,75);
INSERT INTO WorksOn VALUES (108,2,85);
INSERT INTO WorksOn VALUES (109,1,50);
INSERT INTO WorksOn VALUES (109,4,110);
INSERT INTO WorksOn VALUES (110,4,100);
-- Display WorksOn table
SELECT * FROM WorksOn;

-- 1. Average, Minimum and Maximum salary in each department
SELECT DeptID,
       AVG(Salary) AS Average_Salary,
       MIN(Salary) AS Minimum_Salary,
       MAX(Salary) AS Maximum_Salary
FROM Employee
GROUP BY DeptID;

-- 2. Departments where average salary is greater than 60000
SELECT DeptID,
       AVG(Salary) AS Average_Salary
FROM Employee
GROUP BY DeptID
HAVING AVG(Salary) > 60000;

-- 3. Number of employees under each manager
SELECT ManagerID,
       COUNT(*) AS NoEmployees
FROM Employee
WHERE ManagerID IS NOT NULL
GROUP BY ManagerID;

-- 4. Department with highest total salary expenditure
SELECT DeptID,
       SUM(Salary) AS TotalSalary
FROM Employee
GROUP BY DeptID
ORDER BY TotalSalary DESC
FETCH FIRST 1 ROW ONLY;

-- 5. Employee names with department names
SELECT E.Name,
       D.DeptName
FROM Employee E
JOIN Department D
ON E.DeptID = D.DeptID;

-- 6. Employees not assigned to any project
SELECT E.EmpID,
       E.Name
FROM Employee E
LEFT JOIN WorksOn W
ON E.EmpID = W.EmpID
WHERE W.ProjectID IS NULL;

-- 7. Project names with department names
SELECT P.ProjectName,
       D.DeptName
FROM Project P
JOIN Department D
ON P.DeptID = D.DeptID;

-- 8. Employee and Manager names (Self Join)
SELECT E.Name AS Employee_Name,
       M.Name AS Manager_Name
FROM Employee E
JOIN Employee M
ON E.ManagerID = M.EmpID;

-- 9. Employees working on more than one project
SELECT E.EmpID,
       E.Name,
       COUNT(W.ProjectID) AS TotalProjects
FROM Employee E
JOIN WorksOn W
ON E.EmpID = W.EmpID
GROUP BY E.EmpID, E.Name
HAVING COUNT(W.ProjectID) > 1;

-- 10. Employees working on Project 1 OR Project 2
SELECT EmpID
FROM WorksOn
WHERE ProjectID = 1

UNION

SELECT EmpID
FROM WorksOn
WHERE ProjectID = 2;

-- 11. Employees working on both Project 1 AND Project 2
SELECT EmpID
FROM WorksOn
WHERE ProjectID = 1

INTERSECT

SELECT EmpID
FROM WorksOn
WHERE ProjectID = 2;

-- 12. Employees working on Project 1 but not Project 2
SELECT EmpID
FROM WorksOn
WHERE ProjectID = 1

MINUS

SELECT EmpID
FROM WorksOn
WHERE ProjectID = 2;

-- 13. Employees earning more than company average salary
SELECT Name,
       Salary
FROM Employee
WHERE Salary >
(
    SELECT AVG(Salary)
    FROM Employee
);

-- 14. Employees earning more than their department average salary
SELECT E.Name,
       E.DeptID,
       E.Salary
FROM Employee E
WHERE E.Salary >
(
    SELECT AVG(Salary)
    FROM Employee
    WHERE DeptID = E.DeptID
);

-- 15. Employees who joined before their manager
SELECT E.Name AS Employee_Name,
       M.Name AS Manager_Name,
       E.HireDate,
       M.HireDate
FROM Employee E
JOIN Employee M
ON E.ManagerID = M.EmpID
WHERE E.HireDate < M.HireDate;
