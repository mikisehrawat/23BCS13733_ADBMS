use happy;
create table tab_emp
(
	EMP_ID int identity(101,2),
	EMP_NAME varchar(10)
);

insert into tab_emp (EMP_NAME) values('A');
insert into tab_emp (EMP_NAME) values('B');
insert into tab_emp (EMP_NAME) values('C');
select * from tab_emp;

create table tbl_author
(
	author_id int primary key,
	author_name varchar(max),
	country varchar(max)
)

create table tbl_book
(
	book_id int primary key,
	book_title varchar(max),
	authorid int 
	foreign key (authorid) references tbl_author(author_id)
)

insert into tbl_book(book_id , book_title , authorid) values (1,'A',1),
															 (2,'B',2),
															 (3,'C',3)

insert into tbl_author(author_id , author_name , country) values (1,'Harsh','India'),
															 (2,'Tushar','USA'),
															 (3,'Nikhil','UK')
select * from tbl_author

select b.book_title,a.author_name,a.country
from tbl_author as a
inner join tbl_book as b
on a.author_id= b.authorid


-- Medium-Level Problem*

create table department
(
	department_id int primary key,
	department_name varchar(max)
)

create table courses
(
	course_id int primary key,
	course_name varchar(max),
	department_id int foreign key (department_id) references department(department_id)
)

insert into department (department_id,department_name) values (1,'Computer Science'),
															  (2,'Civil Engineering'),
															  (3,'Biotechnology'),
															  (4,'Mechenical Engineering'),
															  (5,'Electrical Engineering')

insert into courses(course_id,course_name,department_id) values (101, 'Data Structures', 1),
																(102, 'Algorithms', 1),
																(103, 'Database Systems', 1),
																(201, 'Thermodynamics', 2),
																(301, 'Circuit Theory', 3),
																(302, 'Power Systems', 3),
																(401, 'Structural Analysis', 4),
																(402, 'Building Materials', 4),
																(403, 'Surveying', 4),
																(404, 'Geotechnical Engineering', 4),
																(501, 'Molecular Biology', 5)
select * from department

select * from courses

SELECT department.department_name
FROM department 
JOIN courses  ON department.department_id = courses.department_id
GROUP BY department.department_id, department.department_name
HAVING COUNT(*) >= 2;

CREATE LOGIN TEST_LOGIN
WITH PASSWORD = 'ABC@123'

CREATE USER TEST_USER
FOR LOGIN TEST_LOGIN

GRANT SELECT, UPDATE, DELETE ON course TO TEST_USER
