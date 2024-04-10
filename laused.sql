-- db loomine
create database RudenkoGit;

-- db kustutamine
DRop DataBASE RudenkoGit;

--tabeli Gender loomine
use RudenkoGit
create table Gender
(
Id int NOT NULL primary key,
Gender nvarchar(10) not null
)
--tabeli Person loomine
use RudenkoGit
create table Person
(
Id int not null primary key,
Name nvarchar(25),
Email nvarchar(30),
GenderId int
)

--- andmete sisestamine tabelisse Gender
insert into Gender (Id, Gender)
values (1, 'Female')
insert into Gender (Id, Gender)
values (2, 'Male')

--- добавляет ограничение внешнего ключа (foreign key constraint) на столбец GenderId в таблице Person. ---
alter table Person add constraint tblPerson_GenderId_FK
foreign key (GenderId) references Gender(Id)

-- andmete sisestamine tabelisse Person
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

--- удаляет ограничение внешнего ключа (foreign key constraint)
alter table Person
drop constraint tblPerson_GenderId_FK

-- Добавление третьего гендера
insert into Gender (Id, Gender)
values (3, 'Unknown')
-- lisame võõrvõtme uuesti
alter table Person
add constraint DF_Person_GenderId
default 3 for GenderId


---- 2 tund
--- показать обе таблицы
select * from Person
select * from Gender
--- добавление данных в таблицу Person
insert into Person (Id, Name, Email)
values (8, 'Test', 'Test')

---Добавление столбца Age в таблицу Person
alter table Person
add Age nvarchar(10)

--uuendame andmeid
update Person
set Age = 149
where Id = 8

---добавляет ограничение проверки constraint на столбец Age в таблице Person. (Значение обязательно от 0 до 150)
alter table Person
add constraint CK_Person_Age check (Age > 0 and Age < 150)
---Команда должна добавлять нового человека в табоицу Person. Но она не работает из-за установленных ограничений.
insert into Person (Id, Name, Email, GenderId, Age)
values (9, 'Test', 'Test', 2, 160)

--удаляем человека с ID=8, в данном случае Test.
select * from Person
go
delete from Person where Id = 8
go
select * from Person

--- lisame veeru juurde
alter table Person
add City nvarchar(25)

-- команда выбирает всех у кого город Gotham и выводит в таблице. Но мы не заполняли столбец City по этому ответ на команду пустой.
select * from Person where City = 'Gotham'


-- kõik, kes ei ela Gothamis
select * from Person where City <> 'Gotham'
select * from Person where City != 'Gotham'

-- Команды выполняют одну и ту же функцию. Но из-за того что некоторые столдбцы таблицы не заподнены то результат остается пустым.
select *from Person where Age = 100 or 
Age = 50 or Age = 20
select * from Person where Age in (100, 50, 20)


--- Первый запрос дает пустую таблицу из-за незаполненных полей. Второй запрос выдает всех людей у кого есть @ в емэйле.
select * from Person where City like 'n%'
select * from Person where Email like '%@%'

-- Запрос выдает всех у кого нету @ в емэйле.
select * from Person where Email not like '%@%'

--- näitab, kelle on emailis ees ja peale @-märki
-- ainult üks täht
select * from Person where Email like '_@_.com'

--Этот запрос выбирает все записи из таблицы Person, где значение в столбце Name начинается с любого символа, кроме W, A и S
select * from Person where Name like '[^WAS]%'
--- Запрос показывает всех с городом Gotham или New York и возраст равен или больше 40.
select * from Person where (City = 'Gotham' or City = 'New York')
and Age >= 40

---võtab kolm esimest rida
select top 3 * from Person

--- Первый запрос показывает всю таблицу. Второй запрос показывает первые три записи. Если бы столбец Age был заполнен, то он бы брал 3 самых высоких значения из него и выводил их.
select * from Person
select top 3 Age, Name from Person

--- Показывает первую половину записей таблицы.
select top 50 percent * from Person
--Запрос преобразует значения столбца Age в целые числа с помощью функции CAST, а затем сортирует записи по этим целым значениям.
select * from Person order by cast(Age as int)
--Запрос выполняет сортировку по возрасту 
select * from Person order by Age

--Запрос показывает сумму всех возрастов из таблицы Person
select sum(cast(Age as int)) from Person

--Запрос показывает минимальный возраст из таблицы Person
select min(cast(Age as int)) from Person

--Запрос показывает максимальный возраст из таблицы Person
select max(cast(Age as int)) from Person
--Запрос суммирует возраста людей и группирует их по городу проживания.
select City, sum(cast(Age as int)) as TotalAge from Person group by City





--- tund 3

--- loome uued tabelid Department
create table Department
(
Id int primary key,
DepartmentName nvarchar(50),
Location nvarchar(50),
DepartmentHead nvarchar(50)
)
--- loome uued tabelid Department Employees
create table Employees
(
Id int primary key,
Name nvarchar(50),
Gender nvarchar(10),
Salary nvarchar(50),
DepartmentId int
)

--Добавление данных в таблицу Department
insert into Department (Id, DepartmentName, Location, DepartmentHead)
values (1, 'IT', 'London', 'Rick')
insert into Department (Id, DepartmentName, Location, DepartmentHead)
values (2, 'Payroll', 'Delhi', 'Ron')
insert into Department (Id, DepartmentName, Location, DepartmentHead)
values (3, 'HR', 'New York', 'Christie')
insert into Department (Id, DepartmentName, Location, DepartmentHead)
values (4, 'Other Deparment', 'Sydney', 'Cindrella')
--показать таблицу Department
select * from Department
--Добавление данных в таблицу Employees
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
--показать таблицу Employees
select * from Employees

---команда выбирает уникальные комбинации значений столбцов Name и DepartmentId из таблицы Employees
select distinct Name, DepartmentId from Employees

---Запрос показывает суммарную зарплату всех сотрудников
select sum(cast(Salary as int)) from Employees
---Запрос показывает минимальную зарплату всех сотрудников
select min(cast(Salary as int)) from Employees

---Изменение таблицы Employees. Добавление нового столбца City
alter table Employees
add City nvarchar(25)


---Изменение таблицы Employees. Добавление нового столбца DepartmentId
alter table Employees
add DepartmentId
int null


---Изменение таблицы Employees. Добавление нового столбца MiddleName
alter table Employees
add MiddleName nvarchar(30)
---Изменение таблицы Employees. Добавление нового столбца LastName
alter table Employees
add LastName nvarchar(30)
--Запрос не работает из-за того что мы установили название столбца Name. 
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


--- igast reast võtab esimeses veerus täidetud lahtri ja kuvab ainult seda.(Нужно было изменить FirstName на Name в запросе. )
select Id, coalesce(Name, MiddleName, LastName) as Name
from Employees
---Показывает обе таблицы
select * from Employees
select * from Department



