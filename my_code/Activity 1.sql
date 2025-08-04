-- Step 1: Create roles table
CREATE TABLE roles (
	role_id BIGSERIAL PRIMARY KEY,
	role_name VARCHAR(50),
	role_description TEXT,
	salaries INTEGER
);

-- Step 2: Create employees2 table (remove role_name column)
CREATE TABLE employees2 (
	emp_id BIGSERIAL PRIMARY KEY,
	emp_name VARCHAR(50),
	birthdate DATE,
	role_id BIGINT REFERENCES roles(role_id),
	sales INTEGER
);

-- Step 3: Insert role data
INSERT INTO roles (role_name, role_description, salaries)
VALUES 
('Graphic Designer', 'Helps with video editing, photo editing and market advertisement designs', 35000),
('Videographer', 'Helps with all digital media productions', 18000),
('Social Marketer', 'Helps with social media strategies and social data', 26000),
('Sales Rep', 'Helps promote and sign clients', 20000);

-- Step 4: View roles (optional)
SELECT * FROM employees2;

-- Step 5: Insert employee data (using correct role_id)
-- Make sure role_id values match the auto-generated IDs from the roles table
-- Assuming: 1 = Graphic Designer, 2 = Videographer, 3 = Social Marketer, 4 = Sales Rep
INSERT INTO employees2 (emp_name, birthdate, role_id, sales)
VALUES 
('Aragorn', '1994-08-24', 4, 22),
('Gandalf', '1982-05-11', 1, 0),
('Frodo', '1990-01-18', 2, 0),
('Legolas', '1998-04-22', 3, 0),
('Gimli', '2000-11-08', 4, 10),
('Samwise', '2001-01-01', 4, 9),
('Pippin', '1999-09-26', 4, 18),
('Merry', '2005-08-07', 3, 0);

DROP TABLE roles;
DROP TABLE employees2;
	

SELECT 
    e.emp_name,
    e.birthdate,
    r.role_name,
    r.salaries AS base_salary,
    e.sales,
    CASE 
        WHEN r.role_name = 'Sales Rep' AND e.sales > 10 THEN r.salaries + (e.sales - 10) * 200
        ELSE r.salaries
    END AS adjusted_salary
FROM 
    employees2 e
JOIN 
    roles r ON e.role_id = r.role_id
WHERE 
    AGE(CURRENT_DATE, e.birthdate) >= INTERVAL '27 years';

