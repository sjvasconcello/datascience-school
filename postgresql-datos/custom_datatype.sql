-- Custom Datatype
CREATE TYPE humor AS ENUM ('triste', 'normal','feliz');

CREATE OR REPLACE TABLE persona_prueba(
    nombre TEXT,
    humor_actual humor
);

INSERT INTO persona_prueba VALUES ('Pablo', 'feliz');
