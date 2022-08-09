sudo -u postgres psql postgres

CREATE USER admin_1 WITH PASSWORD '12345678';

CREATE DATABASE breweries;

/* Connect to the "breweries" database */

\c breweries;

CREATE SCHEMA IF NOT EXISTS beers;

GRANT CONNECT ON DATABASE breweries TO admin_1;

GRANT USAGE ON SCHEMA beers TO admin_1;

GRANT CREATE ON SCHEMA beers TO admin_1;

GRANT SELECT, INSERT, UPDATE 
ON ALL TABLES IN SCHEMA beers TO admin_1;

/* Loging to the database with a new user credentials */

psql -U admin_1 -d breweries -h localhost -p 5432

/* Navigate to the schema "beers" */

SET search_path TO beers;

