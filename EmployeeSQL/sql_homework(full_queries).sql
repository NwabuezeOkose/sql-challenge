-- Table for employees

DROP TABLE employees;

CREATE TABLE employees(
	PRIMARY KEY (emp_no),
	emp_no INT NOT NULL,
	emp_title_id VARCHAR (225),
	birth_date DATE NOT NULL,
	first_name VARCHAR (225),
	last_name VARCHAR (225),
	sex VARCHAR (225),
	hire_date DATE NOT NULL
);

SELECT *
FROM employees

-- Table for departments

DROP TABLE departments;

CREATE TABLE departments (
	PRIMARY KEY (dept_no),
	dept_no VARCHAR (225),
	dept_name VARCHAR (225)
);

SELECT *
FROM departments

-- Table for department manager
DROP TABLE dept_manager;

CREATE TABLE dept_manager(
	PRIMARY KEY (dept_no,emp_no),
	dept_no VARCHAR (225),
	emp_no INT NOT NULL
);

SELECT *
FROM dept_manager

--Table for salaries
DROP TABLE salaries;

CREATE TABLE salaries(
	PRIMARY KEY (emp_no),
	emp_no INT NOT NULL,
	salary INT NOT NULL
);

SELECT *
FROM salaries

--Table for department employees
DROP TABLE dept_emp;

CREATE TABLE dept_emp(
	PRIMARY KEY (emp_no,dept_no),
	/*id SERIAL PRIMARY KEY, (Here I ran into some problrms with th eprimary key cause it required two inputs
	so during office hours a fellow student gave me a solution by using id as the PRIMARY KEY but since I did not
	use id in the the other tables I decided to go with the solution the TA gave me as shown in the above 
	PRIMARY KEY)
	*/
	emp_no INT NOT NULL,
	dept_no VARCHAR (225)
);

SELECT * 
FROM dept_emp


--Table for titles
DROP TABLE titles;

CREATE TABLE titles(
	PRIMARY KEY (title_id),
	title_id VARCHAR (225),
	title VARCHAR (225)
);

SELECT * 
FROM titles


/* Data Analysis Question 1
List the following details of each employee: employee number, last name, first name, sex, and salary.
*/
SELECT e.emp_no,
e.last_name,
e.first_name,
e.sex,
s.salary
FROM employees e
JOIN salaries s
ON e.emp_no = s.emp_no;


/* Data Analysis Question 2
List first name, last name, and hire date for employees who were hired in 1986.
*/

SELECT first_name, last_name, hire_date
FROM employees
WHERE extract(year FROM hire_date) = '1986';


/* Data Analysis Question 3
List the manager of each department with the following information: department number, department name, 
the manager's employee number, last name, first name
*/

--i'l be using the letter "m" for managers instead of e like for employees
SELECT m.dept_no, 
dept_name, 
m.emp_no, 
first_name, 
last_name
FROM dept_manager m
LEFT JOIN departments ON m.dept_no = departments.dept_no
LEFT JOIN employees ON m.emp_no = employees.emp_no;


/* Data Analysis Question 4
List the department of each employee with the following information: employee number, last name, 
first name, and department name.
*/

SELECT e.emp_no,
last_name,
first_name,
dept_name
FROM employees e
LEFT JOIN dept_emp d ON e.emp_no = d.emp_no
LEFT JOIN departments ON d.dept_no = departments.dept_no;


/* Data Analysis Question 5
List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B
*/

SELECT * 
FROM employees
WHERE(first_name LIKE 'Hercules' AND last_name LIKE '%B%');


/* Data Analysis Question 6
List all employees in the Sales department, including their employee number, last name, first name,
and department name
*/

SELECT e.emp_no,
last_name,
first_name,
dept_name
FROM employees e
LEFT JOIN dept_emp d ON e.emp_no = d.emp_no
LEFT JOIN departments ON d.dept_no = departments.dept_no
WHERE departments.dept_name LIKE 'Sales';


/* Data Analysis Question 7
List all employees in the Sales and Development departments, including their employee number, 
last name, first name, and department name
*/


SELECT e.emp_no,
last_name,
first_name,
dept_name
FROM employees e
LEFT JOIN dept_emp d ON e.emp_no = d.emp_no
LEFT JOIN departments ON d.dept_no = departments.dept_no
WHERE departments.dept_name LIKE 'Sales'
OR departments.dept_name LIKE 'Developement';

/* Data Analysis Question 8
In descending order, list the frequency count of employee last names, 
i.e., how many employees share each last name
*/

SELECT last_name, COUNT(last_name) AS "name_count"
FROM employees
GROUP BY last_name
ORDER BY name_count DESC;