create table department
(
	dept_id serial primary key,
	dept_name varchar(10) unique not null
)
-- drop table department;
-- drop table employees;
-- drop table projects;
create table employees
(
	emp_id  serial primary key,
	emp_name varchar(20) not null,
	email varchar(100) unique,
	salary int not null check(salary>0),
	dept_id int references department(dept_id)
);
select * from projects;
create table projects
(
	project_id serial primary key ,
	project_name varchar(40) not null,
	dept_id int references department(dept_id)
)

insert into department (dept_name)
values 
('Devops'),
('cloud'),
('testing'),
('back-end'),
('front-end'),
('DB');

insert into employees (emp_name,email,salary,dept_id)
values 
('Bharath','bharath.a@tringapps.com',10000,1),
('Jayasuriya','jayasuriya@tringapps.com',10000,2),
('mullai','mullai.m@tringapps.com',10000,1),
('jayaprakash','jayaprakash@tringapps.com',10000,3),
('Bharath1','bharath.a1@tringapps.com',10000,1),
('Jayasuriya1','jayasuriya1@tringapps.com',10000,4),
('mullai1','mullai.m1@tringapps.com',10000,2),
('jayaprakash1','jayaprakash1@tringapps.com',10000,3),
('raghul','raghul123@gmail.com',200000,1),
('raghul1','raghul1123@gmail.com',200000,1)

insert into projects (project_name,dept_id)
values
('e-commerce',2),
('library-management',1),
('weather-management',3),
('diet-recommendation',4),
('Smart_traffic',2)

select * from department,employees,projects;

select employees.emp_name,department.dept_name from employees inner join department on employees.dept_id=department.dept_id;

select department.dept_name,employees.emp_name from department left join employees on department.dept_id=employees.dept_id;

select employees.emp_name,department.dept_name from department right join employees on department.dept_id=employees.dept_id;

select employees.emp_name,department.dept_name from department full outer join employees on department.dept_id=employees.dept_id;

select employees.emp_name,department.dept_name,projects.project_name
from  employees
full outer join department on employees.dept_id = department.dept_id
full outer join projects on department.dept_id=projects.dept_id;

select department.dept_name, count(employees.emp_id)
from department
left join employees on department.dept_id = employees.dept_id
group by department.dept_name;

select department.dept_name, sum(employees.salary)
from department
left join employees on department.dept_id = employees.dept_id
group by department.dept_name;


select department.dept_name, avg(employees.salary)
from department left join employees on department.dept_id = employees.dept_id
group by department.dept_name;


select min(salary) , max(salary) from employees;

select department.dept_name, count(project_id)
from department
left join projects on department.dept_id = projects.dept_id
group by department.dept_name;

SELECT department.dept_name, AVG(employees.salary)
FROM employees 
right JOIN department ON department.dept_id = employees.dept_id
GROUP BY department.dept_name
having avg(salary)>50000

select department.dept_name,count(employees.emp_name) from department left join employees on department.dept_id=employees.dept_id
group by department.dept_name having count(employees.emp_name)>3