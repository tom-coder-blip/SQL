--//CHAPTER 12 MY ACTIVITY

-- Create Sample Tables

CREATE TABLE members (
  id SERIAL PRIMARY KEY,
  name TEXT,
  join_date DATE,
  city TEXT
);

CREATE TABLE workouts (
  id SERIAL PRIMARY KEY,
  member_id INTEGER REFERENCES members(id),
  workout_type TEXT,
  duration_minutes INTEGER,
  workout_date DATE
);

INSERT INTO members (name, join_date, city) VALUES
  ('Alice Smith', '2024-01-10', 'Cape Town'),
  ('Brian Jones', '2024-02-05', 'Durban'),
  ('Cindy Lee', '2024-02-20', 'Cape Town'),
  ('David Mokoena', '2024-03-01', 'Johannesburg'),
  ('Emily Nkosi', '2024-03-15', 'Durban');

INSERT INTO workouts (member_id, workout_type, duration_minutes, workout_date) VALUES
  (1, 'Cardio', 45, '2024-03-01'),
  (1, 'Strength', 60, '2024-03-03'),
  (2, 'Cardio', 30, '2024-03-01'),
  (2, 'Yoga', 50, '2024-03-05'),
  (3, 'Strength', 70, '2024-03-02'),
  (3, 'Yoga', 60, '2024-03-04'),
  (4, 'Cardio', 40, '2024-03-01'),
  (4, 'Strength', 55, '2024-03-05'),
  (5, 'Cardio', 35, '2024-03-03'),
  (5, 'Yoga', 45, '2024-03-04');

select * from members;
select * from workouts;
SELECT *
FROM members
JOIN workouts
  ON members.id = workouts.member_id;

-- Subqueries (in WHERE)
SELECT name
FROM members
WHERE id IN (
  SELECT member_id
  FROM workouts
  WHERE duration_minutes > (
    SELECT AVG(duration_minutes) FROM workouts
  )
);

--Derived Tables
--Find each member’s total workout time using a subquery in FROM.
SELECT m.name, totals.total_minutes
FROM (
  SELECT member_id, SUM(duration_minutes) AS total_minutes
  FROM workouts
  GROUP BY member_id
) AS totals
JOIN members m ON m.id = totals.member_id;

--Joining Derived Tables
--Compare average and max duration per workout type.
SELECT a.workout_type, a.avg_dur, b.max_dur
FROM (
  SELECT workout_type, AVG(duration_minutes) AS avg_dur
  FROM workouts
  GROUP BY workout_type
) a
JOIN (
  SELECT workout_type, MAX(duration_minutes) AS max_dur
  FROM workouts
  GROUP BY workout_type
) b
ON a.workout_type = b.workout_type;


--Subqueries in SELECT
--Show each member and their latest workout date.
SELECT 
  name,
  (SELECT MAX(workout_date) 
   FROM workouts w 
   WHERE w.member_id = m.id) AS last_workout
FROM members m;

--Subquery Expressions
--Get all members who have done a "Cardio" workout.
SELECT name
FROM members
WHERE id IN (
  SELECT member_id 
  FROM workouts 
  WHERE workout_type = 'Cardio'
);

--Common Table Expressions (CTEs)
--Use a CTE to find average duration by workout type and list workouts above that average.
WITH avg_durations AS (
  SELECT workout_type, AVG(duration_minutes) AS avg_dur
  FROM workouts
  GROUP BY workout_type
)
SELECT w.*
FROM workouts w
JOIN avg_durations a ON w.workout_type = a.workout_type
WHERE w.duration_minutes > a.avg_dur;

drop table members;