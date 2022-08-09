CREATE TABLE IF NOT EXISTS beers_qurantine(

    id INTEGER NOT NULL PRIMARY KEY,
    name       VARCHAR(100) NOT NULL,
    ibu        INTEGER  NOT NULL,
    abv        NUMERIC(4,1) NOT NULL,
    style_id   INTEGER  NOT NULL references styles (id),
    brewery_id INTEGER  NOT NULL references breweries (id),
    ounces     NUMERIC(3,1) NOT NULL
);