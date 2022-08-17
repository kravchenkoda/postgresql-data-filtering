CREATE OR REPLACE FUNCTION trigger_set_timestamp()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = now() at time zone 'utc';
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER set_timestamp
    BEFORE UPDATE ON beer.states
    FOR EACH ROW
EXECUTE PROCEDURE
    trigger_set_timestamp();

CREATE TRIGGER set_timestamp
     BEFORE UPDATE ON beer.cities
     FOR EACH ROW
EXECUTE PROCEDURE
      trigger_set_timestamp();

CREATE TRIGGER set_timestamp
    BEFORE UPDATE ON beer.breweries
    FOR EACH ROW
EXECUTE PROCEDURE
    trigger_set_timestamp();

CREATE TRIGGER set_timestamp
    BEFORE UPDATE ON beer.styles
    FOR EACH ROW
EXECUTE PROCEDURE
    trigger_set_timestamp();

CREATE TRIGGER set_timestamp
    BEFORE UPDATE ON beer.beers
    FOR EACH ROW
EXECUTE PROCEDURE
    trigger_set_timestamp();