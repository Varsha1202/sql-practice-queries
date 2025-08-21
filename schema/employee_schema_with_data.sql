CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    ename VARCHAR(50),
    job_title VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE,
    city VARCHAR(50),
    dept_id INT,
    commission_rate DECIMAL(4,2),
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

CREATE TABLE projects (
    proj_id INT PRIMARY KEY,
    proj_name VARCHAR(100),
    start_date DATE,
    end_date DATE,
    dept_id INT REFERENCES departments(dept_id),
    FOREIGN KEY (dept_id) 
);

CREATE TABLE emp_projects (
    emp_id INT,
    proj_id INT,
    hours_worked INT,
    PRIMARY KEY (emp_id, proj_id),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id),
    FOREIGN KEY (proj_id) REFERENCES projects(proj_id)
);

CREATE TABLE salaries (
    emp_id INT,
    from_date DATE,
    to_date DATE,
    amount DECIMAL(10,2),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

-- Sample Data
INSERT INTO departments VALUES
(10, 'HR', 'London'),
(20, 'Finance', 'New York'),
(30, 'IT', 'San Jose'),
(40, 'Sales', 'Barcelona');

INSERT INTO employees VALUES
(1001, 'Peel', 'Manager', 60000, '1995-03-10', 'London', 10, 0.12),
(1002, 'Serres', 'Analyst', 55000, '1996-02-14', 'San Jose', 30, 0.13),
(1003, 'AxelRod', 'Clerk', 45000, '1996-05-20', 'New York', 20, 0.10),
(1004, 'Motika', 'Salesman', 48000, '1994-11-30', 'London', 40, 0.11),
(1005, 'Fran', 'Salesman', 70000, '1996-07-01', 'London', 40, 0.26),
(1006, 'Clemens', 'Clerk', 40000, '1996-01-18', 'London', 10, NULL),
(1007, 'Rifkin', 'Salesman', 52000, '1995-12-01', 'Barcelona', 40, 0.15);

INSERT INTO projects VALUES
(2001, 'ERP Implementation', '1996-10-03', NULL, 30),
(2002, 'Website Redesign', '1996-10-03', NULL, 40),
(2003, 'Audit 1996', '1996-10-04', NULL, 20),
(2004, 'HR Policy Update', '1996-10-06', NULL, 10);

INSERT INTO emp_projects VALUES
(1001, 2001, 20),
(1002, 2001, 35),
(1003, 2003, 40),
(1004, 2002, 30),
(1005, 2002, 50),
(1006, 2004, 15),
(1007, 2002, 25);

INSERT INTO salaries VALUES
(1001, '1996-10-03', NULL, 60000),
(1002, '1996-10-03', NULL, 55000),
(1003, '1996-10-04', NULL, 45000),
(1004, '1996-10-03', NULL, 48000),
(1005, '1996-10-05', NULL, 70000),
(1006, '1996-10-06', NULL, 40000),
(1007, '1996-10-06', NULL, 52000);
