--///TRY IT YOURELF CHAPTER 1///

--Activity 1
CREATE TABLE animal_types (
	id bigserial, 
  	species varchar(25), 
	habitat varchar(25),
	birthdate date,
	weight numeric
);

INSERT INTO animal_types (species, habitat, birthdate, weight)
VALUES
  ('Elephant', 'Savannah', '2012-08-15', 1200.5);

SELECT * FROM public.animal_types;