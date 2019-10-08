-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT 	    e.emp_no as "Employee Number", 
		    e.last_name as "Last Name", 
		    e.first_name as "First Name", 
		    e.gender as "Gender",
		    s.salary as "Salary"
FROM        employees as e
INNER JOIN  salaries as s
ON          e.emp_no = s.emp_no;

-- 2. List employees who were hired in 1986.

SELECT 	emp_no as "Employee Number", 
		last_name as "Last Name", 
		first_name as "First Name", 
		gender as "Gender",
		hire_date as "Hire Date"
FROM    employees
WHERE   hire_date BETWEEN '1986-01-01'
AND     '1986-12-31';


-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, 
-- last name, first name, and start and end employment dates.

SELECT      dm.dept_no as "Department No.",
		    d.dept_name as "Dept Name",
		    dm.emp_no as "Manager Employee No.",
		    e.last_name as "Manager Last Name",
		    e.first_name as "Manager First Name",
		    de.from_date as "Manager Start Emp Start Date",
		    de.to_date as "Manager End Emp Start Date"
FROM        departments as d 
INNER JOIN  dept_manager as dm
ON          d.dept_no = d.dept_no
INNER JOIN  employees as e
ON          e.emp_no = dm.emp_no
INNER JOIN  dept_emp as de
ON          e.emp_no = de.emp_no AND de.dept_no = d.dept_no;

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

SELECT      e.emp_no as "Employee No.",
		    e.last_name as "Last Name",
		    e.first_name as "First Name",
		    d.dept_name as "Department Name",
		    de.from_date as "From",
		    de.to_date as "To"
FROM        employees as e
INNER JOIN  dept_emp as de
ON          e.emp_no = de.emp_no
INNER JOIN  departments as d
ON          d.dept_no = de.dept_no
ORDER BY    e.emp_no;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."

SELECT  emp_no as "Employee No.",
		first_name as "First Name",
		last_name as "Last Name"
FROM    employees
WHERE   first_name='Hercules' 
AND     last_name LIKE 'B%';


-- 6. List all employees in the Sales department, including 
-- their employee number, last name, first name, and department name.

SELECT  e.emp_no as "Employee No.",
		e.first_name as "First Name",
		e.last_name as "Last Name",
		d.dept_name as "Department Name",
		de.from_date,
		de.to_date
FROM    employees as e
JOIN	dept_emp as de
ON		e.emp_no = de.emp_no
JOIN	departments as d
ON		d.dept_no = de.dept_no
WHERE	d.dept_no = 'd007'
--AND		de.to_date <= current_date -- EMPLOYEES STILL HIRED
ORDER BY e.emp_no; 


-- 7. List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.

SELECT      e.emp_no as "Employee No.",
		    e.last_name as "Last Name",
		    e.first_name as "First Name",
		    d.dept_name as "Department Name",
            de.from_date,
		    de.to_date
FROM        employees as e
JOIN	    dept_emp as de
ON		    e.emp_no = de.emp_no
JOIN	    departments as d
ON		    d.dept_no = de.dept_no
WHERE 	    d.dept_no IN ('d005', 'd007')
ORDER BY    e.emp_no; 


-- 8. In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.

SELECT      last_name, count(emp_no)
FROM        employees
GROUP BY    last_name
ORDER by    last_name DESC;

