CREATE DATABASE COMPANY;
GO

USE COMPANY;
GO

CREATE TABLE EMPLOYEE (
  Fname VARCHAR(20),
  Minit CHAR(1),
  Lname VARCHAR(20),
  Ssn INT PRIMARY KEY,
  Bdate DATE,
  Address_ VARCHAR(50),
  Sex CHAR(1),
  Salary DECIMAL(10, 2),
  Super_ssn INT,
  Dno INT
);
GO

CREATE TABLE DEPARTMENT (
  Dname VARCHAR(20),
  Dnumber INT PRIMARY KEY,
  Mgr_ssn INT,
  Mgr_start_date DATE
);
GO

CREATE TABLE DEPT_LOCATIONS (
  Dnumber INT,
  Dlocation VARCHAR(20)
);
GO

CREATE TABLE PROJECT (
  Pname VARCHAR(20),
  Pnumber INT PRIMARY KEY,
  Plocation VARCHAR(20),
  Dnum INT
);
GO

CREATE TABLE WORKS_ON (
  Essn INT,
  Pno INT,
  Hours_ DECIMAL(5, 2)
);
GO

CREATE TABLE DEPENDENT_ (
  Essn INT,
  Dependent_name VARCHAR(20),
  Sex CHAR(1),
  Bdate DATE,
  Relationship VARCHAR(20)
);
GO

INSERT INTO EMPLOYEE (Fname, Minit, Lname, Ssn, Bdate, Address_, Sex, Salary, Super_ssn, Dno)
VALUES
('John','B','Smith',123456789,'1965-01-09','731 Fondren, Houston TX','M',30000,333445555,5),
('Franklin','T','Wong',333445555,'1965-12-08','638 Voss, Houston TX','M',40000,888665555,5),
('Alicia','J','Zelaya',999887777,'1968-01-19','3321 Castle, Spring TX','F',25000,987654321,4),
('Jennifer','S','Wallace',987654321,'1941-06-20','291 Berry, Bellaire TX','F',43000,888665555,4),
('Ramesh','K','Narayan',666884444,'1962-09-15','975 Fire Oak, Humble TX','M',38000,333445555,5),
('Joyce','A','English',453453453,'1972-07-31','5631 Rice, Houston TX','F',25000,333445555,5),
('Ahmad','V','Jabbar',987987987,'1969-03-29','980 Dallas, Houston TX','M',25000,987654321,4),
('James','E','Borg',888665555,'1937-11-10','450 Stone, Houston TX','M',55000,null,1);
GO

INSERT INTO DEPARTMENT (Dname, Dnumber, Mgr_ssn, Mgr_start_date)
VALUES
('Research',5,333445555,'1988-05-22'),
('Administration',4,987654321,'1995-01-01'),
('Headquarters',1,888665555,'1981-06-19');
GO

INSERT INTO DEPT_LOCATIONS (Dnumber, Dlocation)
VALUES
(1,'Houston'),
(4,'Stafford'),
(5,'Bellaire'),
(5,'Sugarland'),
(5,'Houston');
GO

INSERT INTO PROJECT (Pname, Pnumber,Plocation,Dnum)
VALUES
('ProductX',1,'Bellaire',5),
('ProductY',2,'Sugarland',5),
('ProductZ',3,'Houston',5),
('Computerization',10,'Stafford',4),
('Reorganization',20,'Houston',1),
('Newbenefits',30,'Stafford',4);
GO

INSERT INTO WORKS_ON (Essn,Pno ,Hours_)
VALUES
(123456789 ,1 ,32.5 ),
(123456789 ,2 ,7.5 ),
(666884444 ,3 ,40.0 ),
(453453453 ,1 ,20.0 ),
(453453453 ,2 ,20.0 ),
(333445555 ,2 ,10.0 ),
(333445555 ,3 ,10.0 ),
(333445555 ,10 ,10.0 ),
(333445555 ,20 ,10.0 ),
(999887777 ,30 ,30.0 ),
(999887777 ,10 ,10.0 ),
(987987987 ,10 ,35.0 ),
(987987987 ,30 ,5.0 ),
(987654321 ,30 ,20.0 ),
(987654321 ,20 ,15.0 ),
(888665555 ,20 ,16.0 );
GO

INSERT INTO DEPENDENT_ (Essn ,Dependent_name,Sex,Bdate ,Relationship)
VALUES
(333445555 ,'Alice' ,'F' ,'1986-04-04' ,'Daughter' ),
(333445555 ,'Theodore' ,'M' ,'1983-10-25' ,'Son' ),
(333445555 ,'Joy' ,'F' ,'1958-05-03' ,'Spouse' ),
(987654321 ,'Abner' ,'M' ,'1942-02-28' ,'Spouse' ),
(123456789 ,'Michael' ,'M' ,'1988-01-04' ,'Son' ),
(123456789 ,'Alice' ,'F' ,'1988-12-30' ,'Daughter' ),
(123456789 ,'Elizabeth' ,'F' ,'1967-05-05' ,'Spouse');
GO

-- Consultas:

-- 1. �Cu�ntos empleados hay en total?
SELECT COUNT(*) AS TotalE FROM EMPLOYEE;

-- 2. �Cu�l es el nombre del empleado que tiene el salario m�s alto?
SELECT Fname,Minit,Lname FROM EMPLOYEE WHERE Salary = (SELECT MAX(Salary) FROM EMPLOYEE);

-- 3. �Cu�ntos departamentos hay en la organizaci�n?
SELECT COUNT(*) AS TotalD FROM DEPARTMENT;

-- 4. �Cu�les son los proyectos ubicados en Houston?
SELECT Pname FROM PROJECT WHERE Plocation = 'Houston';

-- 5. �Cu�l es la relaci�n de dependencia para el empleado con SSN 333445555?
SELECT Dependent_name,Relationship FROM DEPENDENT_ WHERE Essn = 333445555;

-- 6. �Cu�l es la ubicaci�n del departamento con el n�mero 5?
SELECT Dlocation FROM DEPT_LOCATIONS WHERE Dnumber = 5;

-- 7. �Cu�l es el salario promedio de todos los empleados?
SELECT AVG(Salary) AS SalarioP FROM EMPLOYEE;

-- 8. �Cu�ntos proyectos tiene cada departamento?
SELECT Dnum,COUNT(*) AS TotalP FROM PROJECT GROUP BY Dnum;

-- 9. �Cu�ntas horas totales se han trabajado en cada proyecto?
SELECT Pno, SUM(Hours_) AS HorasT FROM WORKS_ON GROUP BY Pno;

-- 10. �Cu�l es el salario total pagado por todos los departamentos?
SELECT Dno, SUM(Salary) AS SalarioT FROM EMPLOYEE GROUP BY Dno;

-- 11. �Cu�l es el salario m�ximo y m�nimo en cada departamento?
SELECT Dno, MAX(Salary) AS SalarioMax, MIN(Salary) AS SalarioMinim FROM EMPLOYEE GROUP BY Dno;

-- 12. �Cu�ntos dependientes tiene cada empleado y cu�l es su relaci�n?
SELECT Essn, COUNT(*) AS TotalDep, STRING_AGG(Relationship, ', ') AS Familiaridad FROM DEPENDENT_ GROUP BY Essn;