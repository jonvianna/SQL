-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE gerente (
id_gerente INTEGER PRIMARY KEY,
nome VARCHAR(40),
cargo VARCHAR(40)
)

CREATE TABLE setor (
id_setor INTEGER PRIMARY KEY,
nome VARCHAR(40)
)

CREATE TABLE cuida (
id_setor INTEGER,
id_gerente INTEGER,
FOREIGN KEY(id_setor) REFERENCES setor (id_setor),
FOREIGN KEY(id_gerente) REFERENCES gerente (id_gerente)
)

