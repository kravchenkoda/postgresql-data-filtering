SELECT (
    SELECT 
    COUNT(id) FROM beer.beers_quarantine) 
    as corrupted_rows, 
    (
    SELECT 
    COUNT(id) FROM beer.beers_filtered) 
    as clear_rows;