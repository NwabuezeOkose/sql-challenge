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