-- create new data base
create database batch10;
-- use data base
use batch10;
create table dept(
deptno int primary key,
deptname varchar(50),
location varchar(50)
);
ALTER TABLE dept
ADD phonenumber VARCHAR(10)
CHECK (LENGTH(phonenumber) = 10);
USE batch10;
create table prdect(
prodectid int primary key,
prodectname varchar(50),
prodectprice decimal(10,2),
Quantity int,
deptno int, 
foreign key (deptno)
references dept(deptno));
desc prdect;
select * from prdect;
desc prdect;
alter table prdect
rename to prodect; 
alter table prodect
add column mode_of_payment varchar(100);
alter table prodect
add column pin_code decimal(6,2);
alter table prodect
add prod int,
add prod1 int;
alter table prodect
drop column prod;
alter table prodect
add prod int;
alter table prodect
drop prod,
drop prod1;
alter table prodect
rename column modeofpayment to mod_of_payment;
select * from prodect;
desc prodect;
alter table prodect
modify column mod_of_payment char(100);
-- desc; 
alter table prodect 
modify column mod_of_payment char(100) not null;
-- alter table prodect
-- modify column deptno char(100) not null
use batch10;
create table emp(
empno int primary key,
First_name varchar(50),
Last_name varchar(50),
age int,
hir_date date,
sal decimal(10,2),
comi decimal(10,2),
job varchar(50),
mgr varchar(50)
);
select * from emp;
desc emp;
desc prodect;
alter table emp
add column deptno int;
alter table emp
add constraint fk_empodept
foreign key (deptno)
references dept (deptno);
desc emp;
select * from emp;
desc emp;
insert into dept(deptno,deptname,location,phonenumber)
values (10,'hr','haveri','8150096307'),
(12,'hr','hubli','9880927888');
insert into emp(empno,First_name,Last_name,age,hir_date,sal,comi,job,mgr,deptno)
values (1,'Ullasgouda','V Patil',22,'2026-11-1',200000,8000,'sd','555',10),
(2,'Ullasgouda','V Patil',22,'2026-11-1',200000,8000,'sd','555',10);
select * from emp;
select * from dept;
use batch10;
select * from dept;
drop database batch10;
create database batch10;
use batch10;
create table course(
corse_id int primary key,
course_name varchar(50),
duration_in_months int,
fees decimal(10,2)

);
create table student(
	student_id int primary key,
    student_name varchar(50) not null,
    email varchar(100) unique,
    age int,
    city varchar(50),
    corse_id int,
    foreign key(corse_id)
    references course(corse_id) 
);
desc course;
desc student;
alter table course
rename to course_on_IT;
alter table student
rename to stu;
alter table stu
add column phone_number varchar(50);
desc stu;
alter table stu
add column phone_number varchar(50);
desc stu;
alter table stu 
add column gender varchar(50),
add column DOB date;
desc stu;
alter table stu
drop column phone_number;
desc stu;
alter table stu
drop column DOB ,
drop column gender;
desc stu;
alter table stu
rename column email to Email;
alter table stu 
modify student_name varchar(100);
desc stu;
alter table stu
modify column student_name char(20) null;
desc stu;
create table dept(
deptno int primary key,
dname varchar(50),
loc varchar(50));
create table emp(
empno int primary key,
first_name varchar(50)not null,
last_name varchar(50) not null,
age int, 
MGR varchar(50),
sal decimal(10,2),
comm decimal(10,2),
hiredate date);
alter table emp
add column deptno int ;
alter table emp
add constraint fk_dept_to_emp
foreign key (deptno)
references dept(deptno);
desc emp;
insert into course_on_it(corse_id,course_name,duration_in_months,fees)
values(100,'python',6,25000.00);
insert into course_on_it(corse_id,course_name,duration_in_months,fees)
values(103,'python',6,25000.00),
(104,'python',6,25000.00),
(105,'python',6,25000.00),
(106,'python',6,25000.00);
select * from course_on_it;
insert into stu(student_id,student_name,Email,age,city,corse_id)
values(100,'Ullasgouda V Patil','Ullasgoudavpatil06@gmail.com',22,'haveri',100),
(101,'Rahul ','Rahul@gmail.com',22,'haveri',100),
(102,'Anil','Anil@gmail.com',22,'haveri',100),
(103,'suhas','suhas@gmail.com',22,'haveri',100),
(104,'sharad','sharad@gmail.com',22,'haveri',100),
(105,'raghu','raghu@gmail.com',22,'haveri',100),
(106,'tilak','tilak@gmail.com',22,'haveri',103),
(107,'boda','boda@gmail.com',22,'haveri',103),
(108,'chandan','chandan@gmail.com',22,'haveri',104),
(109,'naveen','naveen@gmail.com',22,'haveri',104);
desc stu;
select * from stu;
update stu
set city='hubli'
where student_id=102;
update stu
set city='hangal',
student_name='chirag'
where student_id=101;
set sql_safe_updates = 0;
update stu
set  city = 'haveri';
set sql_safe_updates = 1;
-- without sql safe update
delete from stu
where student_id=100;
-- with useing sql safe update
set sql_safe_updates=0;
delete from stu
where city=hubli;
update stu
set city='hubli'
where student_id=101;
select*from stu;
set sql_safe_updates=0;
delete from stu
where city='hubli';
set sql_safe_updates=1;
select * from emp;
use batch10;
select * from stu;
set autocommit=0; 
update  stu
set corse_id=103
where student_id=102;
delete from stu
where student_id=102;
select * from stu;
commit;
insert into stu(student_id,student_name,Email,age,city,corse_id)
values (101,'Rahul ','Rahul@gmail.com',22,'haveri',100);
set sql_safe_updates=0;
update stu
set corse_id=103
where student_id=101;
select * from stu;
commit;
-- rollback 
select * from stu;
set autocommit=0;
insert into stu(student_id,student_name,Email,age,city,corse_id)
values (110,'Rahul v ','Rahulrahul@gmail.com',22,'haveri',100);
update stu
set age=24
where student_id=110;
select * from stu;
rollback;
insert into stu(student_id,student_name,Email,age,city,corse_id)
values (110,'Rahul v ','Rahulrahul@gmail.com',22,'haveri',100);
commit;
update stu 
set age=24
where student_id=110;
rollback;
use batch10;
update stu
set city='hangal'
where student_id=110;
savepoint s1;
update stu
set age=26
where student_id=110;
savepoint s2;
update stu
set student_name='ravi'
where student_id=110;
savepoint s3;
select * from stu;
rollback to s3;
rollback to s2;
rollback to s1;
-- dcl 
create user  'ullas'@'localhost'
identified by 'ullas@123'; 
use batch10;
 grant select,insert,update,delete
 on batch10.stu
 to 'ullas'@'localhost';
 create user  'pradeep'@'localhost'
identified by 'ullas@123'; 
create user  'santhos'@'localhost'
identified by 'ullas@123'; 
create user  'harsha'@'localhost'
identified by 'ullas@123'; 
 grant select,insert,update,delete
 on batch10.stu
 to 'pradeep'@'localhost';
  grant select,insert,update,delete
 on batch10.stu
 to 'santhos'@'localhost';
  grant select,insert,update,delete
 on batch10.stu
 to 'harsha'@'localhost';
 -- creating the dept table
CREATE TABLE dept1 (
    deptno INT PRIMARY KEY,
    dname VARCHAR(50) NOT NULL,
    loc VARCHAR(50)
);

-- inserting the values in to the dept table
INSERT INTO dept (deptno, dname, loc)
VALUES
(10, 'Python', 'Bangalore'),
(20, 'Java', 'Chennai'),
(30, 'Data Engineer', 'Hyderabad'),
(40, 'Data Analyst', 'Pune');
 CREATE TABLE emp1 (
    empno INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age INT,
    job VARCHAR(50),
    mgr INT,
    sal DECIMAL(10,2),
    comm DECIMAL(10,2),
    hiredate DATE,
    deptno INT,
	FOREIGN KEY (deptno)
	REFERENCES dept(deptno)
);
select * from emp1;
desc emp1;
select * from dept;
INSERT INTO emp1(empno,first_name,last_name,age,job,mgr,sal,comm,hiredate,deptno)
VALUES
(1001, 'Namitha', 'N S', 22, 'Python Developer', NULL, 15000, NULL, '2020-01-10', 10),
(1002, 'Likitha', 'M', 23, 'Python Developer', 1001, 16000, 500, '2020-06-15', 10),
(1003, 'Gagana', 'BM', 22, 'Java Developer', 1001, 17000, NULL, '2021-02-01', 20),
(1004, 'Apeksha', 'I', 23, 'Java Developer', 1003, 18000, 1000, '2021-08-20', 20),
(1005, 'Ullasgouda', 'V Patil', 24, 'Data Engineer', 1003, 19000, NULL, '2022-03-15', 30),
(1006, 'Chaya', 'T', 22, 'Data Engineer', 1005, 20000, 750, '2022-09-10', 30),
(1007, 'Sushma', 'G', 23, 'Data Analyst', 1005, 21000, NULL, '2023-01-05', 40),
(1008, 'Sanket', 'S Gowdar', 24, 'Data Analyst', 1007, 22000, 1200, '2023-05-25', 40),
(1009, 'Rohini', '', 22, 'Python Developer', 1001, 23000, NULL, '2023-11-12', 10),
(1010, 'Shashank', 'M M', 23, 'Python Developer', 1009, 24000, 800, '2024-02-18', 10),
(1011, 'Swaroop', 'M Y', 24, 'Java Developer', 1003, 25000, NULL, '2024-04-22', 20),
(1012, 'Shaik Mohammed', 'Irfan', 23, 'Java Developer', 1011, 26000, 1500, '2024-07-14', 20),
(1013, 'Nayana', 'M', 22, 'Data Engineer', 1005, 27000, NULL, '2024-10-30', 30),
(1014, 'Varsha', 'R', 23, 'Data Engineer', 1013, 28000, 900, '2025-01-16', 30),
(1015, 'Gowtham', 'N M', 24, 'Data Analyst', 1007, 29000, NULL, '2025-03-21', 40),
(1016, 'Chidanand', 'M', 22, 'Data Analyst', 1015, 30000, 1100, '2025-05-11', 40),
(1017, 'Malay', 'Bhushan', 23, 'Python Developer', 1001, 31000, NULL, '2025-07-19', 10),
(1018, 'Soubhagya', '', 22, 'Java Developer', 1011, 32000, 600, '2025-09-08', 20),
(1019, 'Suhas', 'D', 24, 'Data Engineer', 1013, 33000, NULL, '2025-11-25', 30),
(1020, 'Bhavana', 'Bhargavi', 23, 'Data Analyst', 1007, 34000, 1300, '2026-01-12', 40),
(1021, 'Sindhu', 'KV', 22, 'Python Developer', 1017, 35000, NULL, '2026-04-17', 10),
(1022, 'Naveen', 'Kumar A', 23, 'Java Developer', 1018, 36000, 2000, '2026-08-23', 20);
ALTER TABLE emp1
ADD COLUMN job VARCHAR(50);
-- DQL
select first_name
from emp1;
select first_name ,sal
from emp1;
select distinct age,sal
from emp1;
use batch10;
select first_name,sal
from emp1
where sal>30000;
select first_name,job,sal,(sal*12)+(sal*0.1) salari_hick
from emp1
where job='Python Developer';
select first_name,sal*12 anualsal
from emp1
where sal*12>100000;
select * 
from emp
where hiredate>'2025-01-01';
use batch10;
-- logical operater 
-- or oprater 
select * 
from emp1
where sal>20000 or deptno=10;
-- and operater 
select * 
from emp1
where sal>20000 and deptno=10;
-- in oprater(specal opratert)
select *
from emp1
where deptno in (10,20,30,40,50,60,70,80);
-- not in oprater (specal oprate )
select*
from emp1
where deptno not in( 10, 20);
-- combination of in not in and oprater 
select *
from emp1
where job in ('Java Develope','Python Developer','Data Analyst') and deptno=10;
select*
from emp1
where job not in ('Data Engineer','java intern') and deptno in (10,20);
-- between oprater 
select*
from emp1
where sal between 20000 and 40000;
-- between oprater
select first_name,sal,hiredate
from emp1
where hiredate between '2019-12-30' and '2022-12-31';

select*
from emp1
where job in ('Java Developer','Python Developer') and deptno in (20, 30) and hiredate between '2023-01-01' and '2024-01-01'; 
select * from emp1 where deptno in (20,30);
INSERT INTO emp1(empno,first_name,last_name,age,job,mgr,sal,comm,hiredate,deptno)
VALUES
(2010, 'Namitha', 'N S', 22, 'Python Developer', NULL, 15000, NULL, '2023-01-10', 20);
update  emp1
set deptno=20
where empno=2010;
-- like operater 
select *
from emp1
where first_name like 'a%';
select*
from emp1
where first_name like '________';
-- not like oprater
select *
from emp1
where first_name not like'v%';
select first_name,sal
from emp1
where first_name like 'a%' and first_name like'h%';
select*
from emp1
where first_name like'%s%';
select first_name,hiredate
from emp1
where hiredate like'__23______';
select first_name
from emp1
where first_name like '____sh';
select*
from emp1
where first_name like '%g_';
select first_name, sal, sal*12 anual_sal,hiredate,deptno
from emp1
where job in ('Java Develope','Python Developer','Data Analyst') and deptno in(10,20,30) and sal between 40000 and 70000 and comm is null and hiredate between '2023-01-01' and '2026-01-01' and first_name like 'R%' and job like'%st' and hiredate like '_____10___'and sal*12 not between 1000000 and 1500000 and deptno not in (10);
INSERT INTO emp1(empno,first_name,last_name,age,job,mgr,sal,comm,hiredate,deptno)
VALUES
(2090, 'RNamitha', 'N S', 22, 'Python Developerst', NULL, 40010, NULL, '2023-10-10', 20);
use batch10;
select max(sal)
from emp1;
select min(sal)
from emp1;
select avg(sal)
from emp1;
select sum(sal)
from emp1;
select count(comm)
from emp1;
select*from emp1;
select count(*)
from emp1;
select*from emp1;
select count(*),deptno
from emp1
group by deptno;
select max(sal),job
from emp1
group by job;
select job,deptno, avg(sal),count(*)
from emp1
where job = 'Python Developer'
group by deptno,job;
select count(*) 'count',sal
from emp1
group by sal;
select max(sal),first_name,deptno
from emp1
group by deptno,sal,first_name;
select count(empno),max(sal),job,deptno
from emp1
where job='Java Developer'
group by deptno
having max(sal)>30000;
select count(*),job,max(sal),min(sal)
from emp1
group by job
having max(sal) < 40000 and min(sal) > 20000;
select * from emp1;
SELECT job, deptno,COUNT(*), MAX(sal), MIN(sal)
FROM emp1
GROUP BY job,deptno
HAVING MAX(sal) < 40000
AND MIN(sal) >= 15000;
select first_name,sal,job
from emp1
order by first_name;
select first_name,last_name,sal*12 'Annual Salary'
from emp1;
select first_name,job,sal*6
from emp1;
select* ,sal*12 'Annual Salary ', (sal*12)+10000 'Annual Salary with bones'
from emp1;
select first_name,sal,sal-(sal*0.25) '25% Deduction '
from emp1;
select first_name,sal,sal*12+500*12
from emp1;
select first_name,sal,sal*12-sal*0.1 '10% detection'
from emp1;
select first_name,sal, comm,sal+comm 'total salary'
from emp1;
select first_name,sal*12
from emp1;
select first_name,job,sal,sal*12,sal*12-12*100
from emp1;
select sal*12,first_name
from emp1
where first_name='Namitha';
select*from emp1;
select first_name,last_name,job
from emp1
where job='Python Developer';
select first_name,last_name,job
from emp1
where job='Java Developer';
select*
from emp1
where sal>10000;
select *
from emp1
where first_name='Gagana';
select *
from emp1
where hiredate>='2022-01-01';
select first_name,sal,sal*12
from emp1
where sal*12>='600000';
select empno,deptno
from emp1
where deptno in(10);
select first_name,hiredate
from emp1
where hiredate<'2023-01-01';
select *
from emp1
where job='Python Developer' ;
select first_name,sal,comm
from emp1
where comm>=2000;
select *
from emp1
where sal<comm;
select empno,hiredate
from emp1
where hiredate>'2021-01-01';
select *
from emp1
where job='Data Engineer';
select *
from emp1
where sal>60000;
select *
from emp1
where job='Python Developer' and sal<30000;
select first_name,last_name,hiredate
from emp1
where job='Python Developer' and deptno=20;
-- WAQTD all the details of the employees along with their
-- annual salary if they are working as Java Developer in 
-- Department 10 and their annual salary is greater than ₹6,00,000.  
select *,sal*12 'Annual Salary'
from emp1
where job='Python Developer' and deptno=10 and sal*12>600000;
use batch10;
select * 
from emp1
where job='Data Analyst' and deptno in (30);
-- WAQTD the first name and last name of the employees whose salary is less than ₹30,000 and whose designation is Java Intern.  
select first_name,last_name
from emp1
where sal<30000 and job = 'Java Developer';
-- WAQTD the first name, salary, annual salary, and department number of employees working in Department 20, earning more than 
-- ₹40,000, and having an annual salary greater than ₹5,00,000.  
select first_name,sal,sal*12 'annual salary',deptno 
from emp1
where deptno=20 and sal>40000 and sal*12>500000;
-- WAQTD the employee number, first name, and last name of employees working as ETL Developer in Department 20.  
select empno,first_name,last_name
from emp1
where job='Java Developer' and deptno in (20);
-- WAQTD the details of employees working in Department 20 or Department 30. 
select *
from emp1
where deptno=20 or deptno=30;
-- WAQTD the details of employees working as Data Engineer in Department 10.  
select *
from emp1
where job = 'Data Engineer' and deptno=10;
-- WAQTD the details of employees working as Big Data Engineer with a salary of ₹70,000.
select * 
from emp1
where job = 'Data Engineer' and sal=70000;
-- WAQTD the first name, last name, department number, and job of employees working as Python Intern in Department 20 or Department 30.  
select first_name, last_name,deptno,job
from emp1
where job = 'Python Intern' and deptno in (20,30);
-- WAQTD the details of employees working as Python Trainer or Java Trainer in Department 10.  
select *
from emp1
where job in ('Data Engineer','Python Developer') and deptno=10;
-- WAQTD the first name and last name of employees working in Departments 10, 20, 30, and 40.  
select first_name,last_name 
from emp1
where deptno in (10,20,30,40);
-- WAQTD the details of employees whose employee numbers are 1008 and 1035. 
select *
from emp1
where empno in (1008,1035);
-- WAQTD the details of employees working as Python Developer, Java Developer, or Data Engineer.
select *
from emp1
where job in ('Python Developer', 'Java Developer', 'Data Engineer');
-- WAQTD the first name and last name of employees who joined after '2021-01-01' and before '2025-01-01'.  
select first_name ,last_name
from emp1
where hiredate between '2021-01-01' and '2025-01-01';
-- WAQTD the details of employees earning more than ₹45,000 but less than ₹60,000.  
select *
from emp1
where sal between 45000 and 60000;
-- WAQTD the first name and last name of employees who joined after '2022-01-01' and are working in Department 10 or Department 30.
select first_name ,last_name,hiredate
from emp1
where hiredate>'2022-01-01' and deptno in (10,30);
-- WAQTD the first name, last name, and annual salary of employees working as Python Trainer or 
-- ETL Developer in Department 10 or Department 20.  
select first_name,last_name,sal*12
from emp1
where job in ('Data Engineer','Python Developer') and deptno in (10,20);
-- WAQTD all the details of employees along with their annual salary whose
-- salary is between ₹40,000 and ₹60,000 and whose annual salary is greater than ₹5,50,000. 
select *,sal*2
from emp1
where sal between 40000 and 60000 and sal*12>550000;
--  List all the employees whose commission is NULL.  
select first_name
from emp1
where comm is null;
-- List all the employees whose salary is greater than ₹60,000. 
select first_name
from emp1
where sal>60000;
use batch10; 
-- List all the Data Analysts in Department 30.  
select first_name,job
from emp1
where job like 'D%';
select *from emp1;

