-- db loomine
create database rosmanGIT;

-- DB remove
drop database rosmanGIT;

use rosmanGIT;

--table gender creation
create table Gender
(
Id int NOT NULL primary key,
Gender nvarchar(10) not null
)

--table Person creation
create table Person
(
Id int not null primary key,
Name nvarchar(25),
Email nvarchar(30),
GenderId int
)

--- add values to Gender table
insert into Gender (Id, Gender)
values (1, 'Female')
insert into Gender (Id, Gender)
values (2, 'Male')

--- add foreign key to Person table 
alter table Person add constraint tblPerson_GenderId_FK
foreign key (GenderId) references Gender(Id)

--- add values to Person table
insert into Person (Id, Name, Email, GenderId)
values (1, 'Supermees', 's@s.com', 2)
insert into Person (Id, Name, Email, GenderId)
values (2, 'Wonderwoman', 'w@w.com', 1)
insert into Person (Id, Name, Email, GenderId)
values (3, 'Batman', 'b@b.com', 2)
insert into Person (Id, Name, Email, GenderId)
values (4, 'Aquaman', 'a@a.com', 2)
insert into Person (Id, Name, Email, GenderId)
values (5, 'Catwoman', 'c@c.com', 1)
insert into Person (Id, Name, Email, GenderId)
values (6, 'Antman', 'ant"ant.com', 2)
insert into Person (Id, Name, Email, GenderId)
values (7, 'Spiderman', 'spider@spiderman.com', 2)

-- view all values from person
select * from Person

--remove foreign key from Person table
alter table Person
drop constraint tblPerson_GenderId_FK

-- add new Gender
insert into Gender (Id, Gender)
values (3, 'Unknown')
-- add foreign key for Person table, default value set to 3 - Unknown
alter table Person
add constraint DF_Person_GenderId
default 3 for GenderId


---- 2 tund

-- view all values from person and gender
select * from Person
select * from Gender

--add value into Person table
insert into Person (Id, Name, Email)
values (8, 'Test', 'Test')

-- add new column Age to Person
alter table Person
add Age nvarchar(10)

--update data for 1 value in Person
update Person
set Age = 149
where Id = 8

-- add new constraint into Person to check age limits
alter table Person
add constraint CK_Person_Age check (Age > 0 and Age < 150)

-- try to add new value to check if age limits works
insert into Person (Id, Name, Email, GenderId, Age)
values (9, 'Test', 'Test', 2, 160)

--select all values from Person then delete person with ID 8 and then show all values again
select * from Person
go
delete from Person where Id = 8
go
select * from Person

--- add new column City to Person
alter table Person
add City nvarchar(25)

-- query to select a person from Gotham city
select * from Person where City = 'Gotham'


-- query to select a person who doesnt live in Gotham
select * from Person where City <> 'Gotham'
select * from Person where City != 'Gotham'

-- query to select a person with an age equals 100 or 50 or 20
select *from Person where Age = 100 or 
Age = 50 or Age = 20
select * from Person where Age in (100, 50, 20)


-- query to select a person where city starts with the letter n
select * from Person where City like 'n%'

-- query to select a person where email that contains @
select * from Person where Email like '%@%'

-- query to select a person where email not contains @
select * from Person where Email not like '%@%'

--- email before and after @-symbol.com
-- only one symbol
select * from Person where Email like '_@_.com'

-- select person whose name not starts with symbols W A S
select * from Person where Name like '[^WAS]%'

-- select a person from Gotham or New York city older or equals 40 y.o
select * from Person where (City = 'Gotham' or City = 'New York')
and Age >= 40

---select first three rows
select top 3 * from Person

--- select all values from person, then select top 3 rows by Age and show Name row
select * from Person
select top 3 Age, Name from Person

--- select 50 percent records from person
select top 50 percent * from Person

--select all from person then CAST to change datatype to INT and order by AGE
select * from Person order by cast(Age as int)
--select all from person and order by AGE
select * from Person order by Age

--sum all ages
select sum(cast(Age as int)) from Person

--select min age
select min(cast(Age as int)) from Person

--select max age
select max(cast(Age as int)) from Person

--select city, summ ages and group by City
select City, sum(cast(Age as int)) as TotalAge from Person group by City





--- tund 3

--- create table Department
create table Department
(
Id int primary key,
DepartmentName nvarchar(50),
Location nvarchar(50),
DepartmentHead nvarchar(50)
)

create table Employees
(
Id int primary key,
Name nvarchar(50),
Gender nvarchar(10),
Salary nvarchar(50),
DepartmentId int
)

--?
insert into Department (Id, DepartmentName, Location, DepartmentHead)
values (1, 'IT', 'London', 'Rick')
insert into Department (Id, DepartmentName, Location, DepartmentHead)
values (2, 'Payroll', 'Delhi', 'Ron')
insert into Department (Id, DepartmentName, Location, DepartmentHead)
values (3, 'HR', 'New York', 'Christie')
insert into Department (Id, DepartmentName, Location, DepartmentHead)
values (4, 'Other Deparment', 'Sydney', 'Cindrella')

select * from Department

insert into Employees (Id, Name, Gender, Salary, DepartmentId)
values (1, 'Tom', 'Male', 4000, 1)
insert into Employees (Id, Name, Gender, Salary, DepartmentId)
values (2, 'Pam', 'Female', 3000, 1)
insert into Employees (Id, Name, Gender, Salary, DepartmentId)
values (3, 'John', 'Male', 3500, 1)
insert into Employees (Id, Name, Gender, Salary, DepartmentId)
values (4, 'Sam', 'Male', 4500, 2)
insert into Employees (Id, Name, Gender, Salary, DepartmentId)
values (5, 'Todd', 'Male', 2800, 1)
insert into Employees (Id, Name, Gender, Salary, DepartmentId)
values (6, 'Ben', 'Male', 7000, 1)
insert into Employees (Id, Name, Gender, Salary, DepartmentId)
values (7, 'Sara', 'Female', 4800, 3)
insert into Employees (Id, Name, Gender, Salary, DepartmentId)
values (8, 'Valarie', 'Female', 5500, 1)
insert into Employees (Id, Name, Gender, Salary, DepartmentId)
values (9, 'James', 'Male', 6500, NULL)
insert into Employees (Id, Name, Gender, Salary, DepartmentId)
values (10, 'Russell', 'Male', 8800, NULL)

select * from Employees

---?
select distinct Name, DepartmentId from Employees

---?
select sum(cast(Salary as int)) from Employees
---?
select min(cast(Salary as int)) from Employees


alter table Employees
add City nvarchar(25)


alter table Employees
add DepartmentId
int null


--?
alter table Employees
add MiddleName nvarchar(30)

alter table Employees
add LastName nvarchar(30)

update Employees set FirstName = 'Tom', MiddleName = 'Nick', LastName = 'Jones'
where Id = 1
update Employees set FirstName = 'Pam', MiddleName = NULL, LastName = 'Anderson'
where Id = 2
update Employees set FirstName = 'John', MiddleName = NULL, LastName = NULL
where Id = 3
update Employees set FirstName = 'Sam', MiddleName = NULL, LastName = 'Smith'
where Id = 4
update Employees set FirstName = NULL, MiddleName = 'Todd', LastName = 'Someone'
where Id = 5
update Employees set FirstName = 'Ben', MiddleName = 'Ten', LastName = 'Sven'
where Id = 6
update Employees set FirstName = 'Sara', MiddleName = NULL, LastName = 'Connor'
where Id = 7
update Employees set FirstName = 'Valarie', MiddleName = 'Balerine', LastName = NULL
where Id = 8
update Employees set FirstName = 'James', MiddleName = '007', LastName = 'Bond'
where Id = 9
update Employees set FirstName = NULL, MiddleName = NULL, LastName = 'Crowe'
where Id = 10


--- igast reast võtab esimeses veerus täidetud lahtri ja kuvab ainult seda
select Id, coalesce(FirstName, MiddleName, LastName) as Name
from Employees

select * from Employees
select * from Department



