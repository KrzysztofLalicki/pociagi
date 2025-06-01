CREATE OR REPLACE FUNCTION get_stacje_by_prefix(prefix TEXT)
    RETURNS TABLE(nazwa VARCHAR) AS $$
BEGIN
RETURN QUERY
SELECT s.nazwa
FROM stacje s
WHERE s.nazwa ILIKE prefix || '%';
END;
$$ LANGUAGE plpgsql;