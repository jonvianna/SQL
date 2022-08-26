/* Criando o banco de dados chamado "locadora" e criando a tabela "filmes"*/
CREATE DATABASE Locadora;
USE Locadora;
CREATE TABLE Filmes(
ID INT NOT NULL AUTO_INCREMENT, /*Definindo a coluna como chave primária e inserindo o auto_increment*/
Nome VARCHAR (40),
PRIMARY KEY (ID));
/*Inserindo os valores na tabela "Filmes"*/
INSERT INTO Filmes
(Nome)
VALUES
('A Hora do Pesadelo'),
('Ben-Hur'),
('Como eu era antes de você'),
('Estrada sem lei'),
('Forrest Gump - O contador de histórias'),
('Harry Potter e a Ordem da Fênix'),
('Intocáveis'),
('It - A Coisa'),
('Minha mãe é uma peça'),
('O Iluminado'),
('O resgate do soldade Ryan'),
('Os infiltrados'),
('Vingadores'),
('Pantera negra'),
('Para todos os garotos que já amei');
/*Conferindo a execução das tarefas até aqui*/
SELECT * FROM Filmes;
/*Renomeando a tabela "Filmes" para "Acervo"*/
RENAME TABLE Filmes TO Acervo;
/*Alterando o nome da coluna "nome" para "título"*/
ALTER TABLE Acervo
RENAME COLUMN Nome TO Título;
/*Conferindo a execução das tarefas até aqui*/
SELECT * FROM Acervo;
/*Alterando a estrutura da tabela*/
ALTER TABLE Acervo
ADD COLUMN Genero VARCHAR (10);
ALTER TABLE Acervo
ADD COLUMN Ano YEAR;
/*Alterando Varchar para Enum na coluna "Genero"*/
ALTER TABLE Acervo
MODIFY COLUMN Genero ENUM ('Ação', 'Aventura', 'Comédia', 'Drama', 'Policial', 'Romance', 'Terror');
/*Inserindo os valores de Genero e Ano na tabela*/
UPDATE Acervo
SET Genero = 'Terror'
WHERE id = '1';
UPDATE Acervo
SET Ano = '1986'
WHERE id = '1';
UPDATE Acervo
SET Genero = 'Aventura'
WHERE id = '2';
UPDATE Acervo
SET Ano = '1960'
WHERE id = '2';
UPDATE Acervo
SET Genero = 'Romance'
WHERE id = '3';
UPDATE Acervo
SET Ano = '2016'
WHERE id = '3';
UPDATE Acervo
SET Genero = 'Comédia'
WHERE id = '4';
UPDATE Acervo
SET Ano = '2014'
WHERE id = '4';
UPDATE Acervo
SET Genero = 'Comédia'
WHERE id = '5';
UPDATE Acervo
SET Ano = '1994'
WHERE id = '5';
UPDATE Acervo
SET Genero = 'Aventura'
WHERE id = '6';
UPDATE Acervo
SET Ano = '2007'
WHERE id = '6';
UPDATE Acervo
SET Genero = 'Drama'
WHERE id = '7';
UPDATE Acervo
SET Ano = '2012'
WHERE id = '7';
UPDATE Acervo
SET Genero = 'Terror'
WHERE id = '8';
UPDATE Acervo
SET Ano = '2017'
WHERE id = '8';
UPDATE Acervo
SET Genero = 'Comédia'
WHERE id = '9';
UPDATE Acervo
SET Ano = '2013'
WHERE id = '9';
UPDATE Acervo
SET Genero = 'Terror'
WHERE id = '10';
UPDATE Acervo
SET Ano = '1980'
WHERE id = '10';
UPDATE Acervo
SET Genero = 'Drama'
WHERE id = '11';
UPDATE Acervo
SET Ano = '1998'
WHERE id = '11';
UPDATE Acervo
SET Genero = 'Policial'
WHERE id = '12';
UPDATE Acervo
SET Ano = '2006'
WHERE id = '12';
UPDATE Acervo
SET Genero = 'Ação'
WHERE id = '13';
UPDATE Acervo
SET Ano = '2012'
WHERE id = '13';
UPDATE Acervo
SET Genero = 'Ação'
WHERE id = '14';
UPDATE Acervo
SET Ano = '2018'
WHERE id = '14';
UPDATE Acervo
SET Genero = 'Romance'
WHERE id = '15';
UPDATE Acervo
SET Ano = '2018'
WHERE id = '15';
/*Conferindo a execução das tarefas até aqui*/
SELECT * FROM Acervo;
/*Alterando o genero e ano de "Estrada sem lei"*/
UPDATE Acervo
SET Genero = 'Policial'
WHERE ID = '4';
UPDATE Acervo
SET Ano = '2019'
WHERE ID = '4';
/*Alterando o título "Vingadores*/
UPDATE Acervo
SET Título = 'Os Vingadores - The Avengers'
WHERE ID = '13';
/*Adicionando mais um registro na tabela Acervo*/
INSERT INTO Acervo
(Título, Genero, Ano)
VALUES
('O Poderoso Chefão', 'Drama', '1972');
/*Excluindo o título "Os infiltrados" da tabela*/
DELETE FROM Acervo
WHERE ID = 12;
/*Excluindo todos os registros da tabela Acervo*/
TRUNCATE TABLE Acervo;
/*Excluindo a tabela Acervo*/
DROP TABLE Acervo;
/*Excluindo o bando de dados*/
DROP DATABASE locadora;