--///Try it yourself
--1)

--Creates a table jr_table with id, movie, and actor columns, 
--then imports data from a colon-delimited CSV file (export1.txt) into it.
CREATE TABLE jr_table(
	id serial,
	movie varchar(100),
	actor varchar(100)
)
COPY jr_table
FROM 'C:\Users\vumat\Desktop\CodeCollege\SQL\my_code\export1.txt'
WITH (
    FORMAT csv,
    DELIMITER ':',
    HEADER
);


--2)

--Exports the top 20 counties with the highest housing unit counts 
--from us_counties_2010 to a colon-delimited CSV file (export1.txt)
COPY (SELECT geo_name, state_us_abbreviation, housing_unit_count_100_percent 
		FROM us_counties_2010
		ORDER BY housing_unit_count_100_percent DESC
		LIMIT 20)
		
TO 'C:\Users\vumat\Desktop\CodeCollege\SQL\my_code\export1.txt'

WITH (FORMAT csv, DELIMITER ':', HEADER);




