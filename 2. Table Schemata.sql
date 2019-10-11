DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS employees;


CREATE TABLE departments (
    dept_no char(4)   NOT NULL PRIMARY KEY,
    dept_name varchar   NOT NULL
);

CREATE TABLE employees (
    emp_no int   NOT NULL PRIMARY KEY,
    birth_date date   NOT NULL,
    first_name varchar   NOT NULL,
    last_name varchar   NOT NULL,
    gender char(1)   NOT NULL,
    hire_date date   NOT NULL
);

CREATE TABLE dept_emp (
    emp_no int   NOT NULL,
    FOREIGN KEY(emp_no) REFERENCES employees (emp_no),
    dept_no char(4)   NOT NULL,
    FOREIGN KEY(dept_no) REFERENCES departments (dept_no),
    from_date date   NOT NULL,
    to_date date   NOT NULL,
    PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE dept_manager (
    dept_no char(4)   NOT NULL,
    emp_no int   NOT NULL,
    FOREIGN KEY(emp_no) REFERENCES employees (emp_no),
    from_date date   NOT NULL,
    to_date date   NOT NULL
);

CREATE TABLE salaries (
    emp_no int   NOT NULL,
    FOREIGN KEY(emp_no) REFERENCES employees (emp_no),
    salary int   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL
);

CREATE TABLE titles (
    emp_no int   NOT NULL,
    FOREIGN KEY(emp_no) REFERENCES employees (emp_no),
    title varchar   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL
);