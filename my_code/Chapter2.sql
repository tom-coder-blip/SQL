SELECT * FROM teachers;

-- SELECT last_name, first_name, salary FROM teachers;

-- SELECT DISTINCT school FROM teachers;

-- SELECT DISTINCT school, salary FROM teachers;

-- SELECT first_name, last_name, salary
-- FROM teachers
-- ORDER BY salary DESC;

-- SELECT last_name, school, hire_date
-- FROM teachers
-- ORDER BY school ASC, hire_date DESC;

--///Activity: add a row and use select distinct and order by

INSERT INTO teachers (first_name, last_name, school, hire_date, salary)
VALUES ('John', 'Peterson', 'Sutherland', '2021-10-07', 30000 )

SELECT DISTINCT first_name, salary FROM teachers
ORDER BY salary ASC;

SELECT DISTINCT last_name, hire_date FROM teachers 
ORDER BY hire_date DESC;

SELECT first_name, last_name FROM teachers WHERE last_name = 'Diaz';

SELECT first_name, last_name, salary FROM teachers WHERE salary BETWEEN 44000 AND 66000;

SELECT first_name FROM teachers WHERE first_name ILIKE 'bet%';



