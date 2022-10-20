CREATE TABLE IF NOT EXISTS Genre (
	genre_id SERIAL PRIMARY KEY,
	title_genre VARCHAR(20) NOT NULL,
	executor VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS Executor (
	executor_id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	genre VARCHAR(20) NOT NULL,
	album VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS Album (
	album_id SERIAL PRIMARY KEY,
	title_album VARCHAR(40) NOT NULL,
	year_of_issue DATE NOT NULL,
	executor VARCHAR(60) NOT NULL,
	track VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS Track (
	track_id SERIAL PRIMARY KEY,
	title_track VARCHAR(60) NOT NULL,
	duration NUMERIC(10, 10) NOT NULL,
	album VARCHAR(60) NOT NULL,
	track VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS GenreAndExecuter (
	genre_id INTEGER REFERENCES Genre(genre_id),
	executor_id INTEGER REFERENCES Executor(executor_id),
	CONSTRAINT pk PRIMARY KEY (genre_id, executor_id)
);

CREATE TABLE IF NOT EXISTS ExecutorAndAlbum (
	executor_id INTEGER REFERENCES Executor(executor_id),
	album_id INTEGER REFERENCES Album(album_id),
	CONSTRAINT sk PRIMARY KEY (executor_id, album_id)
);

CREATE TABLE IF NOT EXISTS Compilation (
	album_id INTEGER REFERENCES Album(album_id),
	track_id INTEGER REFERENCES Track(track_id),
	CONSTRAINT ok PRIMARY KEY (album_id, track_id)
);