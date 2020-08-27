CREATE OR REPLACE FUNCTION count_total_movies()
RETURNS INT
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN COUNT(*) FROM peliculas;
END
$$;

CREATE OR REPLACE FUNCTION duplicate_records()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO aaab(bbba, ccca)
    VALUES(NEW.bbb, NEW.ccc);
    RETURN NEW;
END
$$;

-- Creating trigger
CREATE TRIGGER aaa_changes
    BEFORE INSERT
    ON aaa
    FOR EACH ROW
    EXECUTE PROCEDURE duplicate_records();

INSERT INTO aaa(bbb,ccc) VALUES ('abcde', 'efghi');