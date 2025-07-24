-- Create a table with three different character data types
CREATE TABLE char_data_types (
  varchar_column varchar(10),  -- variable-length string, up to 10 characters
  char_column char(10),        -- fixed-length string, exactly 10 characters (pads with spaces if shorter)
  text_column text             -- variable unlimited-length text
);

-- Insert two rows into the char_data_types table
INSERT INTO char_data_types
VALUES
 ('abc', 'abc', 'abc'),
 ('defghi', 'defghi', 'defghi');

-- Export the data from char_data_types to a CSV file on your local machine
COPY char_data_types TO 'C:\Users\vumat\Desktop\CodeCollege\SQL\my_code\Chapter3'
WITH (
  FORMAT CSV,     -- export in CSV format
  HEADER,         -- include column headers in the first row
  DELIMITER '|'   -- use pipe character as the delimiter
);

-- Insert another row into char_data_types
-- Note: This will give an error because the INSERT is missing the third column value
INSERT INTO char_data_types
VALUES
 ('123456789', '1234567891'); -- missing 'text_column' value, will cause an error

-- Retrieve all data from char_data_types
SELECT * FROM char_data_types;

-- Create a table 'people' with an auto-incrementing id and a name column
CREATE TABLE people (
  id serial,                -- auto-incrementing integer (primary key by default)
  name varchar(100)         -- variable-length string up to 100 characters
);

-- Insert a row with a specific id and name into 'people'
-- Note: Manually inserting into 'id' for a serial column can cause sequence issues if not managed
INSERT INTO people (id, name)
VALUES
(214893022, 'Tom Vuma');

-- Retrieve all data from 'people'
SELECT * FROM people;

-- Create a table with date and time-related data types
CREATE TABLE date_time_types (
  timestamp_column timestamp with time zone, -- stores date and time with timezone
  interval_column interval                   -- stores a time interval (duration)
);

-- Insert four rows with various timestamp and interval combinations
INSERT INTO date_time_types
VALUES
 ('2018-12-31 01:00 EST','2 days'),                           -- timestamp with Eastern Time, 2 days interval
 ('2018-12-31 01:00 -8','1 month'),                           -- timestamp with UTC-8, 1 month interval
 ('2018-12-31 01:00 Australia/Melbourne','1 century'),       -- timestamp with Melbourne timezone, 1 century interval
 (now(),'1 week');                                            -- current timestamp, 1 week interval

-- Retrieve all data from date_time_types
SELECT * FROM date_time_types;