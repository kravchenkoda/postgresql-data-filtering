INSERT INTO beer.beers_quarantine (id)
SELECT id
FROM beer.beers 
WHERE name like '%(%)%'
ON CONFLICT DO NOTHING;