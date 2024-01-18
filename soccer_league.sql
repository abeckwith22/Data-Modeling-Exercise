-- Design a schema for a simple sports league. Your schema should keep track of

-- [*] All of the teams in the league
-- [*] All of the goals scored by every player for each game
-- [*] All of the players in the league and their corresponding teams.
-- [*] All of the referees who have been part of each game
-- [*] All of the matches played between teams
-- [*] All of the start and end dates for season that a league has
-- [*] The standings/rankings of each team in the league (This doesn't have to be its own table if the data can be captured somehow).

DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league;

CREATE TABLE teams -- all the teams in the league
(
    team_id SERIAL PRIMARY KEY,
    team_name VARCHAR(60) NOT NULL,
    team_rank INTEGER -- making sure to set it so that it can be null if there is a case where a team has just joined the league and don't have a placement yet.
);

CREATE TABLE referees -- all of the referees who have been part of each game
(
    referee_id SERIAL PRIMARY KEY,
    referee_name VARCHAR(255)
);

CREATE TABLE players -- all the players in the league and their corresponding teams
(
    player_id SERIAL PRIMARY KEY,
    player_name VARCHAR(255) NOT NULL,
    t_id INTEGER REFERENCES teams(team_id) NOT NULL
);

CREATE TABLE games -- matches played between teams, 
(
    game_id SERIAL PRIMARY KEY,
    team1_id INTEGER REFERENCES teams(team_id) NOT NULL,
    team2_id INTEGER REFERENCES teams(team_id) NOT NULL,
    ref_id INTEGER REFERENCES referees(referee_id) NOT NULL
    date_start DATE NOT NULL,
    date_end DATE NOT NULL
);

CREATE TABLE goals -- all the goals scored by every player for each game
(
    goal_id SERIAL PRIMARY KEY,
    p_id INTEGER REFERENCES players(player_id),
    match_id INTEGER REFERENCES games(game_id),
    t_id INTEGER REFERENCES teams(team_id)
);
