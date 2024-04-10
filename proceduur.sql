
drop procedure spGetEmployees
--- loome stored procedure, mis kuvab vaate
create procedure spGetEmployees
as begin
	select Name, Gender from Employees
end;
use RudenkoGit
exec spGetEmployees
execute spGetEmployees

--- Создание процедуры которая  выбирает из таблицы Employees имена (Name), полы (Gender) и идентификаторы отделов (DepartmentId) сотрудников.
create proc spGetEmployeesByGenderAndDepartment
@Gender nvarchar(20),
@DepartmentId int
as begin
	select Name, Gender, DepartmentId from Employees where Gender = @Gender
	and DepartmentId = @DepartmentId
end


--- kõik esimeses osakonnas meessoost töötavad isikud
spGetEmployeesByGenderAndDepartment 'Male', 1

spGetEmployeesByGenderAndDepartment @DepartmentId =  1, @Gender = 'Male'



--Создание процедуры spGetEmployeeCountByGender которая  принимает в качестве параметра @Gender строку с указанием пола сотрудников и возвращает количество сотрудников этого пола через параметр вывода @EmployeeCount.
create proc spGetEmployeeCountByGender
@Gender nvarchar(20),
@EmployeeCount int output
as begin
	select @EmployeeCount = count(Id) from Employees where Gender = @Gender
end

-- Пример использования процедуры spGetEmployeeCountByGender
declare @TotalCount int
exec spGetEmployeeCountByGender 'Female', @TotalCount out
if(@TotalCount = 0)
	print '@TotalCount is null'
else
	print '@TotalCount is not null'
print @TotalCount

-- annab teada, palju on meessoost isikuid
declare @TotalCount int
exec spGetEmployeeCountByGender @EmployeeCount = @TotalCount out, @Gender = 'Male'
print @TotalCount

---Процедура принимает название @TotalCount в качестве параметра вывода, которое будет содержать общее количество сотрудников в таблице Employees
create proc spTotalCount2
@TotalCount int output
as begin
	select @TotalCount = count(Id) from Employees
end
--- käivitame spTotalCount2
declare @TotalEmployees int
execute spTotalCount2 @TotalEmployees output
select @TotalEmployees

--- Процедура spGetNameById1 принимает входной параметр @Id, который представляет собой идентификатор сотрудника, и параметр вывода @Name, который будет содержать имя сотрудника с указанным идентификатором.
create proc spGetNameById1
@Id int,
@Name nvarchar(50) output
as begin
	select @Name = Name from employees where Id = @Id
end

--Запуск процедуры
declare @Name nvarchar(50)
execute spGetNameById1 6, @Name output
print 'Name of the employee = ' + @Name

--Процедура spGetNameById2 принимает входной параметр @Id, который представляет собой идентификатор сотрудника. Возвращаемое значение этой процедуры - это имя сотрудника с указанным идентификатором. 
create proc spGetNameById2
@Id int
as begin
	return (select Name from Employees where Id = @Id)
end

-- Запуск процедуры
declare @EmployeeName nvarchar(50)
exec @EmployeeName = spGetNameById2 1
print 'Name of the employee = ' + @EmployeeName

select * from Employees
