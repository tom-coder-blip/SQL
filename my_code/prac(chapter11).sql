--///Chapter 11

--Extracting components of a timestamp value using date_part()
SELECT
    date_part('year', '2019-12-01 18:37:12 EST'::timestamptz) AS "year",
    date_part('month', '2019-12-01 18:37:12 EST'::timestamptz) AS "month",
    date_part('day', '2019-12-01 18:37:12 EST'::timestamptz) AS "day",
    date_part('hour', '2019-12-01 18:37:12 EST'::timestamptz) AS "hour",
    date_part('minute', '2019-12-01 18:37:12 EST'::timestamptz) AS "minute",
    date_part('seconds', '2019-12-01 18:37:12 EST'::timestamptz) AS "seconds",
    date_part('timezone_hour', '2019-12-01 18:37:12 EST'::timestamptz) AS "tz",
    date_part('week', '2019-12-01 18:37:12 EST'::timestamptz) AS "week",
    date_part('quarter', '2019-12-01 18:37:12 EST'::timestamptz) AS "quarter",
    date_part('epoch', '2019-12-01 18:37:12 EST'::timestamptz) AS "epoch";

SELECT 
    date_part('year', '2025-07-31 GMT+2'::timestamptz) AS "My_year",
    date_part('month', '2025-07-31 GMT+2'::timestamptz) AS "My_month",
    date_part('day', '2025-07-31 GMT+2'::timestamptz) AS "My_day",
    date_part('hour', '2025-07-31 09:54:00 GMT+2'::timestamptz) AS "My_hour";

-- Bonus: Using the SQL-standard extract() for similar datetime parsing:

SELECT extract('year' from '2019-12-01 18:37:12 EST'::timestamptz) AS "year";

-- Listing 11-2: Three functions for making datetimes from components

-- make a date
SELECT make_date(2018, 2, 22);
-- make a time
SELECT make_time(18, 4, 30.3);
-- make a timestamp with time zone
SELECT make_timestamptz(2018, 2, 22, 18, 4, 30.3, 'Europe/Lisbon');

-- Bonus: Retrieving the current date and time

SELECT
    current_date,
    current_time,
    current_timestamp,
    localtime,
    localtimestamp,
    now();

-- table International Flight Schedule

CREATE TABLE international_flights (
    flight_id bigserial PRIMARY KEY,
    airline_code varchar(5) NOT NULL,
    origin_airport varchar(3) NOT NULL,
    destination_airport varchar(3) NOT NULL,
    departure_time timestamp with time zone NOT NULL,
    arrival_time timestamp with time zone NOT NULL,
    flight_duration interval,
    status varchar(20) DEFAULT 'Scheduled'
);

SELECT * FROM international_flights;

--1. Insert a flight from New York to London
INSERT INTO international_flights (
    airline_code, origin_airport, destination_airport,
    departure_time, arrival_time, flight_duration
)
VALUES 
('BA178', 'JFK', 'LHR', '2025-07-31 19:00:00-04', '2025-08-01 07:00:00+01', INTERVAL '7 hours'),
('EK202', 'JFK', 'DXB', '2025-07-31 22:20:00-04', '2025-08-01 19:30:00+04', INTERVAL '12 hours 10 minutes'),
('LH401', 'JFK', 'FRA', '2025-07-31 15:30:00-04', '2025-08-01 05:30:00+02', INTERVAL '8 hours'),
('SQ25', 'JFK', 'SIN', '2025-07-31 20:15:00-04', '2025-08-02 06:50:00+08', INTERVAL '18 hours 35 minutes'),
('QF12', 'LAX', 'SYD', '2025-07-31 22:00:00-07', '2025-08-02 06:00:00+10', INTERVAL '15 hours'),
('AF11', 'JFK', 'CDG', '2025-07-31 18:00:00-04', '2025-08-01 07:20:00+02', INTERVAL '7 hours 20 minutes'),
('JL5', 'LAX', 'NRT', '2025-07-31 13:00:00-07', '2025-08-01 16:30:00+09', INTERVAL '11 hours 30 minutes'),
('DL284', 'ATL', 'JNB', '2025-07-31 18:00:00-04', '2025-08-01 16:15:00+02', INTERVAL '15 hours 15 minutes'),
('TK12', 'ORD', 'IST', '2025-07-31 21:45:00-05', '2025-08-01 17:10:00+03', INTERVAL '10 hours 25 minutes'),
('AA52', 'DFW', 'LHR', '2025-07-31 16:55:00-05', '2025-08-01 07:45:00+01', INTERVAL '8 hours 50 minutes');

--2. Convert a time to another time zone
SELECT flight_id,
       departure_time AT TIME ZONE 'UTC' AS departure_utc,
       arrival_time AT TIME ZONE 'UTC' AS arrival_utc
FROM international_flights;

--3. Show current time in multiple time zones
SELECT
    now() AT TIME ZONE 'UTC' AS utc_now,
    now() AT TIME ZONE 'America/New_York' AS ny_time,
    now() AT TIME ZONE 'Asia/Tokyo' AS tokyo_time,
    now() AT TIME ZONE 'Africa/Johannesburg' AS joburg_time;

--4. Calculate duration between two time zone-aware timestamps
SELECT
    flight_id,
    arrival_time - departure_time AS actual_flight_duration
FROM international_flights;

SELECT CURRENT_TIMESTAMP;  -- Includes time zone

-- Extracting hour of departure (local time of airport)
SELECT flight_id, date_part('hour', departure_time) AS dep_hour
FROM international_flights;

-- Get the time zone offset in seconds
SELECT flight_id, date_part('timezone', departure_time) AS dep_timezone_offset
FROM international_flights;

DROP TABLE international_flights;