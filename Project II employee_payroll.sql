create database employee_payroll;
use employee_payroll;
CREATE TABLE user (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(255),
    password VARCHAR(255),
    email_id VARCHAR(255),
    user_type VARCHAR(255)
);
CREATE TABLE department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(255)
);
CREATE TABLE grade (
    grade_id INT PRIMARY KEY,
    grade_name VARCHAR(255),
    grade_short_name VARCHAR(255),
    grade_basic INT,
    grade_ta INT,
    grade_da INT,
    grade_hra INT,
    grade_ma INT,
    grade_bonus INT,
    grade_pf INT,
    grade_pt INT
);
CREATE TABLE employee_grade (
    transaction_id INT,
    emp_id INT,
    emp_dept_id INT,
    emp_grade_id INT,
    emp_from_date DATE,
    emp_to_date VARCHAR(255)
);
CREATE TABLE employee_salary (
    transaction_id INT PRIMARY KEY,
    emp_id INT,
    emp_salary_month VARCHAR(255),
    emp_salary_year VARCHAR(255),
    emp_salary_eimbursment_date DATETIME,
    emp_dept_id INT,
    emp_grade_id INT,
    emp_basic INT,
    emp_da INT,
    emp_ta INT,
    emp_hra INT,
    emp_ma INT,
    emp_bonus INT,
    emp_pf INT,
    emp_pt INT,
    emp_gross INT,
    emp_total_salary INT
);
CREATE TABLE employee (
    emp_id INT,
    emp_title VARCHAR(255),
    emp_name VARCHAR(255),
    emp_dob DATE,
    emp_doj DATE,
    emp_address VARCHAR(255),
    emp_city VARCHAR(255),
    emp_pincode INT,
    emp_mobile_no INT,
    emp_state VARCHAR(255),
    emp_mail_id VARCHAR(255),
    emp_pan_no VARCHAR(255),
    PRIMARY KEY (emp_id)
);
insert into department 
values(1001,'Python'),
(1002,'Analysis'),
(1003,'ML'),
(1004,'Java'),
(1005,'Marketing');

insert into employee 
values(111,'Data Analyst','Shasshank','2000-01-01','2022-12-31','11-street bnglr','Bangalore',679587,0123456,'KA','shashama@gmail.com','0231221'),
(112,'Sales Manager','Sourav','2001-01-01','2022-11-30','21-street Kannur','Kannur',679585,0123476,'KL','sourav1@gmail.com','0231332'),
(113,'Web Developer','Sai','1999-01-01','2022-01-17','Street 101','Malappuram',679567,0123445,'KL','sai@gmail.com','0231254');

insert into employee_grade values(123456789,111,1002,3,'2022-12-31','2023-05-23'),
(987654321,112,1005,2,'2022-11-30','2023-03-10'),
(214365879,113,1004,1,'2022-01-17','2023-11-18');

insert into employee_salary values(123456789,111,'Jan','2023','2023-01-30 17:00:00',1002,3,6000,200,100,100,150,50,130,200,6930,6500),
(987654321,112,'Jan','2023','2023-01-30 17:00:00',1005,2,7000,200,100,100,150,50,130,200,7930,7500),
(214365879,113,'Jan','2023','2023-01-30 17:00:00',1004,1,9000,200,100,100,150,50,130,200,9930,9500);

insert into grade 
values(3,'Level-3','L3',5000,200,100,100,150,50,130,200),
(2,'Level-2','L2',6000,200,100,100,150,50,130,200),
(1,'Level-1','L1',7000,200,100,100,150,50,130,200);
insert into user 
values(345,'Sikhin','lesgo12','sikhmail@gmail.com','Intermed'),
(456,'Rahul','Rahot14','ra@gmail.com','Beginner'),
(453,'Rah','Ra14','rahul@gmail.com','Adv'),
(432,'Praveen','notpr','pra@gmail.com','Beginner');
alter table employee_grade modify transaction_id int primary key;
alter table employee_grade add constraint foreign key(emp_id) references employee(emp_id);
alter table employee_salary add constraint foreign key(emp_id) references employee(emp_id);
alter table employee_grade  add constraint foreign key(emp_dept_id) references department(department_id);
alter table employee_salary add constraint foreign key(emp_dept_id) references department(department_id);
alter table employee_salary add constraint foreign key(transaction_id) references employee_grade(transaction_id);

SELECT 
    e.emp_id,
    e.emp_name,
    eg.emp_from_date,
    eg.emp_to_date,
    es.emp_total_salary
FROM
    employee e
        JOIN
    employee_grade eg ON e.emp_id = eg.emp_id
        JOIN
    employee_salary es ON es.emp_id = eg.emp_id;
    
    select* from user;
    select* from employee_salary where emp_total_salary>6500;
