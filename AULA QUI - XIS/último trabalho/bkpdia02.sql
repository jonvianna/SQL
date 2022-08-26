create database if not exists BIGBIKE;
drop database BIGBIKE;
use BIGBIKE;

create table if not exists clientes(
	id_cliente int not null auto_increment,
    nome varchar(50),
    celular varchar(15),
    primary key(id_cliente)
);

create table if not exists cargos_exercido(
	id_cargo int not null auto_increment,
    nome varchar (50),
    primary key(id_cargo)
);

create table if not exists funcionarios(
	id_funcionario int not null auto_increment,
    nome varchar(50),
    cpf varchar(14),
    valor_salario decimal(7,2) DEFAULT NULL,
    id_cargo int not null,
    primary key(id_funcionario),
    foreign key (id_cargo) references cargos_exercido(id_cargo)ON UPDATE CASCADE ON DELETE CASCADE
);

create table if not exists fornecedor(
	id_fornecedor int not null auto_increment,
    nome varchar(50),
    primary key(id_fornecedor)
);

create table if not exists produtos(
	id_produto int not null auto_increment,
    nome varchar(50),
    id_fornecedor int not null, 
    preco decimal(7,2),
    quantidade_estoque int,
    quantidade_min_estoque int,
    primary key(id_produto),
	foreign key (id_fornecedor) references fornecedor(id_fornecedor)ON UPDATE CASCADE ON DELETE CASCADE
);

create table if not exists servico(
	id_servico int not null auto_increment,
    nome_servico varchar(50),
    primary key(id_servico)
);

create table if not exists orcamento(
	id_orcamento int not null auto_increment,
    id_cliente int not null,
    id_produto int DEFAULT NULL,
    id_funcionario int not null,
    quantidade_produto_pedida int DEFAULT NULL,
    valor_manutencao decimal(7,2) DEFAULT NULL,
    data_orcamento datetime,
    data_prazo datetime DEFAULT NULL,
    id_servico int not null,
    primary key (id_orcamento),
    foreign key (id_cliente) references clientes(id_cliente)ON UPDATE CASCADE ON DELETE CASCADE,
    foreign key (id_produto) references produtos(id_produto)ON UPDATE CASCADE ON DELETE CASCADE,
    foreign key (id_funcionario) references funcionarios(id_funcionario)ON UPDATE CASCADE ON DELETE CASCADE,
    foreign key (id_servico) references servico(id_servico)ON UPDATE CASCADE ON DELETE CASCADE
);

create table if not exists forma_pagamento(
	id_forma_pagamento int not null auto_increment,
    forma_pagamento varchar(15),
    primary key(id_forma_pagamento)
);

create table if not exists venda_finalizada(
	id_venda int not null auto_increment,
    id_orcamento int not null unique,
    data_conclusao datetime,
    id_forma_pagamento int not null,
    tempo_concerto time,
    primary key(id_venda),
    foreign key (id_orcamento) references orcamento(id_orcamento)ON UPDATE CASCADE ON DELETE CASCADE,
    foreign key (id_forma_pagamento) references forma_pagamento(id_forma_pagamento)ON UPDATE CASCADE ON DELETE CASCADE
);

insert into clientes
(id_cliente, nome, celular)
values

(default, "José Ferreira Silva", "(74) 98463-3811"),
(default, "Carlos Santos", "(64) 92318-7799"),
(default, "Matheus A. Souza", "(75) 93522-7719"),
(default, "Rosangela Matos Gomes", "(41) 99743-8964"),
(default, "Pedro Almeida P.", "(11) 93042-3972"),
(default, "Gustavo Jesus", "(12) 96881-9228"),
(default, "Simone F. Rodrigues", "(26) 96940-3580"),
(default, "Marcos Lopes", "(40) 90405-6725"),
(default, "Gabriel Correia Filho", "(30) 99093-7866"),
(default, "Antonio F.", "(79) 91461-6146"),
(default, "Monica Silva", "(38) 93665-0237");

insert into cargos_Exercido
(id_cargo, nome)
values

(default, "Vendedor"),
(default, "Mêcanico");

insert into funcionarios
(id_funcionario, nome, cpf, valor_salario, id_cargo)
values

(default, "Lucas Z. Silva", "882.439.236-91", "1650.00", 1),
(default, "Luan Henrique Souza", "168.240.437-45", "1450.00", 2);

insert into fornecedor
(id_fornecedor, nome)
values

(default, "JR Comercio"),
(default, "GTU Brasil"),
(default, "Cia do Pedal"),
(default, "KF Bikes"),
(default, "Bike Plus");

insert into produtos
(id_produto, nome, id_fornecedor, preco, quantidade_estoque, quantidade_min_estoque)
values

(default, "CAMBIO DT 34,9 DUAL SWING FD-TY510", 1, "123.20", 20, 2),
(default, "CAMBIO TS S/ GANCHEIRA 12V RD-M6100 DEORE PRETO", 1, "143.12", 15, 2),
(default, "CAMBIO TS C/ GANCHEIRA 6V SL-TZ500 TOURNEY PRETO", 1, "143.12", 5, 1),
(default, "CORRENTE GROSSA 114 ELOS TEC", 1, "19.87", 8, 2),
(default, "APOIO DE ALUMÍNIO TROLHINHO", 2, "39.90", 15, 2),
(default, "GUIDÃO DE FERRO CG 22.2X700 MM", 2, "94.90", 10, 1),
(default, "GUIDÃO DE FERRO BEACH 22.2X700 MM", 2, "109.90", 5, 1),
(default, "GUIDÃO EM ALUMINIO 22.2X700 TRAVESSA DE ALUMÍNIO", 2, "110.90", 5, 1),
(default, "Canote de Selim 31,6 x 350 mm 3D", 3, "88.00", 10, 2),
(default, "Pedal Plataforma em Alumínio Preto", 3, "36.00", 20, 3),
(default, "Freio a disco Hidráulico com rotores", 3, "355.00", 3, 1),
(default, "Quadro 29 MTB em aluminio Luna", 3, "719.00", 2, 1),
(default, "Rotor para Freio a Disco 160mm", 3, "80.90", 10, 2),
(default, "Freio V Brake Completo Vermelho", 4, "68.00", 5, 1),
(default, "Pedivela Shimano Ultegra R8000", 4, "2492.29", 1, 1),
(default, "RODA 27.5 MT-35 DIANT 15MM TRASEIRA BLOCAGEM", 4, "678.68", 10, 2),
(default, "MODULADOR PARA FREIO V-BRAKE SHIMANO", 4, "17.85", 25, 5),
(default, "Disco De Freio Para Bike Jagwire Sport", 5, "219.90", 10, 1),
(default, "Kit Conduíte E Cabo Para Freio De Bike Jagwire", 5, "531.90", 3, 1),
(default, "Pastilha De Freio Bike Para Freio Shimano", 5, "129.00", 8, 1);

insert into servico
(id_servico, nome_servico)
values

(default, "Venda e Manutenção"),
(default, "Venda"),
(default, "Manutenção"); 

insert into orcamento
(id_orcamento, id_cliente, id_produto, id_funcionario, quantidade_produto_pedida, valor_manutencao, data_orcamento, data_prazo, id_servico)
values

(default, 1, null, 1, null, "200.00", '2017-09-23 11:00:00', '2017-09-25 13:00:00', 3),
(default, 4, 16, 2, 2, "235.00", '2017-02-27 17:00:00', '2017-02-28 10:00:00', 1),
(default, 8, null, 1, null, "200.00", '2018-09-23 09:00:00', '2018-09-25 08:00:00', 3),
(default, 9, 20, 2, 2, "45.00", '2018-06-27 15:30:00', '2018-06-28 10:00:00', 1),
(default, 3, 20, 2, 2, null, '2020-10-20 11:00:00', null, 2), 
(default, 1, 12, 1, 1, "200.00", '2021-09-23 15:00:00', '2021-09-25 13:00:00', 1),
(default, 5, 1, 2, 1, "50.00", '2021-11-23 11:15:00', '2021-11-26 16:30:00', 1),
(default, 7, 20, 1, 2, "20.00", '2021-11-24 08:45:00', '2021-11-25 13:00:00', 1),
(default, 2, 17, 2, 1, "30.00", '2021-11-24 09:25:00', '2021-11-27 15:00:00', 1),
(default, 4, 3, 1, 1, "100.00", '2021-11-25 18:45:00', '2021-11-28 15:30:00', 1),
(default, 6, 9, 2, 1, "15.00", '2021-11-25 18:00:00', '2021-11-26 13:30:00', 1),
(default, 8, null, 2, null, "150.00", '2021-11-25 13:45:00', '2021-11-26 17:00:00', 3),
(default, 9, 19, 2, 1, "50.00", '2021-11-26 11:25:00', '2021-11-30 14:00:00', 1),
(default, 10, 18, 1, 2, "50.00", '2021-11-27 10:50:00', '2021-11-30 16:00:00', 1);

insert into forma_pagamento
(id_forma_pagamento, forma_pagamento)
values

(default, "Dinheiro"),
(default, "Cheque");

insert into venda_finalizada
(id_venda, id_orcamento, data_conclusao, id_forma_pagamento, tempo_concerto)
values

(default, 1, '2017-09-24 16:00:00', 1, '01:00:00' ),
(default, 2, '2017-02-28 16:00:00', 2, '06:45:00'),
(default, 3, '2018-09-25 07:00:00', 1, '00:50:00'),
(default, 4, '2018-06-27 16:00:00', 1, '04:10:00'),
(default, 5, '2020-10-20 11:00:00', 1, null),
(default, 7, '2021-11-25 09:30:00', 2, '02:45:00'),
(default, 10, '2021-11-28 16:00:00', 1, '11:00:00'),
(default, 13, '2021-11-28 16:00:00', 2, '03:40:00');



/* criação de view */
/*quanto entrou em caixa por dia*/

select
	v.data_conclusao,
	sum((o.quantidade_produto_pedida * p.preco) + o.valor_manutencao) as total
from orcamento as o 
inner join venda_finalizada as v on o.id_orcamento = v.id_orcamento
inner join produtos as p on p.id_produto = o.id_produto
group by v.data_conclusao;


/*quanto entrou em caixa por mês*/

select
	v.data_conclusao,
	sum((o.quantidade_produto_pedida * p.preco) + o.valor_manutencao) as total
from orcamento as o 
inner join venda_finalizada as v on o.id_orcamento = v.id_orcamento
inner join produtos as p on p.id_produto = o.id_produto
group by month(v.data_conclusao);


/*quanto entrou em caixa por ano*/

select
	v.data_conclusao,
	sum((o.quantidade_produto_pedida * p.preco) + o.valor_manutencao) as total
from orcamento as o 
inner join venda_finalizada as v on o.id_orcamento = v.id_orcamento
inner join produtos as p on p.id_produto = o.id_produto
group by year(v.data_conclusao);

/*quantas bicicletas passam pela manutenção por dia*/

select
	v.data_conclusao,
    count(s.id_servico) as quant_dia
from orcamento as o 
inner join servico as s on s.id_servico = o.id_servico and o.id_servico = '1' and '3'
inner join venda_finalizada as v on o.id_orcamento = v.id_orcamento
group by day(v.data_conclusao);

/* a média de quantas horas por bicicleta um mecânico precisa para fazer a manutenção*/

select
	count(v.tempo_concerto) as quantidade,
	SEC_TO_TIME( SUM(time_to_sec( v.tempo_concerto )))/2 as tempo
from venda_finalizada as v
where v.tempo_concerto is not null;


/*a média de horas da manutenção | o valor médio do valor pago na 
manutenção | o valor médio pago em horas pro funcionário */

select 
	sec_to_time(sum(time_to_sec(v.data_conclusao) - time_to_sec(o.data_orcamento))/count(v.id_venda))as media_hora_manutencao,
    sum(o.valor_manutencao) / count(o.valor_manutencao) as media_valor_manutencao,
    (f.valor_salario)/30/8 as salario_hora
from orcamento as o 

inner join venda_finalizada as v on v.id_orcamento = o.id_orcamento
join funcionarios as f on f.id_funcionario = o.id_funcionario
where o.valor_manutencao is not null
group by f.id_funcionario;

/* quanto entra por setor (vendas | manutenção) */

select 
    sum(o.quantidade_produto_pedida * p.preco) as venda,
    sum(o.valor_manutencao) as manutencao
from orcamento as o 
left outer join produtos as p on o.id_produto = p.id_produto
join venda_finalizada as v on o.id_orcamento = v.id_orcamento;


/* quanto sai (custo de funcionários) */

select
	sum(valor_salario) as custo_funcionario
from funcionarios;

/*quanto gera de lucro nas vendas de peças*/

select 
    sum(o.quantidade_produto_pedida * p.preco) as venda
from orcamento as o 
left outer join produtos as p on o.id_produto = p.id_produto
join venda_finalizada as v on o.id_orcamento = v.id_orcamento;

/*quantas bicicletas saem fora do prazo na devolução pro cliente*/

select
	count(v.id_venda) as quantidade
from venda_finalizada as v 
join orcamento as o on o.id_orcamento = v.id_orcamento where o.data_prazo < v.data_conclusao;





