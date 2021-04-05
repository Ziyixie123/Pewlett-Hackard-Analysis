--Retrieve the emp_no, first_name, and last_name columns from the Employees table.
SELECT emp_no, first_name, last_name
FROM employees
--Retrieve the title, from_date, and to_date columns from the Titles table
SELECT title, from_date, to_date
FROM titles

--create a joined table 
SELECT employees.emp_no,
    employees.first_name,
employees.last_name,
   titles.title,
   titles.from_date,
   titles.to_date
Into retirement_titlese
From titles
Inner JOIN employees
ON employees.emp_no = titles.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no



-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, 
first_name,
last_name,
title

INTO unique_titles
FROM retirement_titlese
ORDER BY emp_no, to_date DESC;


--Crete retiring_tiles with count 
SELECT COUNT(title),title
INTO retiring_titles
FROM unique_titles


GROUP BY title 
ORDER BY COUNT(title) DESC
;

--part II : create a Mentorship Eligibility table that holds the employees who are eligible to participate in a mentorship program.

--Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table
SELECT emp_no,first_name,last_name,birth_date 
FROM Employees

--Retrieve the from_date and to_date columns from the Department Employee table
SELECT from_date,to_date 
FROM dept_emp

--Retrieve the title column from the Titles table
SELECT title
From titles


--join employess and titles 
SELECT Employees.emp_no,
 Employees.first_name,
 Employees.last_name,
 Employees.birth_date,
titles.title
INTO test
From titles

Inner JOIN employees
ON employees.emp_no = titles.emp_no
-- get the final table 

SELECT DISTINCT ON (test.emp_no) test.emp_no,
 test.first_name,
test.last_name,
 test.birth_date,
dept_emp.from_date,
dept_emp.to_date

INTO mentorship_eligibilty
From dept_emp

Inner JOIN test
ON test.emp_no = dept_emp.emp_no
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND( dept_emp.to_date = ('9999-01-01'))
Order by test.emp_no;









 


