CREATE TABLE IF NOT EXISTS beer.beers_filtered
(
    id INTEGER NOT NULL PRIMARY KEY,
    created_at TIMESTAMP without TIME ZONE DEFAULT (now() at time zone 'utc')
);