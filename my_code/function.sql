CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100),
    enrollment_date DATE
);

CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100),
    course_code VARCHAR(10)
);

CREATE TABLE grades (
    grade_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(student_id),
    course_id INT REFERENCES courses(course_id),
    grade NUMERIC(5,2),
    graded_on DATE DEFAULT CURRENT_DATE
);

-- Creating the student_performance view
CREATE VIEW student_performance AS
SELECT
    s.student_id,
    s.full_name,
    c.course_name,
    g.grade,
    g.graded_on
FROM
    students s
JOIN
    grades g ON s.student_id = g.student_id
JOIN
    courses c ON g.course_id = c.course_id;

SELECT * FROM student_performance;

-- Function to calculate the percentage change in grade
CREATE OR REPLACE FUNCTION percent_change_in_grade(
    old_grade NUMERIC,
    new_grade NUMERIC
)
RETURNS NUMERIC AS $$
BEGIN
    IF old_grade = 0 THEN
        RETURN NULL; -- Avoid division by zero
    END IF;
    RETURN ROUND(((new_grade - old_grade) / old_grade) * 100, 2);
END;
$$ LANGUAGE plpgsql;

-- Example usage:
-- SELECT percent_change_in_grade(70, 84);  -- Returns 20.00