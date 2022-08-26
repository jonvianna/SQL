DROP DATABASE IF EXISTS cinema;

CREATE DATABASE cinema
CHARACTER SET utf8mb4
COLLATE utf8mb4_0900_ai_ci;

USE cinema;

CREATE TABLE sala (
id_sala INTEGER PRIMARY KEY,
nome_sala VARCHAR(40)
);

CREATE TABLE filmes (
id_filmes INTEGER PRIMARY KEY,
nome_filme VARCHAR(10)
);

CREATE TABLE exibição (
id_filmes INTEGER,
id_sala INTEGER,
FOREIGN KEY(id_filmes) REFERENCES filmes (id_filmes),
FOREIGN KEY(id_sala) REFERENCES sala (id_sala)
);

INSERT INTO sala 
(id_sala, nome_sala)
VALUES
('1', 'Ação');

INSERT INTO sala 
(id_sala, nome_sala)
VALUES
('2', 'Comédia');

INSERT INTO sala 
(id_sala, nome_sala)
VALUES
('3', 'Suspense');

INSERT INTO filmes 
(id_filmes, nome_filme)
VALUES
('1', 'Infiltrado');

INSERT INTO filmes 
(id_filmes, nome_filme)
VALUES
('2', 'Sonic');

INSERT INTO filmes 
(id_filmes, nome_filme)
VALUES
('3', 'Espiral');

SELECT * FROM Filmes;
SELECT * FROM Sala;