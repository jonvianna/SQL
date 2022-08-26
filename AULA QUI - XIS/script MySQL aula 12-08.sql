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