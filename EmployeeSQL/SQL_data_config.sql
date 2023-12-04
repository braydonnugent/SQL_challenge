--DATA ENGINEERING--

CREATE TABLE department(
    department_id SERIAL PRIMARY KEY,
    dept_no VARCHAR(20) UNIQUE,
    dept_name VARCHAR(20) UNIQUE
);
SELECT * FROM department LIMIT 10;

CREATE TABLE titles(
	titles_id SERIAL PRIMARY KEY,
    title_id VARCHAR(20) UNIQUE,
    title VARCHAR(20) UNIQUE
);
SELECT * FROM titles LIMIT 10;

CREATE TABLE salaries(
    salaries_id SERIAL PRIMARY KEY,
    emp_no INT UNIQUE,
    salary INT
);
SELECT * FROM salaries LIMIT 10;

CREATE TABLE dept_emp (
    dept_emp_id SERIAL PRIMARY KEY,
    emp_no INT NOT NULL, 
    dept_no VARCHAR(20),
    FOREIGN KEY (dept_no) REFERENCES department(dept_no),
    FOREIGN KEY (emp_no) REFERENCES salaries(emp_no)
);
SELECT * FROM dept_emp LIMIT 10;

CREATE TABLE dept_manager (
    dept_manager_id SERIAL PRIMARY KEY,
	dept_no VARCHAR,
    emp_no INT,
    FOREIGN KEY (dept_no) REFERENCES department(dept_no),
    FOREIGN KEY (emp_no) REFERENCES salaries(emp_no)
);
SELECT * FROM dept_manager LIMIT 10;

DROP TABLE employees;
CREATE TABLE employees (
    employees_id SERIAL PRIMARY KEY,
    emp_no INT,
    emp_title_id VARCHAR(20),
    birth_date VARCHAR(10),
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    sex CHAR,
    hire_date VARCHAR(10),
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
    FOREIGN KEY (emp_no) REFERENCES salaries(emp_no)
);
SELECT * FROM employees LIMIT 10;

COPY department(dept_no, dept_name) FROM 'C:\Users\nugen\Desktop\DATA ANALYTICS COURSE\Module 9 (SQL)\SQL_challenge\Starter_Code\data\departments.csv' DELIMITER ',' CSV HEADER;
COPY salaries(emp_no, salary) FROM 'C:\Users\nugen\Desktop\DATA ANALYTICS COURSE\Module 9 (SQL)\SQL_challenge\Starter_Code\data\salaries.csv' DELIMITER ',' CSV HEADER;
COPY titles(title_id, title) FROM 'C:\Users\nugen\Desktop\DATA ANALYTICS COURSE\Module 9 (SQL)\SQL_challenge\Starter_Code\data\titles.csv' DELIMITER ',' CSV HEADER;
COPY dept_emp(emp_no, dept_no) FROM 'C:\Users\nugen\Desktop\DATA ANALYTICS COURSE\Module 9 (SQL)\SQL_challenge\Starter_Code\data\dept_emp.csv' DELIMITER ',' CSV HEADER;
COPY dept_manager(dept_no, emp_no) FROM 'C:\Users\nugen\Desktop\DATA ANALYTICS COURSE\Module 9 (SQL)\SQL_challenge\Starter_Code\data\dept_manager.csv' DELIMITER ',' CSV HEADER;
COPY employees(emp_no, emp_title_id, birth_date, first_name, last_name, sex, hire_date) FROM 'C:\Users\nugen\Desktop\DATA ANALYTICS COURSE\Module 9 (SQL)\SQL_challenge\Starter_Code\data\employees.csv' DELIMITER ',' CSV HEADER;

--DATA ANALYSIS

--List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary AS "salary($)"
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%/1986';

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT 
    dm.dept_no,
    d.dept_name,
    dm.emp_no AS manager_emp_no,
    e.last_name AS manager_last_name,
    e.first_name AS manager_first_name
FROM dept_manager dm
JOIN department d ON dm.dept_no = d.dept_no
JOIN employees e ON dm.emp_no = e.emp_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT 
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN department d ON de.dept_no = d.dept_no;

--List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' and last_name like 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT
	e.emp_no,
	e.last_name,
	e.first_name

FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN department d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';
	
--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
	
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN department d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS last_name_count
FROM employees
GROUP BY last_name
ORDER BY last_name_count DESC;
