create database aula_views;

use aula_views;

create table departamento(
deptoID varchar(10) primary key,
depto varchar(30)
);

create table item(
itemID varchar(10) primary key,
item varchar(30)
);

create table requisicoes(
reqID varchar(10) primary key,
deptoID varchar(10),
itemID varchar(10),
qtd int,
precounit float(6,2),
foreign key (deptoID) references departamento(deptoID),
foreign key (itemID) references item(itemID)
);

insert into departamento values
('D001','RH'), 
('D002','Financeiro'), 
('D003','Producao'),
('D004','TI');

insert into item values
('I001','Papel'),
('I002','Caneta'),
('I003','NoteBook'),
('I004','Impressora');

insert into requisicoes values
('Q001','D002', 'I001',500,0.3),
('Q002','D004', 'I002',40,2.5),
('Q003','D001', 'I003',5,0.3),
('Q004','D001', 'I004',2,650);

Create view vwRequisicoes
as
Select 
    r.reqID,
    d.deptoID,
    d.depto,
    i.itemID,
    i.item,
    r.qtd,
    r.precounit,
    (r.qtd * r.precounit) as total
from requisicoes as r
inner join departamento as d on r.deptoID = d.deptoID
inner join item as i on i.itemID = r.itemID;

SELECT * FROM aula_views.vwrequisicoes;

Create view vwBatman
as
Select 
    d.deptoID,
    d.depto,
    i.itemID,
    i.item,
    r.qtd,
    r.precounit
from requisicoes as r
inner join departamento as d on r.deptoID = d.deptoID
inner join item as i on i.itemID = r.itemID;

SELECT * FROM aula_views.vwbatman;

Create view vwpaulo
as
Select 
	d.depto,
    i.item,
    r.qtd,
    r.precounit,
	(r.qtd * r.precounit) AS total
from requisicoes as r
inner join departamento as d on r.deptoID = d.deptoID
inner join item as i on i.itemID = r.itemID;

SELECT * FROM aula_views.vwpaulo;