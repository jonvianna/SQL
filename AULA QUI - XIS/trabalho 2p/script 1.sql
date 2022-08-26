DROP DATABASE IF EXISTS loja;

CREATE DATABASE loja
CHARACTER SET utf8mb4
COLLATE utf8mb4_0900_ai_ci;

USE loja;

CREATE TABLE gerente (
id_gerente INTEGER PRIMARY KEY,
nome VARCHAR(40),
cargo VARCHAR(40)
);

CREATE TABLE setor (
id_setor INTEGER PRIMARY KEY,
nome VARCHAR(40),
id_gerente INTEGER,
FOREIGN KEY(id_gerente) REFERENCES gerente (id_gerente)
);

CREATE TABLE cuida (
id_setor INTEGER,
id_gerente INTEGER,
FOREIGN KEY(id_setor) REFERENCES setor (id_setor),
FOREIGN KEY(id_gerente) REFERENCES gerente (id_gerente)
);

SELECT * FROM setor;

INSERT INTO gerente 
(id_gerente, nome, cargo)
VALUES
('1', 'João', 'gerente geral');

INSERT INTO gerente 
(id_gerente, nome, cargo)
VALUES
('2', 'Paulo', 'Gerente de contas'),
('3', 'Roberto', 'Gerente de limpeza');

INSERT INTO setor 
(id_setor, nome, id_gerente)
VALUES
('101', 'João', '1');

INSERT INTO setor 
(id_setor, nome, id_gerente)
VALUES
('202', 'Paulo', '2');

INSERT INTO setor 
(id_setor, nome, id_gerente)
VALUES
('303', 'Roberto', '3');

SELECT * FROM setor;
SELECT * FROM gerente;