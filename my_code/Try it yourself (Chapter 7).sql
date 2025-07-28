CREATE TABLE albums (
 album_id bigserial,
 album_catalog_code varchar(100),
 album_title text,
 album_artist text,
 album_release_date date,
 album_genre varchar(40),
 album_description text,
 CONSTRAINT album_key PRIMARY KEY(album_id),
 CONSTRAINT albumtitle_albumdesc UNIQUE (album_title, album_description)
);

CREATE TABLE songs (
 song_id bigserial,
 song_title text,
 song_artist text,
 album_id bigint REFERENCES albums (album_id),
 CONSTRAINT song_key PRIMARY KEY(song_id),
 CONSTRAINT album_song_key UNIQUE (album_id, song_id)
);

INSERT INTO albums (album_catalog_code, album_title, album_artist, album_release_date, album_genre, album_description)
VALUES 
('ALB001', 'The Dark Side of the Moon', 'Pink Floyd', '1973-03-01', 'Progressive Rock', 'Iconic album exploring time, death, and mental illness.'),
('ALB002', 'Thriller', 'Michael Jackson', '1982-11-30', 'Pop', 'Best-selling album with genre-defining hits.'),
('ALB003', 'Back in Black', 'AC/DC', '1980-07-25', 'Hard Rock', 'Tribute to late singer Bon Scott.'),
('ALB004', 'Abbey Road', 'The Beatles', '1969-09-26', 'Rock', 'Final recorded album featuring the famous zebra crossing cover.'),
('ALB005', 'Rumours', 'Fleetwood Mac', '1977-02-04', 'Soft Rock', 'Emotionally charged album born out of band drama.');

INSERT INTO songs (song_title, song_artist, album_id)
VALUES
-- The Dark Side of the Moon (album_id = 1)
('Time', 'Pink Floyd', 1),
('Money', 'Pink Floyd', 1),

-- Thriller (album_id = 2)
('Billie Jean', 'Michael Jackson', 2),
('Beat It', 'Michael Jackson', 2),

-- Back in Black (album_id = 3)
('Hells Bells', 'AC/DC', 3),
('Back in Black', 'AC/DC', 3),

-- Abbey Road (album_id = 4)
('Come Together', 'The Beatles', 4),
('Here Comes the Sun', 'The Beatles', 4),

-- Rumours (album_id = 5)
('Dreams', 'Fleetwood Mac', 5),
('Go Your Own Way', 'Fleetwood Mac', 5);

SELECT * FROM albums;
SELECT * FROM songs;


SELECT * FROM songs JOIN albums
ON songs.album_id = albums.album_id;
