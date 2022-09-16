Create Database YouMachine;

use YouMachine;

Create Table Employee
(
ID int primary key,
FIRST_NAME varchar(20) ,
LAST_NAME varchar(20) ,
SALARY int ,
JOINING_DATE DATETIME ,
DEPARTMENT varchar(15)   
);

select * from employee

Insert Into Employee
values(1, 'Monika','Arora',100000,'2020-02-20 09:00:00','HR'),
(2,'Niharika','Verma',80000,'2020-06-11 09:00:00','Admin'),
(3,'Vishal','Singhal',300000,'2020-02-20 09:00:00','HR'),
(4,'Amitabh','Singh',500000,'2020-02-20 09:00:00','Admin'),
(5,	'Vivek','Bhati',500000,'2020-06-11 09:00:00','Admin'),
(6, 'Vipul','Diwan', 200000, '2020-06-11 09:00:00','Account'),
(7,	'Satish', 'Kumar', 75000, '2020-01-20 09:00:00', 'Account'),
(8, 'Geetika',	'Chauhan',	90000, '2020-04-11 09:00:00','Admin')

select * from employee

Create Table Employee_bonus
(
EMP_ID int,
BONUS_DATE datetime ,
BONUS_AMOUNT int 
);

Insert into employee_bonus
values(1,'2021-02-20 00:00:00',	5000),
(2, '2021-06-11 00:00:00', 3000),
(3,	'2021-02-20 00:00:00', 4000),
(1, '2021-02-20 00:00:00', 4500),
(2,	'2021-06-11 00:00:00', 3500)

select * from employee_bonus

Create Table Employee_Title
(
EMP_ID int,
Title varchar(20),
AFFECTED_FROM DateTime
);

Insert into employee_title
values(1,'Manager','2021-02-20  00:00:00'),
(2,	'Executive', '2021-06-11 00:00:00'),
(8,	'Executive', '2021-06-11 00:00:00'),
(5,	'Manager', '2021-06-11 00:00:00'),
(4,	'Asst. Manager', '2021-06-11 00:00:00'),
(7,	'Executive', '2021-06-11 00:00:00'),
(6,	'Lead', '2021-06-11 00:00:00'),
(3,	'Lead',	'2021-06-11 00:00:00')



select * from employee_title
select * from employee
select * from employee_bonus




-->> Quest 1 :- Display details of the employees whose FIRST_NAME contains six alphabets and ends with ‘h’<---

Select * from Employee where FIRST_NAME like '_____h';


-->> Quest 2 :- Display employee first name and last name together who have joined in June 2020. <---

SELECT concat_ws(" ",First_Name, Last_Name) as Full_Name, Joining_Date  FROM Employee 

WHERE month(Joining_Date) = 06;

-->> Quest 3:- Get the count of employees working in the department ‘Account’. <<--

Select Department, count(*) as Total_Count from employee
where Department = 'Account';

--->> Quest 4 :- Get the no. of employees for each department in the descending order  <<--

Select Department, count(*) as Total_Count from employee
group by Department
order by Department DESC;

--->> Quest 5:- Display details of the employees who are also Managers. <<--

Select Employee.ID, Employee.First_Name, Employee.Last_Name, Employee.Salary,Employee.Department,Employee.JOINING_DATE,Employee_title.Title, Employee_title.AFFECTED_FROM
from Employee
left join Employee_title on ID = EMP_ID
 where TITLE = 'Manager'
 order by ID;
 
 -->> Quest 6:- Display duplicate records from employee title table <---
  
SELECT Emp_ID, Title, AFFECTED_FROM, COUNT(*)
FROM employee_title
GROUP BY Title
HAVING COUNT(*) > 1


--->> Quest 7 :- Replicate or clone any table. <<---

create table emp_title LIKE Employee_title;
insert into emp_title select * from Employee_title

select * from emp_title

-->> Quest 8 :- Display the fifth highest salary from the table. <<---


select * from Employee e1
where 5-1 = (select count(Distinct Salary) from Employee e2
where e2.salary > e1.salary)

-->> Quest 9:- Get the list of employee name with the same salary

SELECT  concat_ws(" ",First_Name, Last_Name) as Full_Name, Salary FROM Employee
WHERE Salary IN (
    SELECT Salary
    FROM Employee
    GROUP BY Salary
    HAVING COUNT(*) > 1)
    
    -->> Quest 10:- Display the first half records from a table. <<---
    
    select * from employee
    
SELECT * FROM employee
	WHERE ID <= (SELECT count(id)/2 FROM employee);
    
    --->> Quest 11:- Get the list departments that have less than five people. <<---
    
SELECT First_Name, Last_Name, Department,count(*) as Total_Count FROM Employee
 GROUP BY DEPARTMENT
 HAVING COUNT(*) < 5
 order by Department;

    
    
--->> QUEST 12:- Display the first and last record from the employee table. <<--

(select * from Employee order by ID ASC LIMIT 1)
UNION
(select * from Employee order by ID DESC LIMIT 1);


--->> QUEST 13 :- Get the name of employees having the highest salary in each department. <---

SELECT FIRST_NAME, LAST_NAME, DEPARTMENT, MAX(SALARY) FROM Employee GROUP BY DEPARTMENT;

--->> QUEST 14 :- Display department names along with the total salaries paid for each of them. <<--

SELECT Department, SUM(Salary)
FROM Employee
GROUP BY Department;


       
      