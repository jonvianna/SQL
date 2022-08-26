-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Telefones (
id_cli_fk INTEGER,
id_tel INTEGER,
num_tel VARCHAR(40),
tipo_tel VARCHAR(40),
PRIMARY KEY(id_cli_fk,id_tel)
)

CREATE TABLE Clientes (
id_cli INTEGER PRIMARY KEY,
cpf_cli VARCHAR(11),
nome_cli VARCHAR(40),
email_cli VARCHAR(40),
sexo_cli VARCHAR(1)
)

CREATE TABLE Endereços (
id_cli_fk INTEGER PRIMARY KEY,
id_end VARCHAR(10),
rua_end VARCHAR(60),
bairro_end VARCHAR(40),
cep_end VARCHAR(9),
estado_end VARCHAR(2),
cidade_end VARCHAR(40)
)

