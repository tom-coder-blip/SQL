CREATE TABLE teams (
    team_id bigserial,
    team_name varchar(100),
    city varchar(100),
    CONSTRAINT team_key PRIMARY KEY (team_id),
    CONSTRAINT team_city_unique UNIQUE (team_name, city)
);

CREATE TABLE players (
    player_id bigserial,
    first_name varchar(100),
    last_name varchar(100),
	pos varchar(50),
    team_id integer REFERENCES teams (team_id),
    CONSTRAINT player_key PRIMARY KEY (player_id),
    CONSTRAINT player_team_unique UNIQUE (player_id, team_id)
);

INSERT INTO teams (team_name, city)
VALUES
    ('Barcelona', 'Barcelona'),
    ('Real Madrid', 'Madrid')

INSERT INTO players (first_name, last_name, pos, team_id)
VALUES
    ('Lamine', 'Yamal', 'RW', 1),
    ('Pedri', 'Gonzalez', 'CM',  1),
    ('Kylian', 'Mbappe', 'ST', 2),
    ('Marcus', 'Rashford', 'LW',  1),
	('Jude', 'Bellingham', 'CAM',  2);
	

SELECT *
FROM players
JOIN teams ON players.team_id = teams.team_id
ORDER BY first_name DESC;

SELECT * FROM teams;
SELECT * FROM players;





