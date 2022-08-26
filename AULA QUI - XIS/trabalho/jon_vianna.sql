/* Exclui o banco de dados "empresa", caso o banco de dados exista */
drop database if exists empresa;

/* Cria o banco de dados "empresa" */
create database empresa;

/* Define o banco de dados "empresa" como o banco de dados atual */
use empresa;

/* Cria a tabela "fornecedores" */
CREATE TABLE fornecedores(
id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
nome_fornecedor VARCHAR(40),
cidade VARCHAR(30),
uf CHAR (2)
);

SELECT * FROM fornecedores;

/* Cria a tabela "unidades" */
CREATE TABLE unidades(
id_unidade INT AUTO_INCREMENT PRIMARY KEY,
nome_unidade VARCHAR(40)
);

/* Cria a tabela "materiais" */
CREATE TABLE materiais(
id_material INT NOT NULL PRIMARY KEY,
id_fornecedor_fk INT NOT NULL,
id_unidade_fk INT NOT NULL,
nome_material VARCHAR(40),
quantidade_estoque INT,
quantidade_estoque_minima INT,
FOREIGN KEY (id_fornecedor_fk) REFERENCES fornecedores(id_fornecedor),
FOREIGN KEY (id_unidade_fk) REFERENCES unidades(id_unidade)
);

/* Cria a tabela "pedidos" */
CREATE TABLE pedidos(
id_pedido INT NOT NULL PRIMARY KEY,
data_pedido DATE
);

SELECT * FROM itens_pedido;

/* Cria a tabela "itens_pedido" */
CREATE TABLE itens_pedido(
id_item_pedido INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
id_pedido_fk INT NOT NULL,
id_material_fk INT NOT NULL,
quantidade_pedida INT,
valor_unitario FLOAT(6,2),
FOREIGN KEY (id_pedido_fk) REFERENCES pedidos(id_pedido),
FOREIGN KEY (id_material_fk) REFERENCES materiais(id_material)
);

/* Insere registros na tabela "Fornecedores" */
insert into fornecedores
(id_fornecedor, nome_fornecedor, cidade, uf)
values
('1', 'ABC Materiais Elétricos', 'Curitiba', 'PR'),
('2', 'XYZ Materiais de Escritório', 'Rio de Janeiro', 'RJ'),
('3', 'Hidra Materiais Hidraulicos', 'São Paulo', 'SP'),
('4', 'HidraX Materiais Elétricos e Hidraulicos', 'Porto Alegre', 'RS');

/* Mostra os registros da tabela "Fornecedores" */
select * from fornecedores;

/* Insere registros na tabela "Unidades" */
insert into unidades
(id_unidade, nome_unidade)
values
('1', 'Unidades'),
('2', 'Kg'),
('3', 'Litros'),
('4', 'Caixa com 12 unidades'),
('5', 'Caixa com 100 unidades'),
('6', 'Metros');

/* Mostra os registros da tabela "Unidades" */
select * from unidades;

/* Insere registros na tabela "Materiais" */
insert into materiais
(id_material, id_fornecedor_fk, nome_material, quantidade_estoque, quantidade_estoque_minima, id_unidade_fk)
values
('1', '1', 'Tomada elétrica 10A padrão novo', '12', '5', '1'),
('2', '1', 'Disjuntor elétrico 25A', '10', '5', '1'),
('3', '2', 'Resma papel branco A4', '32', '20', '4'),
('4', '2', 'Toner impressora HR5522', '6', '10', '1'),
('5', '3', 'Cano PVC 1/2 pol', '6', '10', '6'),
('6', '3', 'Cano PVC 3/4 pol', '8', '10', '6'),
('7', '3', 'Medidor hidráulico 1/2 pol', '3', '2', '1'),
('8', '3', 'Conector Joelho 1/2 pol', '18', '15', '1'),
('9', '1', 'Tomada elétrica 20A padrão novo', '8', '5', '1'),
('10', '2', 'Caneta esferográfica azul', '80', '120', '1'),
('11', '2', 'Grampeador mesa pequeno', '5', '5', '1'),
('12', '2', 'Caneta Marca Texto Amarela', '6', '15', '5'),
('13', '2', 'Lápis Preto HB', '15', '25', '1');

/* Mostra os registros da tabela "Materiais" */
select * from materiais;

/* Insere registros na tabela "Pedidos" */
insert into pedidos
(id_pedido, data_pedido)
values
('1', '2015-02-25'),
('2', '2014-02-10'),
('3', '2015-03-01');

/* Mostra os registros da tabela "Pedidos" */
select * from pedidos;

/* Insere registros na tabela "Itens pedido" */
insert into itens_pedido
(id_item_pedido, id_pedido_fk, id_material_fk, quantidade_pedida, valor_unitario)
values
('1', '1', '10', '100', '0.50'),
('2', '1', '13', '100', '0.25'),
('3', '2', '8', '50', '1.30'),
('4', '3', '11', '5', '76.00');

/* Mostra os registros da tabela "Itens pedidos" */
select * from itens_pedido;

/* CRIAR OS SELECT´s E TRANSFORMAR EM VIEWS */

/* 1 - Nome do material e nome da unidade */
CREATE VIEW MatUni
AS
SELECT 
    materiais.nome_material,
    unidades.nome_unidade
FROM materiais, unidades
WHERE materiais.id_unidade_fk = unidades.id_unidade;

SELECT * FROM MatUni;

/* 2 - Nome do material e nome da unidade dos materiais vendidos em unidades */
CREATE VIEW uni
AS
SELECT 
    materiais.nome_material,
    unidades.nome_unidade
FROM materiais, unidades
WHERE materiais.id_unidade_fk = unidades.id_unidade AND unidades.nome_unidade = 'Unidades';

SELECT * FROM quantmat;

/* 3 - Quantidade de materiais por nome de unidade */
CREATE VIEW quantmat
AS 
SELECT unidades.nome_unidade, count(unidades.nome_unidade)  AS quantidade
FROM materiais, unidades
WHERE materiais.id_unidade_fk = unidades.id_unidade
GROUP BY unidades.nome_unidade
ORDER BY unidades.nome_unidade;

/* 4 - Quantidade de materiais por nome de unidade, incluindo as unidade sem nenhum material relacionado */
CREATE VIEW quant1
AS 
SELECT unidades.nome_unidade, count(materiais.id_unidade_fk)  AS quantidade
FROM unidades LEFT OUTER JOIN materiais
ON materiais.id_unidade_fk = unidades.id_unidade
GROUP BY unidades.nome_unidade
ORDER BY unidades.nome_unidade;

/* 5 - Nome do material, nome do fornecedor e nome da unidade */
CREATE VIEW  MatForUni 
AS
SELECT 
	materiais.nome_material, fornecedores.nome_fornecedor, unidades.nome_unidade 
FROM materiais
JOIN fornecedores ON fornecedores.id_fornecedor = materiais.id_fornecedor_fk 
JOIN unidades ON unidades.id_unidade = materiais.id_unidade_fk;

/* 6 - Nome do material e nome da unidade dos materiais vendidos por metro */
CREATE VIEW MatVendUni 
AS
SELECT 
	materiais.nome_material, unidades.nome_unidade
FROM materiais 
JOIN unidades ON unidades.id_unidade = materiais.id_unidade_fk WHERE unidades.nome_unidade = 'Metros';

SELECT * FROM MatVendUni;

/* 7 - Nome do material e nome da unidade dos materiais vendidos em caixas com 12 ou com 100 unidades */
CREATE VIEW MatUniCaixa
AS
SELECT 
	materiais.nome_material, unidades.nome_unidade 
FROM materiais 
JOIN unidades ON unidades.id_unidade = materiais.id_unidade_fk WHERE unidades.nome_unidade = 'caixa com 12 unidades' OR unidades.nome_unidade = 'caixa com 100 unidades';

SELECT * FROM MatUniCaixa;

/* 8 - Nome do material e sua quantidade em estoque */
CREATE VIEW MatEstoque
AS
SELECT 
	materiais.nome_material, materiais.quantidade_estoque 
FROM materiais;

/* 9 - Nome do material e sua quantidade em estoque, apenas para materiais com menos de 10 unidades em estoque */
CREATE VIEW MatEstoqueDez
AS
SELECT 
	materiais.nome_material, materiais.quantidade_estoque 
FROM materiais WHERE materiais.quantidade_estoque < 10;

SELECT * FROM MatEstoqueDez;

/* 10 - Nome do material, sua quantidade em estoque e sua quantidade mínima em estoque */
CREATE VIEW MatEstoqueMin
AS
SELECT 
	materiais.nome_material, materiais.quantidade_estoque, materiais.quantidade_estoque_minima
FROM materiais;

SELECT * FROM MatEstoqueMin;

/* 11 - Nome do material, sua quantidade em estoque e sua quantidade mínima em estoque,
apenas para materiais onde a quantidade em estoque esteja abaixo da quantidade mínima em estoque */
CREATE VIEW MatEstoqueMen
AS
SELECT 
	materiais.nome_material, materiais.quantidade_estoque, materiais.quantidade_estoque_minima
FROM materiais 
WHERE materiais.quantidade_estoque < materiais.quantidade_estoque_minima;

SELECT * FROM MatEstoqueMen;

/* 12 - Nome e cidade dos fornecedores */
CREATE VIEW NomCid
AS
SELECT 
	fornecedores.nome_fornecedor, fornecedores.cidade 
FROM fornecedores;

SELECT * FROM NomCid;

/* 13 - Nome e cidade dos fornecedores da cidade de Curitiba */
CREATE VIEW NomCidCur
AS
SELECT 
	fornecedores.nome_fornecedor, fornecedores.cidade 
FROM fornecedores WHERE fornecedores.cidade = 'Curitiba';

SELECT * FROM NomCidCur;

/* 14 - Nome dos fornecedores e seus materiais */
CREATE VIEW Formate
AS
SELECT 
	fornecedores.nome_fornecedor, materiais.nome_material
FROM fornecedores 
JOIN materiais ON materiais.id_fornecedor_fk = fornecedores.id_fornecedor
ORDER BY fornecedores.nome_fornecedor;

SELECT * FROM Formate;

/* 15 - Nome dos fornecedores e seus materiais, inluindo os fornecedores sem nenhum material reacionado */
CREATE VIEW Formatenonemat
AS
SELECT 
	fornecedores.nome_fornecedor, materiais.nome_material
FROM fornecedores 
LEFT JOIN materiais ON materiais.id_fornecedor_fk = fornecedores.id_fornecedor
ORDER BY fornecedores.nome_fornecedor;

SELECT * FROM Formatenonemat;

/* 16 - Nome dos fornecedores e quantidade de materiais fornecidos pelo mesmo */
CREATE VIEW Forquamat
AS
SELECT 
	fornecedores.nome_fornecedor, count(materiais.id_material) AS quantidade
FROM fornecedores 
JOIN materiais ON fornecedores.id_fornecedor = materiais.id_fornecedor_fk
ORDER BY fornecedores.nome_fornecedor;

/* 17 - Nome dos fornecedores e quantidade de materiais fornecidos pelo mesmo,
incluindo os fornecedores sem nenhum material relacionado */
CREATE VIEW Forquamatnon
AS
SELECT 
	fornecedores.nome_fornecedor, count(materiais.id_material) AS quantidade
FROM fornecedores 
LEFT JOIN materiais ON fornecedores.id_fornecedor = materiais.id_fornecedor_fk
ORDER BY fornecedores.nome_fornecedor;

/* 18 - Nome dos fornecedores e quantidade de materiais fornecidos pelo mesmo,
incluindo os fornecedores sem nenhum material relacionado,
apenas para fornecedores com menos de 5 materiais relacionados */
CREATE VIEW Forquamatnon5
AS
SELECT 
	fornecedores.nome_fornecedor, count(materiais.id_material) AS quantidade
FROM fornecedores 
LEFT JOIN materiais ON fornecedores.id_fornecedor = materiais.id_fornecedor_fk
GROUP BY fornecedores.nome_fornecedor
HAVING quantidade < '5';

/* 19 - Nome dos fornecedores, nome do material e sua quantidade em estoque */
CREATE VIEW formatqua
AS
SELECT 
	fornecedores.nome_fornecedor, materiais.nome_material, materiais.quantidade_estoque
FROM fornecedores 
JOIN materiais
ORDER BY fornecedores.nome_fornecedor;

SELECT * FROM formatqua;

/* 20 - Nome dos fornecedores, nome do material e sua quantidade em estoque,
apenas para quatidade em estoque entre 10 e 20 */
CREATE VIEW formatquaentre
AS
SELECT 
	fornecedores.nome_fornecedor, materiais.nome_material, materiais.quantidade_estoque
FROM fornecedores 
JOIN materiais WHERE fornecedores.id_fornecedor = materiais.id_fornecedor_fk AND materiais.quantidade_estoque BETWEEN 10 AND 20
ORDER BY fornecedores.nome_fornecedor;

SELECT * FROM formatquaentre;

/* 21 - Nome do fornecedor, nome do material e nome da unidade,
apenas para fornecedores de materiais em unidades ou metros */
CREATE VIEW formatunmet
AS
SELECT 
	fornecedores.nome_fornecedor, materiais.nome_material, unidades.nome_unidade
FROM fornecedores, materiais, unidades
WHERE fornecedores.id_fornecedor = materiais.id_fornecedor_fk AND materiais.id_unidade_fk = 'Unidades' OR unidades.nome_unidade = 'Metros'
ORDER BY fornecedores.nome_fornecedor, materiais.nome_material;

/* 22 - Pedidos realizados em 2015 */
CREATE VIEW ped2015
AS
SELECT pedidos.id_pedido, pedidos.data_pedido
FROM pedidos
WHERE YEAR(data_pedido) = '2015';

/* 23 - Pedidos realizados em fevereiro de 2015 */
CREATE VIEW pedfev2015
AS
SELECT pedidos.id_pedido, pedidos.data_pedido
FROM pedidos
WHERE MONTH(data_pedido) = '2' AND YEAR(data_pedido) = '2015';

/* 24 - Número do pedido e o nome dos materiais constantes no pedido */
CREATE VIEW pedimat
AS
SELECT pedidos.id_pedido, materiais.nome_material
FROM pedidos, itens_pedido, materiais
WHERE pedidos.id_pedido = itens_pedido.id_pedido_fk AND itens_pedido.id_material_fk = materiais.id_material
ORDER BY pedidos.id_pedido, materiais.nome_material;

/* 25 - Materiais que constam nos pedidos */
CREATE VIEW matped
AS
SELECT materiais.nome_material
FROM itens_pedido, materiais
WHERE itens_pedido.id_material_fk = materiais.id_material
ORDER BY materiais.nome_material;

/* 26 - Materiais que não constam nos pedidos */
CREATE VIEW matpednone
AS
SELECT materiais.nome_material
FROM materiais LEFT JOIN itens_pedido
ON itens_pedido.id_material_fk = materiais.id_material
WHERE itens_pedido.id_material_fk IS NULL
ORDER BY materiais.nome_material;

SELECT * FROM matpednone;

/* 27 - Número do pedido e a quantidade de itens em cada pedido */
CREATE VIEW pedquacada
AS
SELECT itens_pedido.id_pedido_fk, count(itens_pedido.id_material_fk) AS quant_itens
FROM itens_pedido
GROUP BY itens_pedido.id_pedido_fk;

/* 28 - Número do pedido e o valor total do pedido */
CREATE VIEW pedvalped
AS
SELECT itens_pedido.id_pedido_fk, sum(itens_pedido.quantidade_pedida * itens_pedido.valor_unitario) AS valor_pedido
FROM itens_pedido
GROUP BY itens_pedido.id_pedido_fk;

/* 29 - Número do pedido e o valor total do pedido, apenas para pedidos com valor total abaixo de 100,00 */
CREATE VIEW pedvalabaixo
AS
SELECT itens_pedido.id_pedido_fk, sum(itens_pedido.quantidade_pedida * itens_pedido.valor_unitario) AS valor_pedido
FROM itens_pedido
GROUP BY itens_pedido.id_pedido_fk
HAVING valor_pedido < '100';

SELECT * FROM pedvalabaixo;

/* 30 - Insira mais um fornecedor no banco de dados */
INSERT INTO fornecedores
(id_fornecedor, nome_fornecedor, cidade, uf)
VALUES
('5', 'Highpower Eletrônicos', 'Belo Horizonte', 'MG');

SELECT * FROM unidades;

/* 31 - Insira mais 2 materiais para o fornecedor inserido no item 30 */
INSERT INTO materiais
(id_material, id_fornecedor_fk, nome_material, quantidade_estoque, quantidade_estoque_minima, id_unidade_fk)
VALUES
('14', '5', 'JBL GO 2', '15', '5', '1'),
('15', '5', 'IPhone 11 Pro Max', '20', '5', '1');

/* 32 - Insira mais um pedido no banco de dados, utilizando o fornecedor e os materiais inseridos nos itens 30 e 31 */
INSERT INTO pedidos
(id_pedido, data_pedido)
VALUES
('4', '2021-12-31'),
('5', '2021-12-30');

/* 33 - Insira 2 itens de pedido no banco de dados, utilizando os dados inseridos nos itens 30, 31 e 32 */ 
INSERT INTO itens_pedido
(id_item_pedido, id_pedido_fk, id_material_fk, quantidade_pedida, valor_unitario)
VALUES
('5', '4', '14', '1', '230'),
('6', '5', '15', '1', '11.000');

/* 34 - Número do pedido e o valor total do pedido inserido no item 32 */
CREATE VIEW pedvaltotal32
AS
SELECT itens_pedido.id_pedido_fk, sum(itens_pedido.quantidade_pedida * itens_pedido.valor_unitario) AS valor_pedido
FROM itens_pedido
GROUP BY itens_pedido.id_pedido_fk
HAVING itens_pedido.id_pedido_fk = '4';

/* 35 - Exclua o material "Tomada elétrica 10A padrão novo" do banco de dados */
DELETE FROM materiais WHERE id_material = 1;

/* 36 - Exclua o material "Lápis Preto HB" do banco de dados */
DELETE FROM itens_pedido
WHERE itens_pedido.id_material_fk = '13';

DELETE FROM materiais 
WHERE id_material = 13;

/* 37 - Exclua o fornecedor "HidraX Materiais Elétricos e Hidraulicos" do banco de dados */
DELETE FROM fornecedores WHERE id_fornecedor = 4;

/* 38 - Exclua o fornecedor "XYZ Materiais de Escritório" do banco de dados */
DELETE FROM itens_pedido
WHERE itens_pedido.id_item_pedido = '1';

DELETE FROM itens_pedido
WHERE itens_pedido.id_item_pedido = '4';

DELETE FROM materiais
WHERE materiais.id_fornecedor_fk = '2';

DELETE FROM fornecedores
WHERE id_fornecedor = 2;