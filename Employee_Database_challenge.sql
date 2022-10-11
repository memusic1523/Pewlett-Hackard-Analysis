-- Reteieve the emp_no, first_name, last_name from Employees table.
SELECT emp_no, first_name, last_name
FROM employees
where birth_date between '1952-01-01' and '1955-12-31';
--Retrieve the title, from_date, to_date from title table.
SELECT title, from_date, to_date
FROM titles;
--Into clause
SELECT emp_no, first_name, last_name
into retirement_titles
from employees
where (birth_date between '1952-01-01' and '1955-12-31')
select * from retirement_titles;
drop table retirement_titles CASCADE;
--inner join employees and titles
SELECT em.emp_no,
em.first_name,
em.last_name,
ti.title,
ti.from_date,
ti.to_date
INTO retirement_titles
FROM employees AS em
INNER JOIN titles AS ti
ON em.emp_no = ti.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY em.emp_no;
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
where to_date = ('9999-01-01')
ORDER BY emp_no, title DESC;
SELECT * FROM unique_titles;
DROP TABLE unique_titles CASCADE;
-- Number of employees by most recent title
Select COUNT(ut.title), title
from unique_titles AS ut
GROUP BY ut.title
order by title DESC;

-- Mentorship Eligibility  
SELECT emp_no, first_name, last_name, birth_date
from employees;
SELECT from_date, to_date 
from dept_emp;
SELECT title
from titles;

SELECT DISTINCT ON (emp_no) emp_no
FROM dept_emp.emp_no = employees.emp_no;

-- join dept_emp and employee
DROP TABLE mentorship CASCADE;
SELECT em.emp_no,
em.first_name,
em.last_name,
em.birth_date,
de.from_date,
de.to_date
INTO mentorship
FROM employees AS em
INNER JOIN dept_emp AS de
ON em.emp_no = de.emp_no
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (to_date = '9999-01-01')
ORDER BY em.emp_no;
SELECT * FROM mentorship;

-- Join employee and title and filter data, Distinct ON statment
DROP TABLE retirement_eligibility cascade;
SELECT DISTINCT ON (mt.emp_no) ti.emp_no,
mt.first_name,
mt.last_name,
mt.birth_date,
mt.from_date,
mt.to_date,
ti.title
INTO retirement_eligibility
FROM mentorship AS mt
INNER JOIN titles AS ti
ON mt.emp_no = ti.emp_no
WHERE (birth_date BETWEEN '1962-01-01' AND '1965-12-31')
ORDER BY mt.emp_no;
select * from retirement_eligibility;