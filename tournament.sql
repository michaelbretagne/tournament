-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

-- Drop tournament database if it exists
DROP DATABASE IF EXISTS tournament;

-- Create Database 'Tournament'
CREATE DATABASE tournament;

-- Connect to the tournament database
\c tournament

CREATE TABLE players(
	name varchar(100),
    id serial PRIMARY KEY
);

CREATE TABLE matches(
    id serial PRIMARY KEY,
    winner INTEGER,
    loser INTEGER,
    FOREIGN KEY(winner) REFERENCES players(id),
    FOREIGN KEY(loser) REFERENCES players(id)
);

-- view the winner name and id for each matches
CREATE VIEW v_wins AS
    SELECT players.name, players.id, winner
    FROM players
    LEFT JOIN matches
    ON players.id=matches.winner;

-- view the loser name and id for each matches
CREATE VIEW v_loses AS
    SELECT players.name, players.id, winner
    FROM players
    LEFT JOIN matches
    ON players.id=matches.loser;

-- view number of wins for each player
CREATE VIEW v_numOfWins as
    SELECT id, name, count(winner) AS wins
    FROM v_wins
    GROUP BY id, name
    ORDER BY wins DESC;

-- view number of loses for each player
CREATE VIEW v_numOfLoses as
    SELECT id, name, count(id) AS loses
    FROM v_loses
    GROUP BY id, name
    ORDER BY loses DESC;

-- view number of matches for each player
CREATE VIEW v_numOfMatches as
    SELECT players.id, players.name, count(matches.id)
    AS played
    FROM players
    LEFT JOIN matches
    ON players.id=matches.winner
    OR players.id=matches.loser
    GROUP BY players.id
    ORDER BY played DESC;

-- view id, name, number of wins and matches played for each player
CREATE VIEW v_standings AS
    SELECT players.id, v_numOfMatches.name, wins, played
    FROM players
    LEFT JOIN v_numOfWins
    ON players.id=v_numOfWins.id
    LEFT JOIN v_numOfMatches
    ON v_numOfWins.name=v_numOfMatches.name
    ORDER BY wins DESC;
