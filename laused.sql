-- db loomine
create database suhhanovaGit;

--db kustutamine
DRop DataBASE suhhanovaGit;

--tabeli Gender loomine
use suhhanovaGit;
create table Gender
(
Id int NOT NULL primary key,
Gender nvarchar(10) not null
)
--tabeli Person loomine
create table Person
(
Id int not null primary key,
Name nvarchar(25),
Email nvarchar(30),
GenderId int
)

--- andmete sisestamine tabelisse
insert into Gender (Id, Gender)
values (1, 'Female')
insert into Gender (Id, Gender)
values (2, 'Male')

--- updating the table Person- adding foreign key
alter table Person add constraint tblPerson_GenderId_FK
foreign key (GenderId) references Gender(Id)

-- data adding to the table person
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

-- vaatame tabeli andmeid
select * from Person
-------------------------
--- deleting the constraint named as tblPerson_GenderId_FK
alter table Person
drop constraint tblPerson_GenderId_FK

-- adding to the table "Gender" third value
insert into Gender (Id, Gender)
values (3, 'Unknown')
-- lisame võõrvõtme uuesti
alter table Person
add constraint DF_Person_GenderId
default 3 for GenderId


---- 2 tund

select * from Person
select * from Gender
-- adding test value
insert into Person (Id, Name, Email)
values (8, 'Test', 'Test')

---adding the column "Age"
alter table Person
add Age nvarchar(10)

--uuendame andmeid
update Person
set Age = 149
where Id = 8
update Person
set Age = 150
where Id = 1

-- adding constraint with a condition
alter table Person
add constraint CK_Person_Age check (Age > 0 and Age < 150)

-- deleting constraint
alter table Person
drop constraint CK_Person_Age

-- adding constraint with a condition
alter table Person
add constraint CK_Person_Age check (Age > 0 and Age < 161)

--adding data
insert into Person (Id, Name, Email, GenderId, Age)
values (9, 'Test', 'Test', 2, 160)

-- deleting person with id equals to 8
select * from Person
go
delete from Person where Id = 8
go
select * from Person
-----------------------------------------------
--- lisame veeru juurde
alter table Person
add City nvarchar(25)

--uuendame andmeid
update Person
set City = 'Gotham'
where Id in (1, 3, 5)
update Person
set City = 'Los-Angeles'
where Id = 8

-- show people who lives in Gotham
select * from Person where City = 'Gotham'


-- kõik, kes ei ela Gothamis
select * from Person where City <> 'Gotham'
select * from Person where City != 'Gotham'

-- show people with conditions
select *from Person where Age = 100 or 
Age = 50 or Age = 20
select * from Person where Age in (100, 50, 20)


--- where there is 'n' letter in the city
select * from Person where City like 'n%'
--- where there is '@' sign in email
select * from Person where Email like '%@%'

-- where are not '@' sign in email
select * from Person where Email not like '%@%'

--- näitab, kelle on emailis ees ja peale @-märki
-- ainult üks täht
select * from Person where Email like '_@_.com'

--show where Name has one of the letters
select * from Person where Name like '[^WAS]%'
--- show where city is gotham or 'New York' and age is more and equals than 40
select * from Person where (City = 'Gotham' or City = 'New York')
and Age >= 40

---võtab kolm esimest rida
select top 3 * from Person

--- top 3 and showing only age and name columns
select * from Person
select top 3 Age, Name from Person

--- selects the top 50% of rows from person table
select top 50 percent * from Person
-- selecting all from the table person where will be sorted by age as an integer
select * from Person order by cast(Age as int)
-- selecting all from the table person where will be sorted by age as a letter or sign
select * from Person order by Age

--calculates the sum of all ages in the person table
select sum(cast(Age as int)) from Person

-- selects the minimum age in the person table
select min(cast(Age as int)) from Person

--select the maximum age in the person table
select max(cast(Age as int)) from Person
--calculates the sum of all ages who live in a specific city
select City, sum(cast(Age as int)) as TotalAge from Person group by City





--- tund 3

--- loome uued tabelid
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

-- inserting data to the tables
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

---selecting distinct names 
select distinct Name, DepartmentId from Employees

--- selecting the sum of all salaries from the table employees
select sum(cast(Salary as int)) from Employees
---selecting the minimum of all salaries from the table employees
select min(cast(Salary as int)) from Employees

--updating table employees
alter table Employees
add City nvarchar(25)

select * from Employees
-- the column with name 'DepartmentId' is existing already
alter table Employees
add DepartmentId
int null


--adding a new column MiddleName
alter table Employees
add MiddleName nvarchar(30)
--adding a new column LastName
alter table Employees
add LastName nvarchar(30)
---------------------------------------------------------------
-- there is not column 'fristname', I changed 'FirstName' to 'Name'
update Employees set Name = 'Tom', MiddleName = 'Nick', LastName = 'Jones'
where Id = 1
update Employees set Name = 'Pam', MiddleName = NULL, LastName = 'Anderson'
where Id = 2
update Employees set Name = 'John', MiddleName = NULL, LastName = NULL
where Id = 3
update Employees set Name = 'Sam', MiddleName = NULL, LastName = 'Smith'
where Id = 4
update Employees set Name = NULL, MiddleName = 'Todd', LastName = 'Someone'
where Id = 5
update Employees set Name = 'Ben', MiddleName = 'Ten', LastName = 'Sven'
where Id = 6
update Employees set Name = 'Sara', MiddleName = NULL, LastName = 'Connor'
where Id = 7
update Employees set Name = 'Valarie', MiddleName = 'Balerine', LastName = NULL
where Id = 8
update Employees set Name = 'James', MiddleName = '007', LastName = 'Bond'
where Id = 9
update Employees set Name = NULL, MiddleName = NULL, LastName = 'Crowe'
where Id = 10


--- igast reast võtab esimeses veerus täidetud lahtri ja kuvab ainult seda
select Id, coalesce(FirstName, MiddleName, LastName) as Name
from Employees

select * from Employees
select * from Department



