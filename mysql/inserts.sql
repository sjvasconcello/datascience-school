
INSERT INTO authors(name, nationality ) VALUES ('Juan Rulfo', 'MEX'), ('Gabriel Garcia Márquez', 'COL'), ('Juan Gabriel Vasquez', 'COL'), ('Pablo Neruda', 'CHL');




INSERT INTO`clients`(client_id, name, email, birthdate, gender, active) VALUES
	(1,'Maria Dolores Gomez','Maria Dolores.95983222J@random.names','1971-06-06','F',1),
	(2,'Adrian Fernandez','Adrian.55818851J@random.names','1970-04-09','M',1),
	(3,'Maria Luisa Marin','Maria Luisa.83726282A@random.names','1957-07-30','F',1),
	(4,'Pedro Sanchez','Pedro.78522059J@random.names','1992-01-31','M',1);


INSERT INTO`clients`(client_id, name, email, birthdate, gender, active) VALUES(4,'Pedro Sanchez','Pedro.78522059J@random.names','1992-01-31','M',0) ON DUPLICATE KEY UPDATE active = VALUES(active);

