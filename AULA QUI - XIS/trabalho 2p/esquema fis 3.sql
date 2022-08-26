-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE sala (
id_sala INTEGER PRIMARY KEY,
nome_sala VARCHAR(40)
)

CREATE TABLE filmes (
id_filmes INTEGER PRIMARY KEY,
nome_filme VARCHAR(40)
)

CREATE TABLE exibição (
id_filmes INTEGER,
id_sala INTEGER,
FOREIGN KEY(id_filmes) REFERENCES filmes (id_filmes),
FOREIGN KEY(id_sala) REFERENCES sala (id_sala)
)

