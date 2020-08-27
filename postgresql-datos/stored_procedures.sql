-- Prodedure in PostgreSQL
CREATE OR REPLACE PROCEDURE test_dropcreate_procedure()
LANGUAGE SQL
AS $$
    DROP TABLE IF EXISTS aaa;
    CREATE TABLE aaa (bbb CHAR(5) CONSTRAINT firstkey PRIMARY KEY);
$$;

-- Call procedure 
CALL test_dropcreate_procedure()


-- Functions in PostgreSQL
CREATE OR REPLACE FUNCTION test_dropcreate_function()
RETURNS VOID
LANGUAGE plpgsql
AS $$
BEGIN
    DROP TABLE IF EXISTS aaa;
    CREATE TABLE aaa (bbb CHAR(5) CONSTRAINT firstkey PRIMARY KEY, ccc CHAR(5));
    DROP TABLE IF EXISTS aaab;
    CREATE TABLE aaab (bbba CHAR(5) CONSTRAINT secondtkey PRIMARY KEY, ccca CHAR(5));
END
$$;

SELECT test_dropcreate_function()