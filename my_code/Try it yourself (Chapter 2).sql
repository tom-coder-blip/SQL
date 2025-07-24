--///Try it yourself (CHAPETR 2)///
--Beginning Data Exploration with SELECT
--This chapter introduces the foundational skill in SQL: 
--querying data using the SELECT statement. 
--It compares the process to "interviewing data", where you examine and question the contents of a table to understand its completeness, consistency, and accuracy.

-- 1)Selects all columns and all rows from the teachers table
SELECT * FROM teachers;

-- 2)Selects unique combinations of school, first name, and last name from teachers, ordered by school and then last name ascending
SELECT DISTINCT school, first_name, last_name FROM teachers
ORDER BY school, last_name ASC;

-- 3)Selects first names and salaries of teachers whose first names start with 'S' and who earn more than 40000
SELECT first_name, salary FROM teachers
WHERE first_name LIKE 'S%' AND salary > 40000;

-- 4)Selects first name, last name, hire date, and salary of teachers hired on or after 2010-01-01, ordered by salary descending
SELECT first_name, last_name, hire_date, salary FROM teachers
WHERE hire_date >= '2010-01-01'
ORDER BY salary DESC;
