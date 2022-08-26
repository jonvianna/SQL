DROP DATABASE IF EXISTS times;

CREATE DATABASE times
CHARACTER SET utf8mb4
COLLATE utf8mb4_0900_ai_ci;

USE times;

CREATE TABLE EQUIPE (
id_equipe INTEGER PRIMARY KEY,
nome_equipe VARCHAR(40)
);

CREATE TABLE JOGADORES (
id_jogador INTEGER PRIMARY KEY,
nome_jogador VARCHAR(40),
id_equipe INTEGER,
FOREIGN KEY(id_equipe) REFERENCES EQUIPE (id_equipe)
);

INSERT INTO EQUIPE 
(id_equipe, nome_equipe)
VALUES
('1', 'Palmeiras');
INSERT INTO EQUIPE 
(id_equipe, nome_equipe)
VALUES
('2', 'Vasco');
INSERT INTO EQUIPE 
(id_equipe, nome_equipe)
VALUES
('3', 'Gremio');

INSERT INTO JOGADORES 
(id_jogador, nome_jogador, id_equipe)
VALUES
('101', 'Paulo', '1');
INSERT INTO JOGADORES 
(id_jogador, nome_jogador, id_equipe)
VALUES
('202', 'Roberto', '2');
INSERT INTO JOGADORES 
(id_jogador, nome_jogador, id_equipe)
VALUES
('303', 'Max', '3');

SELECT * FROM JOGADORES;
SELECT * FROM EQUIPE;