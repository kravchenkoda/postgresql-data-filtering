INSERT INTO beer.beers_filtered (id)
SELECT id
FROM beer.beers
WHERE name NOT like '%(%)%';