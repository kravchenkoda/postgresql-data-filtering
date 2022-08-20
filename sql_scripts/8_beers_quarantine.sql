CREATE TABLE IF NOT EXISTS beer.beers_quarantine
(
    id INTEGER NOT NULL PRIMARY KEY references beer.beers (id),
    created_at TIMESTAMP without TIME ZONE DEFAULT (now() at time zone 'utc')
);