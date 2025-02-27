create table student_details (
Student_name varchar(30),
id serial primary key,
age int,
Student_number int unique
);

alter table student_details alter column student_number type bigint

drop table student_details

select * from student_details;

create table marks(
	student_id int,
	constraint fk_student foreign key (student_id) references student_details(id),
	english real,
	maths real,
	science real,
	social real,
	total DOUBLE PRECISION
)

create type type_gender as enum ('male','female');

alter table student_details add column gender type_gender; 

drop type gender

create table department(
	dept_id serial primary key unique not null,
	dept_name text not null
)

alter table student_details add column dept_id int

alter table student_details add constraint fk_department foreign key (dept_id) references department(dept_id)

alter table student_details drop column student_id

create table Admin_details(
	student_id int,
	constraint fk_student foreign key (student_id) references student_details(id),
	total_fees int,
	paid_fees int,
	balance_fees int,
	attendence int
)

INSERT INTO student_details (Student_name, age, Student_number, dept_id, gender) VALUES
('Arun Kumar', 18, 9876543210, 1, 'male'),
('Krishna Moorthy', 19, 8765432109, 2, 'male'),
('Mohan Raj', 20, 7654321098, 3, 'male'),
('Mullai', 21, 6543210987, 4, 'female'),
('Chandran Bala', 18, 5432109876, 1, 'male'),
('Deepak Raja', 19, 4321098765, 2, 'male'),
('Vignesh Karthik', 20, 3210987654, 3, 'male'),
('jaya Prakash', 21, 2109876543, 4, 'male'),
('Venkatesh Kumar', 18, 1098765432, 1, 'male'),
('Parthiban Ravi', 19, 1987654321, 2, 'male');


INSERT INTO marks (student_id, english, maths, science, social, total) VALUES
(11, 78.5, 85.0, 90.0, 88.5, 342.0),
(12, 80.0, 75.5, 82.0, 79.0, 316.5),
(13, 85.0, 92.0, 95.0, 88.0, 360.0),
(14, 70.0, 65.5, 72.0, 68.0, 275.5),
(15, 88.0, 89.5, 91.0, 87.0, 355.5),
(16, 76.0, 80.5, 78.0, 82.0, 316.5),
(17, 90.0, 94.0, 97.0, 92.0, 373.0),
(18, 65.0, 70.5, 68.0, 72.0, 275.5),
(19, 82.0, 84.5, 88.0, 86.0, 340.5),
(20, 78.0, 79.5, 81.0, 80.0, 318.5);


INSERT INTO department (dept_name) VALUES
('Computer Science'),
('Mechanical Engineering'),
('Electrical Engineering'),
('Communication Engineering')

INSERT INTO Admin_details (student_id, total_fees, paid_fees, balance_fees, attendence) VALUES
(11, 50000, 25000, 25000, 90),
(12, 60000, 30000, 30000, 85),
(13, 55000, 55000, 0, 95),
(14, 62000, 40000, 22000, 80),
(15, 58000, 58000, 0, 92),
(16, 50000, 45000, 5000, 88),
(17, 53000, 50000, 3000, 97),
(18, 61000, 30000, 31000, 75),
(19, 59000, 59000, 0, 93),
(20, 57000, 57000, 0, 96);

--mark and department details

select student_name,dept_name,total from student_details 
left join department on student_details.dept_id=department.dept_id 
inner join marks on student_details.id=marks.student_id

select student_name, Student_number, attendence from student_details 
inner join admin_details on student_details.id = admin_details.student_id where admin_details.attendence < 90;

select department.dept_name, count(student_details.id)
from student_details
inner join department on student_details.dept_id = department.dept_id
group by department.dept_name;

-- count of student in every department

select department.dept_name, count(student_details.id)
from student_details
inner join department on student_details.dept_id = department.dept_id
group by department.dept_name
having count(student_details.id) > 2;

--group by age

select age, count(id)
from student_details
group by age
order by age desc;

--department wise attendence

select department.dept_name, avg(admin_details.attendence)
from student_details
inner join department on student_details.dept_id = department.dept_id
inner join admin_details on student_details.id = admin_details.student_id
group by department.dept_name
having avg(admin_details.attendence) < 90;

--students with mark

select student_details.student_name, marks.english, marks.maths, marks.science, marks.social, total
from student_details
inner join marks on student_details.id = marks.student_id
order by total desc;

--rank

select student_details.student_name, marks.english, marks.maths, marks.science, marks.social,total,
rank() over (order by total desc)
from student_details
inner join marks on student_details.id = marks.student_id

--dense rank

select student_details.student_name, marks.english, marks.maths, marks.science, marks.social,total,
dense_rank() over (order by total desc)
from student_details
inner join marks on student_details.id = marks.student_id

--rownumber

select student_details.student_name, marks.english, marks.maths, marks.science, marks.social,total,
row_number() over (order by total desc)
from student_details
inner join marks on student_details.id = marks.student_id

--greater than average

select student_name,total
from student_details
inner join marks on student_details.id = marks.student_id
where total > (select avg(total) from marks);

--function

create or replace function avg_marks(s_id int) 
returns real as $$
begin
    return (select (english + maths + science + social) / 4.0 
            from marks where student_id = s_id);
end;
$$ language plpgsql;

select student_name, avg_marks(id)
from student_details;