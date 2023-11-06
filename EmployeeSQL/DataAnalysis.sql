--List the employee number, last name, first name, sex, and salary of each employee.
SELECT EMPLOYEES.EMP_NO,
	EMPLOYEES.LAST_NAME,
	EMPLOYEES.FIRST_NAME,
	EMPLOYEES.SEX,
	SALARIES.SALARY
FROM EMPLOYEES
JOIN SALARIES ON EMPLOYEES.EMP_NO = SALARIES.EMP_NO;

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT FIRST_NAME,
	LAST_NAME,
	HIRE_DATE
FROM EMPLOYEES
WHERE EXTRACT(YEAR FROM HIRE_DATE) = 1986;

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT EMPLOYEES.EMP_NO,
	EMPLOYEES.LAST_NAME,
	EMPLOYEES.FIRST_NAME,
	DEPT_MANAGER.DEPT_NO AS MANAGER_DEPT_NO,
	DEPARTMENTS.DEPT_NAME
FROM EMPLOYEES
JOIN DEPT_MANAGER ON EMPLOYEES.EMP_NO = DEPT_MANAGER.EMP_NO
JOIN DEPARTMENTS ON DEPT_MANAGER.DEPT_NO = DEPARTMENTS.DEPT_NO;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT EMPLOYEES.EMP_NO,
	EMPLOYEES.LAST_NAME,
	EMPLOYEES.FIRST_NAME,
	DEPT_EMP.DEPT_NO,
	DEPARTMENTS.DEPT_NAME
FROM EMPLOYEES
JOIN DEPT_EMP ON EMPLOYEES.EMP_NO = DEPT_EMP.EMP_NO
JOIN DEPARTMENTS ON DEPT_EMP.DEPT_NO = DEPARTMENTS.DEPT_NO;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT FIRST_NAME,
	LAST_NAME,
	SEX
FROM EMPLOYEES
WHERE FIRST_NAME = 'Hercules'
	AND LAST_NAME LIKE 'B%';
	
--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT EMPLOYEES.EMP_NO,
	EMPLOYEES.LAST_NAME,
	EMPLOYEES.FIRST_NAME,
	DEPARTMENTS.DEPT_NO,
	DEPARTMENTS.DEPT_NAME
FROM EMPLOYEES
JOIN DEPT_EMP ON EMPLOYEES.EMP_NO = DEPT_EMP.EMP_NO
JOIN DEPARTMENTS ON DEPT_EMP.DEPT_NO = DEPARTMENTS.DEPT_NO
WHERE DEPARTMENTS.DEPT_NAME = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT EMPLOYEES.EMP_NO,
	EMPLOYEES.LAST_NAME,
	EMPLOYEES.FIRST_NAME,
	DEPARTMENTS.DEPT_NAME
FROM EMPLOYEES
JOIN DEPT_EMP ON EMPLOYEES.EMP_NO = DEPT_EMP.EMP_NO
JOIN DEPARTMENTS ON DEPT_EMP.DEPT_NO = DEPARTMENTS.DEPT_NO
WHERE DEPARTMENTS.DEPT_NAME IN ('Sales', 'Development');	
																																'Development');
--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT LAST_NAME,
	COUNT(*) AS FREQUENCY
FROM EMPLOYEES
GROUP BY LAST_NAME
ORDER BY FREQUENCY DESC;