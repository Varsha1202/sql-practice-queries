Q.List all columns from the employees table.
select * from employees;
+--------+---------+-----------+----------+------------+-----------+---------+-----------------+
| emp_id | ename   | job_title | salary   | hire_date  | city      | dept_id | commission_rate |
+--------+---------+-----------+----------+------------+-----------+---------+-----------------+
|   1001 | Peel    | Manager   | 60000.00 | 1995-03-10 | London    |      10 |            0.12 |
|   1002 | Serres  | Analyst   | 55000.00 | 1996-02-14 | San Jose  |      30 |            0.13 |
|   1003 | AxelRod | Clerk     | 45000.00 | 1996-05-20 | New York  |      20 |            0.10 |
|   1004 | Motika  | Salesman  | 48000.00 | 1994-11-30 | London    |      40 |            0.11 |
|   1005 | Fran    | Salesman  | 70000.00 | 1996-07-01 | London    |      40 |            0.26 |
|   1006 | Clemens | Clerk     | 40000.00 | 1996-01-18 | London    |      10 |            NULL |
|   1007 | Rifkin  | Salesman  | 52000.00 | 1995-12-01 | Barcelona |      40 |            0.15 |
+--------+---------+-----------+----------+------------+-----------+---------+-----------------+

Q.List all employees whose salary is exactly 50,000 or higher.
select * from employees where salary >= '50000' ;
+--------+--------+-----------+----------+------------+-----------+---------+-----------------+
| emp_id | ename  | job_title | salary   | hire_date  | city      | dept_id | commission_rate |
+--------+--------+-----------+----------+------------+-----------+---------+-----------------+
|   1001 | Peel   | Manager   | 60000.00 | 1995-03-10 | London    |      10 |            0.12 |
|   1002 | Serres | Analyst   | 55000.00 | 1996-02-14 | San Jose  |      30 |            0.13 |
|   1005 | Fran   | Salesman  | 70000.00 | 1996-07-01 | London    |      40 |            0.26 |
|   1007 | Rifkin | Salesman  | 52000.00 | 1995-12-01 | Barcelona |      40 |            0.15 |
+--------+--------+-----------+----------+------------+-----------+---------+-----------------+

Q.Find all employees with NULL values in the city column.
 select * from employees where city is NULL;
Empty set (0.00 sec)

Q. Find the largest project-hours logged by each employee on each project start date (use emp_projects +
projects).
select e.emp_id, p.start_date, MAX(e.hours_worked) as max_hours
    -> from emp_projects e
    -> join projects p on e.proj_id=p.proj_id
    -> group by e.emp_id, p.start_date ;
+--------+------------+-----------+
| emp_id | start_date | max_hours |
+--------+------------+-----------+
|   1001 | 1996-10-03 |        20 |
|   1002 | 1996-10-03 |        35 |
|   1004 | 1996-10-03 |        30 |
|   1005 | 1996-10-03 |        50 |
|   1007 | 1996-10-03 |        25 |
|   1003 | 1996-10-04 |        40 |
|   1006 | 1996-10-06 |        15 |
+--------+------------+-----------+

Q. Arrange the employees table by descending dept_id.
select * from employees order by dept_id desc;
+--------+---------+-----------+----------+------------+-----------+---------+-----------------+
| emp_id | ename   | job_title | salary   | hire_date  | city      | dept_id | commission_rate |
+--------+---------+-----------+----------+------------+-----------+---------+-----------------+
|   1004 | Motika  | Salesman  | 48000.00 | 1994-11-30 | London    |      40 |            0.11 |
|   1005 | Fran    | Salesman  | 70000.00 | 1996-07-01 | London    |      40 |            0.26 |
|   1007 | Rifkin  | Salesman  | 52000.00 | 1995-12-01 | Barcelona |      40 |            0.15 |
|   1002 | Serres  | Analyst   | 55000.00 | 1996-02-14 | San Jose  |      30 |            0.13 |
|   1003 | AxelRod | Clerk     | 45000.00 | 1996-05-20 | New York  |      20 |            0.10 |
|   1001 | Peel    | Manager   | 60000.00 | 1995-03-10 | London    |      10 |            0.12 |
|   1006 | Clemens | Clerk     | 40000.00 | 1996-01-18 | London    |      10 |            NULL |
+--------+---------+-----------+----------+------------+-----------+---------+-----------------+


Q.Find which employees currently have entries in emp_projects.
select e.emp_id, e.ename, ep.proj_id
    -> from employees e
    -> join emp_projects ep on e.emp_id= ep.emp_id
    -> group by e.emp_id, ep.proj_id;
+--------+---------+---------+
| emp_id | ename   | proj_id |
+--------+---------+---------+
|   1001 | Peel    |    2001 |
|   1002 | Serres  |    2001 |
|   1003 | AxelRod |    2003 |
|   1004 | Motika  |    2002 |
|   1005 | Fran    |    2002 |
|   1006 | Clemens |    2004 |
|   1007 | Rifkin  |    2002 |
+--------+---------+---------+

alternate

 select distinct e.emp_id, e.ename
    -> from employees e
    -> join emp_projects ep on e.emp_id= ep.emp_id;
+--------+---------+
| emp_id | ename   |
+--------+---------+
|   1001 | Peel    |
|   1002 | Serres  |
|   1003 | AxelRod |
|   1004 | Motika  |
|   1005 | Fran    |
|   1006 | Clemens |
|   1007 | Rifkin  |
+--------+---------+

Q.List employee names matched with their department names.
 Select e.ename, d.dept_name
    -> from employees e
    -> join departments d on e.dept_id= d.dept_id;
+---------+-----------+
| ename   | dept_name |
+---------+-----------+
| Peel    | HR        |
| Clemens | HR        |
| AxelRod | Finance   |
| Serres  | IT        |
| Motika  | Sales     |
| Fran    | Sales     |
| Rifkin  | Sales     |
+---------+-----------+

Q. Find names and IDs of all employees who are assigned to more than one project.
select e.emp_id, e.ename from employees e join emp_projects ep on e.emp_id=ep.emp_id group by e.emp_id, e.ename having count(ep.proj_id) >1;
Empty set (0.01 sec)

Q. Count the projects per employee and output results in descending order.
select e.emp_id, e.ename, count(ep.proj_id) project_count
    ->      from employees e
    ->      join emp_projects ep on e.emp_id=ep.emp_id
    ->      group by e.emp_id, e.ename
    ->      order by project_count desc;
+--------+---------+---------------+
| emp_id | ename   | project_count |
+--------+---------+---------------+
|   1001 | Peel    |             1 |
|   1002 | Serres  |             1 |
|   1003 | AxelRod |             1 |
|   1004 | Motika  |             1 |
|   1005 | Fran    |             1 |
|   1006 | Clemens |             1 |
|   1007 | Rifkin  |             1 |
+--------+---------+---------------+



