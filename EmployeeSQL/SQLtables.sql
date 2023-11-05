CREATE TABLE departments (
    dept_no VARCHAR(50) PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);
copy departments FROM 'C:\Users\sampl\OneDrive\Desktop\Data_Analytics\Week9SQL\sql-challenge\data\departments.csv'
Delimiter ','
CSV HEADER;
CREATE TABLE titles (
    title_id VARCHAR(10) PRIMARY KEY,
    title VARCHAR(50) NOT NULL
);
copy titles FROM 'C:\Users\sampl\OneDrive\Desktop\Data_Analytics\Week9SQL\sql-challenge\data\titles.csv'
Delimiter ','
CSV HEADER;
CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR(10) REFERENCES titles(title_id),
    birth_date DATE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date DATE NOT NULL
);
copy employees FROM 'C:\Users\sampl\OneDrive\Desktop\Data_Analytics\Week9SQL\sql-challenge\data\employees.csv'
Delimiter ','
CSV HEADER;
CREATE TABLE salaries (
    emp_no INT PRIMARY KEY,
    salary INT NOT NULL
);
copy salaries FROM 'C:\Users\sampl\OneDrive\Desktop\Data_Analytics\Week9SQL\sql-challenge\data\salaries.csv'
Delimiter ','
CSV HEADER;
CREATE TABLE dept_emp (
    emp_no INT,
    dept_no VARCHAR(50) REFERENCES departments(dept_no),
    PRIMARY KEY (emp_no, dept_no)
);
copy dept_emp FROM 'C:\Users\sampl\OneDrive\Desktop\Data_Analytics\Week9SQL\sql-challenge\data\dept_emp.csv'
Delimiter ','
CSV HEADER;
CREATE TABLE dept_manager (
    dept_no VARCHAR(50) REFERENCES departments(dept_no),
    emp_no INT,
    PRIMARY KEY (dept_no, emp_no)
);
copy dept_manager FROM 'C:\Users\sampl\OneDrive\Desktop\Data_Analytics\Week9SQL\sql-challenge\data\dept_manager.csv'
Delimiter ','
CSV HEADER;