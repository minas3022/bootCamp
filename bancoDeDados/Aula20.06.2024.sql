--DDL (CREATE, ALTER, DROP)
--DML (INSERT, UPDATE, DELETE)
--DQL (SELECT)
-- CLAUSULAS 
	-- WHERE
	-- ORDER BY
	-- LIMIT
-- OPERADORES
	-- LOGICOS
	-- ARITMÉTICOS
	-- BETWEEN
	-- LIKE
	-- IN (MELHORAR)
	-- IS NULL (FALTA)
-- FUNÇÕES DE AGREGAÇÃO
	-- AVG
	-- MAX
	-- MIN
	-- COUNT
	-- SUM
-- USO DO ALIAS
	-- substituir os nomes das tabelas em comandos SQL
-- CÁLCULO NO SELECT
--  HOJE
	-- CLÁUSULA GROUP BY
	-- SUBCONSULTAS
	-- CONSULTAS DE DADOS EM VARIAS TABELAS (JOINS)
	-- CONSULTAS ANINHADAS
--
-- AMANHÃ
	-- TRIGGERS
	-- TRIGGERS FUNCTIONS
	-- FUNCTIONS

SELECT * FROM DEPARTAMENTO LIMIT 2;

--GROUPY BY
-- Liste o numero do departamento e a quntidade de emprgados dele

-- SELECT NUM_DEPTO AS NUMERO_DEPTO,COUNT(*) AS TOTA_EMPREGADOS
-- 	FROM EMPREGADO GROUP BY NUM_DEPTO;

-- Listar o numero total de empregados que recebem salrios superior
-- a 4500 em cdada departamento com mais de 50 funcionarios que ganham
-- mais que 4500

-- CLAUSUAL(HAVING) VEM APOS GROUP BY E ANTES DO ORDER BY

SELECT NUM_DEPTO,COUNT(*) FROM EMPREGADO
	WHERE SALARIO>4500
		GROUP BY NUM_DEPTO
			HAVING COUNT(*)>50;

-- JOINS
	-- Citar as tabelas envolvidas na clausua from
	-- Qualificadores de nomes (ALIAS) evitar ambuguidades
-- LISTAR O NOME DO EMPREGADO E DO DEPARTAMENTO AO QUAL ESTÁ ALOCADO
	-- EMPREGADO e
	-- DEPARTAMENTO d

SELECT e.nome_empregado AS funcionario, d.nome_depto AS departamento
	FROM empregado e, departamento d
		WHERE d.num_depto=e.num_depto limit 10


SELECT e.nome_empregado AS funcionario, d.nome_depto AS departamento
	FROM empregado e, departamento d
		WHERE d.num_depto=e.num_depto
		ORDER BY e.salario desc
		limit 10;

select * from projeto

select e.nome_empregado,d.nome_depto from
	empregado e,departamento d, trabalha t
	where t.horas>'15'
	and d.num_depto=e.num_depto
	and t.mat_empregado=e.matricula


-- LISTAR NUMERO DE HORAS TRABALHADAS EM PROJETOS DE CADA EMPREGADO
-- POR DEPARTAMENTO INFORMANDO O NOME DO DEPARTAMENTO E A MATRICULA DO
-- EMPREGADO


-- ALTER TABLE trabalha
-- 	ALTER COLUMN horas type integer using horas ::integer; --:: altera campo com registros

select d.nome_depto, e.matricula, sum(t.horas)
from empregado e, departamento d, trabalha t
where e.num_depto=d.num_depto
and
t.mat_empregado=e.matricula
group by d.nome_depto, e.matricula;


select e.nome_empregado,d.nome_depto, e.matricula, sum(t.horas)
from empregado e  --a principal primeiramente (empregado)
join departamento d on e.num_depto=d.num_depto
join trabalha t on t.mat_empregado=e.matricula
group by e.nome_empregado,d.nome_depto,e.matricula

--listar o nome de todos empregados e dos departamentos que trabalham

select e.nome_empregado, d.nome_depto
	from departamento d
		right outer join
			empregado e
	on d.num_depto =e.num_depto


--subconsultas
--listar os empregados que trabalham no departamento devs

select * from empregado
	where num_depto 
	in (select num_depto from departamento 
		where nome_depto='DEVs');

--listar os empregados cujo salarios são maiores a media salarial e
-- mostre o quanto são maiores

select nome_empregado, salario,
	salario -(select avg(salario) from empregado)
	as diferenca_salarial from empregado 
	where salario>(select avg(salario) from empregado);


SELECT
	nome_empregado,
	salario,
	(salario - media_salarial) AS diferenca_salarial,
	ROUND(((salario - media_salarial)/ media_salarial)*100, 2) 
	AS percentual_a_mais
FROM
	EMPREGADO,
		(SELECT AVG(salario) AS media_salarial FROM EMPREGADO) 
		AS MEDIA_SAL
WHERE
	salario > (SELECT AVG(salario) FROM EMPREGADO)
ORDER BY
	salario desc;


--CLAUSULAS ANY-SOME
-- LISTAR OS EMPREGADOS QUE POSSUME SALARIO MAIOR PELO MENOS UM EMPREGADO
-- DO DEPARTAMENTO 02


SELECT * FROM EMPREGADO
where salario>=any(select salario from empregado where num_depto=54);

SELECT * FROM DEPARTAMENTO ORDER BY 1 DESC

INSERT INTO DEPARTAMENTO(NOME_DEPTO)VALUES
('GERAL')
	
insert into empregado(nome_empregado,salario,num_depto) values
('CARLOS SILVA',1500,54);

--CLAUSULA EXISTS OU NOT EXISTS
--LISTE TODOS OS EMPREGADOS DO DEPARTAMENTO DESIGN

SELECT * FROM EMPREGADO e
where not exists (
	select d.num_depto from
	departamento d
	where e.num_depto=d.num_depto
	and d.nome_depto='RH'
)


SELECT * FROM DEPARTAMENTO

select * from empregado e
where (select t.num_projeto from )
select * from trabalha

select * from projeto
select * from trabalha
--usando cross join

select * from empregado e where e.matricula
	in(select t.mat_empregado from trabalha t
	cross join projeto p
	where t.num_projeto=p.num_proj
	and p.lugar='Uberlandia')


























