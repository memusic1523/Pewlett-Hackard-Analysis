-- Creating tables for PH-EmployeeDB
CREATE TABLE departments (
     dept_no VARCHAR(4) NOT NULL,
     dept_name VARCHAR(40) NOT NULL,
     PRIMARY KEY (dept_no),
     UNIQUE (dept_name)
);
Drop table managers CASCADE;
CREATE TABLE managers (
	dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);
select * from managers;
CREATE TABLE employees (
	  emp_no INT NOT NULL,
     birth_date DATE NOT NULL,
     first_name VARCHAR NOT NULL,
     last_name VARCHAR NOT NULL,
     gender VARCHAR NOT NULL,
     hire_date DATE NOT NULL,
     PRIMARY KEY (emp_no)
);

DROP TABLE salaries CASCADE;

CREATE TABLE salaries (
  emp_no INT NOT NULL,
  salary INT NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (emp_no)
);
Select * from salaries;

DROP TABLE titles CASCADE;

CREATE TABLE titles (
  emp_no INT NOT NULL,
  title VARCHAR NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (emp_no, title, from_date)
);
SELECT * FROM titles;

DROP TABLE dept_emp CASCADE;
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
    dept_no VARCHAR(4) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
FOREIGN KEY (emp_no) references employees (emp_no),
FOREIGN KEY (dept_no) references departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);
SELECT * FROM dept_emp;

-- Data is imported
SELECT * FROM departments;

select * from managers;

SELECT * FROM employees;
SELECT * FROM dept_emp;
SELECT * FROM titles;
SELECT * FROM salaries;