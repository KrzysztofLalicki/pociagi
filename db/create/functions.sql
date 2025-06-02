CREATE OR REPLACE FUNCTION get_stacje_by_prefix(prefix TEXT)
RETURNS TABLE (
    id_stacji INTEGER,
    nazwa VARCHAR,
    tory INTEGER
) AS $$
BEGIN
RETURN QUERY
SELECT s.id_stacji, s.nazwa, s.tory
FROM stacje s
WHERE s.nazwa ILIKE prefix || '%'
ORDER BY s.tory DESC, s.nazwa;
END;
$$ LANGUAGE plpgsql;