

--- loome stored procedure, mis kuvab vaate (1)
create procedure spGetEmployees
as begin
	select FirstName, Gender from Employees
end

spGetEmployees
exec spGetEmployees
execute spGetEmployees

--- protseduuri loomine, mis naitab 2 columns from emlojees koos inner joiniga (2)
create proc spGetEmployeesByGenderAndDepartment
@Gender nvarchar(20),
@DepartmentId int
as begin
	select FirstName, Gender, DepartmentId from Employees where Gender = @Gender
	and DepartmentId = @DepartmentId
end

--- kõik esimeses osakonnas meessoost töötavad isikud (3)
spGetEmployeesByGenderAndDepartment 'Male', 1

spGetEmployeesByGenderAndDepartment @DepartmentId =  1, @Gender = 'Male'



--protseduur, mis tagastab töötajate arvu sugu järgi.(4)
create proc spGetEmployeeCountByGender
@Gender nvarchar(20),
@EmployeeCount int output
as begin
	select @EmployeeCount = count(Id) from Employees where Gender = @Gender
end

-- teeb protseduur, mis tagasatb female (5)
declare @TotalCount int
exec spGetEmployeeCountByGender 'Female', @TotalCount out
if(@TotalCount = 0)
	print '@TotalCount is null'
else
	print '@TotalCount is not null'
print @TotalCount

-- annab teada, palju on meessoost isikuid (6)
declare @TotalCount int
exec spGetEmployeeCountByGender @EmployeeCount = @TotalCount out, @Gender = 'Male'
print @TotalCount

---loome protseduur mis teeb totalcount (7)
create proc spTotalCount2
@TotalCount int output
as begin
	select @TotalCount = count(Id) from Employees
end
--- käivitame sp (8)
declare @TotalEmployees int
execute spTotalCount2 @TotalEmployees output
select @TotalEmployees

---loome protseduur mis tagastab nimi from id (9)
create proc spGetNameById1
@Id int,
@FirstName nvarchar(50) output
as begin
	select @FirstName = FirstName from employees where Id = @Id
end

-- käivitamine protseduur?
declare @FirstName nvarchar(50)
execute spGetNameById1 6, @FirstName output
print 'Name of the employee = ' + @FirstName

-- loome protseduur mis tagastab nimi from id 
create proc spGetNameById2
@Id int
as begin
	return (select FirstName from Employees where Id = @Id)
end

-- käivitamine protseduuri
declare @EmployeeName nvarchar(50)
exec @EmployeeName = spGetNameById2 1
print 'Name of the employee = ' + @EmployeeName

select * from Employees
