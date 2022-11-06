DROP DATABASE IF EXISTS part1;
CREATE DATABASE part1;

--1--
CREATE TABLE patients(
    id SERIAL PRIMARY KEY,
    name TEXT,
    diagnoses TEXT
);

CREATE TABLE doctors(
    patient_id REFERENCES patients,
    name TEXT
);

--2--
CREATE TABLE regions(
    id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    name TEXT,
    region_id REFERENCES regions,
    region_name REFERENCES regions (name)
);

CREATE TABLE posts(
    id SERIAL PRIMARY KEY,
    title TEXT,
    content TEXT,
    user_id REFERENCES users,
    user_name REFERENCES users (name),
    user_region REFERENCES users (region_name)
); 

--3--
CREATE TABLE teams(
    id SERIAL PRIMARY KEY,
    name TEXT,
    rank TEXT
);

CREATE TABLE matches(
    id SERIAL PRIMARY KEY;
    team_1 REFERENCES teams (name),
    team_2 REFERENCES teams (name),
    season_start DATE,
    season_end DATE
); 

CREATE TABLE players(
    id SERIAL PRIMARY KEY,
    name TEXT,
    team REFERENCES teams (name)
); 

CREATE TABLE goals(
    id SERIAL PRIMARY KEY,
    player REFERENCES players (name),
    match REFERENCES matches
)

CREATE TABLE refs(
    id SERIAL PRIMARY KEY,
    name TEXT,
    match REFERENCES matches
); 