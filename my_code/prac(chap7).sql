-- Create the tribes table
CREATE TABLE tribes (
    tribe_id serial PRIMARY KEY CHECK (tribe_id >= 1),     
    tribe_name varchar(100) NOT NULL
);

-- Alter tribes to add a UNIQUE constraint on tribe_name
ALTER TABLE tribes
ADD CONSTRAINT unique_tribe_name UNIQUE (tribe_name);

-- Create the people table
CREATE TABLE people (
    person_id serial PRIMARY KEY,  -- Declaring a serial column as a surrogate key    
    first_name varchar(50) NOT NULL,     
    last_name varchar(50) NOT NULL,
    tribe_id integer ,
	FOREIGN KEY (tribe_id)
	REFERENCES tribes(tribe_id)   -- Foreign key to tribes table
);

-- Alter people to ensure tribe_id is greater than or equal to 1 (if provided)
ALTER TABLE people
ADD CONSTRAINT chk_tribe_id_positive CHECK (tribe_id IS NULL OR tribe_id >= 1);

INSERT INTO tribes (tribe_name)
VALUES ('Zulu'),('Xhosa'),('Sepedi'),('Tswana');

INSERT INTO people (first_name, last_name, tribe_id)
VALUES 
    ('Thabo', 'Mokoena', 1),   -- Zulu
    ('Nandi', 'Dlamini', 1),   -- Zulu
    ('Sipho', 'Ngcobo', 2),    -- Xhosa
    ('Busang', 'Mathule', 3), -- sepedi
    ('Kagiso', 'Pule', 4);     -- Tswana

ALTER TABLE people
ADD COLUMN date_of_birth DATE;

ALTER TABLE people
ADD COLUMN gender VARCHAR(10);

SELECT * FROM tribes;
SELECT * FROM people;

DROP TABLE tribes;

