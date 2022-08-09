INSERT INTO beers_filtered (id, name, ibu, abv, style_id, brewery_id, ounces)
SELECT id, name, ibu, abv, style_id, brewery_id, ounces 
FROM beers 
WHERE name NOT like '%(%)%';