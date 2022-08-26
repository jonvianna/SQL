-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE equipe (
id_equipe INTEGER PRIMARY KEY,
nome_equipe VARCHAR(40)
)

CREATE TABLE id_jogador (
id_jogador INTEGER PRIMARY KEY,
nome_jogador VARCHAR(40),
id_equipe INTEGER,
FOREIGN KEY(id_equipe) REFERENCES equipe (id_equipe)
)

