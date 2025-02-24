//exp-2
1.create database cms;
2.drop database cms;
3.
4.use cms;
5.
//exp-3
1.create table Department(DepartmentID int primary key,Name varchar(25),Number int,ManagerID int,StartDate date,Location varchar(25),foreign key(ManagerID) references Employee(ManID);
2.create table Project(ProjectID int primary key,Name varchar(25),Number int,Location varchar(25),DepartmentID int,foreign key(DepartmentID) references Department(DepartmentID));
3.create table Employee(EmployeeID int primary key,Name varchar(50),SSN int,Address varchar(50),Salary int,Gender varchar(10),BirthDate date,Role varchar(25),DepartmentID int,SupervisorID int,foreign key(DepartmentID) references Department(DepartmentID),foreign key(SupervisorID) references Employee(SupervisorID);
4.create table ProjectAssignment(AssignmentID int primary key,EmployeeID int,ProjectID int,HoursPerWeek int,foreign key(EmployeeID) references Employee(EmployeeID),foreign key(ProjectID) references Project(ProjectID));
