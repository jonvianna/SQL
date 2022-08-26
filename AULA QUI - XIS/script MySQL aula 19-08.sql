show databases;
use sakila;
show tables;
select * from actor;
select * from actor_info;
create database nova_database;
show databases;
create database empresa;
use empresa;
show tables;
create table clientes(
nome varchar(30),
idade int,
sexo char(1),
peso float,
bairro varchar(20),
celular char(9)
);
show tables;
desc clientes;
create table produtos(
nome varchar(30),
unidades_estoque int,
preco float(6,2));
show tables;
create table funcionarios(
nome varchar(30),
idade int,
sexo char(1),
endereco varchar(100),
celular char(9)
);
desc funcionarios;
show tables;
insert into funcionarios values ('Leandro',
30,
'M',
'Endereço de teste',
'419999999');
show tables;
desc funcionarios;
insert into funcionarios values ('Paula',
25,
'F',
'Endereço de teste 2',
'449999999');
select * from funcionarios;
use empresa;
show tables;
desc clientes;
show tables;
insert into clientes values ('Marcelo',
52,
'M',
'90',
'Novo Mundo',
'991111111');
desc clientes;
insert into clientes values ('Angélica',
29,
'F',
'68',
'Rebouças',
'993333333');
insert into produtos values ('Sabão em pó',
100,
'9');
insert into produtos values ('Leite condensado',
277,
4.5);
insert into produtos values ('Ração para gatos',
70,
37);
insert into clientes values ('João Pedro',
21,
'M',
77.5,
'Água Verde',
'992222222');
select * from clientes;
select * from produtos;
CREATE TABLE clientes2(
id INT NOT NULL AUTO_INCREMENT,
nome VARCHAR (40) NOT NULL,
sexo ENUM ('M', 'F'),
nascimento DATE,
cidade VARCHAR (20) DEFAULT 'Curitiba',
uf char (2) DEFAULT 'PR',
PRIMARY KEY (id)
) DEFAULT CHARSET = utf8mb4;
show tables;
desc clientes2;
INSERT INTO clientes2 (id, nome, sexo, nascimento, cidade, uf) VALUES('1',
'Ana',
'F',
'1990-06-15',
'Campo Largo',
'PR');
INSERT INTO clientes2 (nome, sexo, nascimento, cidade, uf) VALUES('Beatriz',
'F',
'1990-07-15',
'Campo Largo',
'PR');
INSERT INTO clientes2 VALUES 
(default, 'Elaine', 'F', '1995-09-21', default, default),
(default, 'Fábio', 'M', '1995-10-22', 'Ponta Grossa', default),
(default, 'Gilberto', 'M', '1996-11-23', 'Santo André', 'SP');
INSERT INTO clientes2 (id, nome, sexo, nascimento, cidade, uf) VALUES (default, 'Carlos', 'M', '1990-08-15', default, default);
INSERT INTO clientes2 (nome, sexo, nascimento, cidade, uf) VALUES ('Henrique', 'M', NULL, 'Ortigueira', 'PR');
show tables;
desc clientes2;
select * from clientes2;
ALTER TABLE clientes RENAME TO clientes_old;
ALTER TABLE produtos RENAME TO produtos_old;
CREATE TABLE clientes (
ID INT NOT NULL AUTO_INCREMENT,
Nome VARCHAR (40) NOT NULL, 
Idade INT NOT NULL,
Sexo ENUM ('M', 'F'),
Peso FLOAT,
Bairro VARCHAR (20),
Celular CHAR (11) NOT NULL,
PRIMARY KEY (ID)
) DEFAULT CHARSET = utf8mb4;
INSERT INTO clientes (ID, Nome, Idade, Sexo, Peso, Bairro, Celular) VALUES ('1',
'Marcelo',
52,
'M',
90,
'Novo Mundo',
'99111-1111');
select * from clientes;
INSERT INTO clientes VALUES
(DEFAULT, 'João Pedro', 21, 'M', 77.5, 'Água Verde', '99222-2222'),
(DEFAULT, 'Angélica', 29, 'F', 68, 'Rebouças', '99333-3333');
CREATE TABLE produtos (
ID INT NOT NULL AUTO_INCREMENT,
Nome VARCHAR (40) NOT NULL,
Estoque INT NOT NULL,
Preco FLOAT NOT NULL,
Funcionario VARCHAR (40) NOT NULL,
Observacao VARCHAR (100),
PRIMARY KEY (ID)
) DEFAULT CHARSET = utf8mb4;
INSERT INTO produtos VALUES 
(DEFAULT, 'Sabão em pó', 100, 9, 'Alcir Jr.', NULL),
(DEFAULT, 'Sabão em barra', 277, 4.5, 'Maria Rita Amorim', 'Algumas barras estão avariadas.'),
(DEFAULT, 'Vanish em pó 1kg', '70', 45, 'Alcir Jr.', NULL);
select * from produtos;
select * from clientes;
SHOW TABLES;
ALTER TABLE clientes ADD email VARCHAR(40) NOT NULL;
ALTER TABLE clientes DROP COLUMN Bairro;
UPDATE clientes SET email = 'marcelo.d2@gmail.com'
WHERE ID=1;
UPDATE clientes SET email = 'jp22@outlook.com'
WHERE ID=2;
ALTER TABLE produtos ADD setor VARCHAR(20);
UPDATE produtos SET setor = 'Limpeza'
WHERE ID = 1;
UPDATE produtos SET setor = 'Limpeza'
WHERE ID = 2;
UPDATE produtos SET setor = 'Limpeza'
WHERE ID = 3;
SELECT * FROM produtos;
UPDATE clientes SET email = 'angel@hotmail.com'
WHERE ID = 3;
UPDATE produtos SET Estoque = '257'
WHERE ID = 2;
UPDATE produtos SET Preco = '40'
WHERE ID = 3;
