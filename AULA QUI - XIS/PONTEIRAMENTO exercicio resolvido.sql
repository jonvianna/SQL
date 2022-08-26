/* Cria o banco de dados "escola" */
create database BD_ESCOLA;

/* Define o banco de dados "muitos_para_muitos" como o banco de dados atual */
use BD_ESCOLA;

/* Cria a tabela "estudantes" */
create table estudantes(
	id_estudante int not null,
    nome_estudante varchar (40) not null,
	primary key (id_estudante)
);

/* Cria a tabela "disciplinas" */
create table disciplinas(
	id_disciplina int not null,
    nome_disciplina varchar (40) not null,
	ano_disciplina tinyint not null,
	primary key (id_disciplina)
);

/* Cria a tabela "notas" */
create table notas(
	id_estudante_nota int not null,
    id_estudante int not null,
    id_disciplina int not null,
    nota decimal(3,1),
    primary key(id_estudante_nota),
	foreign key (id_estudante) references estudantes(id_estudante),
    foreign key (id_disciplina) references disciplinas(id_disciplina)
);

/* Insere registros na tabela "estudantes" */
insert into estudantes
(id_estudante, nome_estudante)
values
('1', 'André'),
('2', 'Bernardo'),
('3', 'Carolina'),
('4', 'Ana'),
('5', 'Henrique');

/* Mostra os registros da tabela "estudantes" */
select * from estudantes;

/* Insere registros na tabela "disciplinas" */
insert into disciplinas
(id_disciplina, nome_disciplina,ano_disciplina)
values
('1', 'Banco de dados','1'),
('2', 'Algoritmos de programação','1'),
('3', 'Programação I','2'),
('4', 'Programação II','3'),
('5', 'TCC','4');

/* Mostra os registros da tabela "disciplinas" */
select * from disciplinas;

/* Insere registros na tabela "estudante_notas" */
insert into notas
(id_estudante_nota, id_estudante, id_disciplina, nota)
values
('1', '1', '1', '10'),
('2', '3', '2', '9.5'),
('3', '2', '4', '6.5'),
('4', '4', '2', '8'),
('5', '5', '3', '2.5');

/* Mostra os registros da tabela "disciplinas" */
select * from notas;

/* Mostra todas as disciplinas do 3 ano*/
SELECT nome_disciplina, ano_disciplina
FROM disciplinas
WHERE ano_disciplina = 3
ORDER BY nome_disciplina;

/* Mostra todos os estudantes que cursam disciplinas do 1 ano */
SELECT d.ano_disciplina, e.nome_estudante
FROM disciplinas AS d INNER JOIN notas AS n
ON d.id_disciplina = n.id_disciplina
INNER JOIN estudantes AS e
ON n.id_estudante = e.id_estudante
WHERE ano_disciplina = 1
ORDER BY nome_estudante;

/* Mostra o nome do estudante e sua nota */
SELECT e.nome_estudante, n.nota
FROM estudantes AS e
JOIN notas AS n
ON n.id_estudante = e.id_estudante
ORDER BY nome_estudante;

/* Mostra o nome da disciplina, o nome do estudante e sua nota */
SELECT e.nome_estudante, n.nota, d.nome_disciplina
FROM estudantes e
JOIN notas n
ON n.id_estudante = e.id_estudante
JOIN disciplinas d
ON d.id_disciplina = n.id_disciplina
ORDER BY e.nome_estudante;

/* Mostra a média dos estudantes nas disciplinas */
SELECT e.nome_estudante, AVG(n.nota) AS media
FROM estudantes e JOIN notas n
ON e.id_estudante = n.id_estudante
GROUP BY e.nome_estudante;