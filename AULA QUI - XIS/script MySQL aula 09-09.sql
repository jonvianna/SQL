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
USE empresa;
SHOW TABLES;
SHOW TABLES;
SHOW DATABASES;
CREATE DATABASE empresa2
CHAR SET utf8mb4
COLLATE utf8mb4_0900_ai_ci;
USE empresa2;
CREATE TABLE pessoas (
id INT NOT NULL AUTO_INCREMENT,
nome VARCHAR (30) NOT NULL,
sexo ENUM ('M', 'F'),
cidade VARCHAR (20),
limite_credito DECIMAL (7,2),
PRIMARY KEY (ID));
SHOW TABLES;
SELECT * FROM pessoas;
INSERT INTO pessoas
(nome, sexo, cidade, limite_credito)
VALUES
('Pedro Augusto da Rocha', 'M', 'Novo Hamburgo', '700'),
('Antonio Carlos Mamel', 'M', 'Belo Horizonte', '3500.5'),
('Luiza Augusta Mhor', 'F', 'Niterói', '3900'),
('Jane Ester', 'F', 'Florianópolis', '800'),
('Marcos Antônio dos Santos', 'M', 'Porto Alegre', '4250.25'),
('Giovanna Goncalves Oliveira', 'F', 'Canoas', '1500'),
('Kauã Azevedo Ribeiro', 'M', 'Uberlândia', '799'),
('Rebeca Barbosa Santos', 'F', 'Santo André', '1750'),
('Sarah Carvalho Correia', 'F', 'Juiz de Fora', '499.9'),
('Antonio Almeida Lima', 'M', 'Paranaguá', '2600');
ALTER TABLE pessoas
RENAME TO clientes;
ALTER TABLE clientes
MODIFY COLUMN nome VARCHAR (40);
INSERT INTO clientes
(nome, sexo, cidade, limite_credito)
VALUES
('João Vitor Mateo Albuquerque de Lima', 'M', 'Volta Redonda', '550.7');
ALTER TABLE clientes
ADD COLUMN uf CHAR(2);
SELECT * FROM clientes;
ALTER TABLE clientes
DROP COLUMN uf;
ALTER TABLE clientes
ADD COLUMN uf CHAR(2) AFTER cidade;
ALTER TABLE clientes
CHANGE COLUMN sexo genero ENUM ('M', 'F');
CREATE DATABASE empresa3
CHAR SET utf8mb4
COLLATE utf8mb4_0900_ai_ci;
USE empresa3;
CREATE TABLE clientes(
id INT NOT NULL AUTO_INCREMENT,
nome VARCHAR (40) NOT NULL, 
genero ENUM ('M', 'F'),
cidade VARCHAR (20),
uf CHAR (2),
limite_credito DECIMAL(7,2),
PRIMARY KEY(id));
INSERT INTO clientes
(nome, genero, cidade, uf, limite_credito)
VALUES
('Pedro Augusto da Rocha', 'M', 'Novo Hamburgo', 'SC', '700'),
('Antonio Carlos Mamel', 'M', 'Belo Horizonte', 'MG', '3500.5'),
('Luiza Augusta Mhor', 'F', 'Niterói', 'RJ', '3900'),
('Jane Ester', 'F', 'Florianópolis', 'SC', '800'),
('Marcos Antônio dos Santos', 'M', 'Porto Alegre', 'RS', '4250.25'),
('Giovanna Goncalves Oliveira', 'F', 'Canoas', 'RS', '1500'),
('Kauã Azevedo Ribeiro', 'M', 'Uberlândia', 'MG', '799'),
('Rebeca Barbosa Santos', 'F', 'Santo André', 'SP', '1750'),
('Sarah Carvalho Correia', 'F', 'Juiz de Fora', 'MG', '499.9'),
('Antonio Almeida Lima', 'M', 'Paranaguá', 'PR', '2600');
SELECT * FROM clientes;
UPDATE clientes
SET uf = 'RS'
WHERE id = '1';
UPDATE clientes
SET cidade = 'Londrina', uf = 'PR'
WHERE id = '5';
DELETE FROM clientes
WHERE id = '10';


--------------------------------------------


SHOW DATABASES;
CREATE DATABASE bd_clin_bella_qui;
USE bd_clin_bella_qui;
CREATE TABLE Quadro1(
CPF CHAR (14),
Nome VARCHAR (50),
Telefone CHAR (14),
Email VARCHAR (30),
Endereço VARCHAR (30),
Bairro VARCHAR (20),
Cidade VARCHAR (20) DEFAULT 'Curitiba',
UF CHAR (2) DEFAULT 'PR'
);
CREATE TABLE Quadro2(
CodProcedimento TINYINT UNSIGNED /*unsigned é nada negativo - a utilização dos dois significa que vai utilizar até 255 campos*/ NOT NULL AUTO_INCREMENT,
Procedimento VARCHAR (30) NOT NULL,
Preco DECIMAL (6,2),
PRIMARY KEY(CodProcedimento) /*definindo a chave primária*/
);
ALTER TABLE Quadro1
ADD CodPaciente SMALLINT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT FIRST;
DESC Quadro1;
INSERT INTO Quadro1
(CPF, Nome, Telefone, Email, Endereço, Bairro)
VALUES
('345.567.890-00', 'Maria da Silva', '41 98765 8456', 'msilva@gmail.com', 'Rua das Margaridas, 33', 'Pilarzinho'),
('123.654.987-11', 'Ana do Santos', '41 98990 1234', 'anasantos@gmail.com', 'Rua Alegria, 234', 'Santo Inácio'),
('321.543.654-22', 'Ana dos Santos', '41 98423 5456', 'ana_dos_santos@hotmail.com', 'Rua 21 de Abril, 1430', 'Alto da XV');
DESC Quadro2;
SELECT * FROM Quadro1;
INSERT INTO Quadro2
(Procedimento, Preco)
VALUES
('Laser Facial', 3500.00),
('Laser Mãos', 2500.00),
('Peeling químico face', 1200.00),
('Peeling químico mãos', 800.00);
/*Alterar o telefone de um certo paciente*/
UPDATE quadro1
SET Telefone = '41 98765 8455'
WHERE CodPaciente = '1';
SELECT * FROM Quadro1
WHERE CPF = '345.567.890-00';
/*Alterar o endereço de um certo paciente*/
UPDATE Quadro1
SET Endereço = 'Rua 21 de Abril, 4130'
WHERE CodPaciente = '3';
/*Alterar o nome de um certo paciente*/
UPDATE Quadro1
SET Nome = 'Ana Maria Barbosa dos Santos'
WHERE CPF = '123.654.987-11';
/*RENOMANDO AS TABELAS*/
RENAME TABLE Quadro1 TO Pacientes;
RENAME TABLE Quadro2 TO Procedimentos;
UPDATE Pacientes
SET Nome = 'Ana Maria Barbosa dos Santos'
WHERE CodPaciente = '2';
SELECT * FROM Procedimentos;
UPDATE Procedimentos
SET Preco = 900.00
WHERE CodProcedimento = 4;
