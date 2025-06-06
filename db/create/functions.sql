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

CREATE FUNCTION swieto(day DATE) RETURNS BOOLEAN AS
$$
BEGIN
    IF (SELECT COUNT(*) FROM daty_swiat WHERE data = day) > 0 THEN RETURN TRUE; END IF;
    IF (SELECT COUNT(*) FROM swieta_stale WHERE dzien = EXTRACT('day' FROM day)
        AND miesiac = EXTRACT('month' FROM day)) > 0 THEN RETURN TRUE; END IF;
    RETURN FALSE;
END;
$$ LANGUAGE plpgsql;