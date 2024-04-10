-- db loomine
create database VitaliiGit;

-- udalenie
DRop DataBASE VitaliiGit;

--Sozdanie tablicy.
use VitaliiGit;
create table Gender
(
Id int NOT NULL primary key,
Gender nvarchar(10) not null
)

create table Person
(
Id int not null primary key,
Name nvarchar(25),
Email nvarchar(30),
GenderId int
)

--- Vnesenie dannyh v tablicu.
insert into Gender (Id, Gender)
values (1, 'Female')
insert into Gender (Id, Gender)
values (2, 'Male')

--Proverjaem tablicu.
select * from Gender


-- Sozdaem kluchi.
alter table Person add constraint tblPerson_GenderId_FK
foreign key (GenderId) references Gender(Id)

-- Vnosim dannye v tablicu Person.
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

-- proverjaem tablicu
select * from Person

---Udalenie klucha.
alter table Person
drop constraint tblPerson_GenderId_FK
select * from Person

-- Dobavlenie novogo pola v tablicu Gender.
insert into Gender (Id, Gender)
values (3, 'Unknown')
select * from Gender

-- Dobavlenie vneshnego klucha.
alter table Person
add constraint DF_Person_GenderId
default 3 for GenderId


---- 2 smotrim tablicy.

select * from Person
select * from Gender

-- dobavlenie novoj stroki. 
insert into Person (Id, Name, Email)
values (8, 'Test', 'Test')
select * from Person
---dobavljaem novij stolbec
alter table Person
add Age nvarchar(10)
select * from Person

--obnovljaem dannye
update Person
set Age = 149
where Id = 8
select * from Person

--Dobavljaem ogranichenie dlja stolbca i obnovljaem dannye,
--menjaem vozrast soglasnoogranicheniju
alter table Person
add constraint CK_Person_Age check (Age > 0 and Age < 150)

insert into Person (Id, Name, Email, GenderId, Age)
values (9, 'Test', 'Test', 2, 130)
select * from Person
--udaljaem polzovatelja s ID 8
select * from Person
go
delete from Person where Id = 8
go
select * from Person

--- dobavljaem stolbec City
alter table Person
add City nvarchar(25)

-- poisk vseh kto s goroda Gotham takih 0
select * from Person where City = 'Gotham'
select * from Person

-- vseh, kto ne zhivet v Gotham
select * from Person where City <> 'Gotham'
select * from Person where City != 'Gotham'

-- vybor teh komy 100, 50, 20
select *from Person where Age = 100 or 
Age = 50 or Age = 20
select * from Person where Age in (100, 50, 20)


--- Vybor teh kto gorod nachinaetsja na n i v pochte est @
select * from Person where City like 'n%'
select * from Person where Email like '%@%'

-- teh u kogo net @ v pochte
select * from Person where Email not like '%@%'

--- näitab, kelle on emailis ees ja peale @-märki
-- ainult üks täht
select * from Person where Email like '_@_.com'

--vse kto ne nachinaetsa s bukv WAS
select * from Person where Name like '[^WAS]%'
--- Gorod raven Gotham ili New York i oni ravny 40 ili bolshe
select * from Person where (City = 'Gotham' or City = 'New York')
and Age >= 40

---võtab kolm esimest rida
select top 3 * from Person

--- tri verhnie zapisi
select * from Person
select top 3 Age, Name from Person

--- verhnie 50% zapisej
select top 50 percent * from Person
--preobrazovanie stolbca Age v celye znachenija
select * from Person order by cast(Age as int)
select * from Person order by Age

--Summa vozrasta
select sum(cast(Age as int)) from Person

--minimalnyj vozrast
select min(cast(Age as int)) from Person

--maximalnyj vozrast
select max(cast(Age as int)) from Person
-- summa vozrastov po gorodam
select City, sum(cast(Age as int)) as TotalAge from Person group by City





--- tund 3

--- Sozdajom novye tablicy
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

--vnosim dannye
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

---imena i ID bez povtorenija
select distinct Name, DepartmentId from Employees

---summa zarplat
select sum(cast(Salary as int)) from Employees
---minimalnaja zarplata
select min(cast(Salary as int)) from Employees

-- novyj stolbec v tablicu Employees
alter table Employees
add City nvarchar(25)

--novyj stolbec v tablicu Employees
alter table Employees
alter column DepartmentId int NULL;


--novyj stolbec v tablicu Employees
alter table Employees
add MiddleName nvarchar(30)
--novyj stolbec v tablicu Employees
alter table Employees
add LastName nvarchar(30)

update Employees set Name = 'Tom', MiddleName = 'Nick', LastName = 'Jones'
where Id = 1;
update Employees set Name = 'Pam', MiddleName = NULL, LastName = 'Anderson'
where Id = 2;
update Employees set Name = 'John', MiddleName = NULL, LastName = NULL
where Id = 3;
update Employees set Name = 'Sam', MiddleName = NULL, LastName = 'Smith'
where Id = 4;
update Employees set Name = NULL, MiddleName = 'Todd', LastName = 'Someone'
where Id = 5
update Employees set Name = 'Ben', MiddleName = 'Ten', LastName = 'Sven'
where Id = 6;
update Employees set Name = 'Sara', MiddleName = NULL, LastName = 'Connor'
where Id = 7;
update Employees set Name = 'Valarie', MiddleName = 'Balerine', LastName = NULL
where Id = 8;
update Employees set Name = 'James', MiddleName = '007', LastName = 'Bond'
where Id = 9;
update Employees set Name = NULL, MiddleName = NULL, LastName = 'Crowe'
where Id = 10;


--- igast reast võtab esimeses veerus täidetud lahtri ja kuvab ainult seda
select Id, coalesce(Name, MiddleName, LastName) as Name
from Employees

select * from Employees
select * from Department



