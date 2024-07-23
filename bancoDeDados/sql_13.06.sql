-- ESQUEMA RELACIONAL EXEMPLO
-- EMPREGADO (MATRICULA, NOME_EMPREGAGO, SALARIO, NUM_DEPTO)
-- DEPARTAMENTO (NUM_DEPTO, NOME_DEPTO)


-- PROJETO (NUM_PROJ, NOME_PROJETO, LUGAR)
CREATE TABLE IF NOT EXISTS PROJETO(
	NUM_PROJ SERIAL NOT NULL,
	NOME_PROJETO VARCHAR(100) NOT NULL,
	LUGAR VARCHAR(40) NOT NULL,
	CONSTRAINT PROJETO_PK PRIMARY KEY(NUM_PROJ)
);

INSERT INTO PROJETO (NOME_PROJETO, LUGAR) VALUES
('Desenvolvimento de Landing Page', 'São Paulo')
select * from empregado
-- TRABALHA (MAT_EMPREGADO, NUM_PROJ, HORAS)
CREATE TABLE IF NOT EXISTS TRABALHA(
	MAT_EMPREGADO INT,
	NUM_PROJETO INT,
	HORAS VARCHAR(10),
	--CHAVE PRIMÁRIA
	CONSTRAINT TRABALHA_EMP_PROJ_PK PRIMARY KEY
	(MAT_EMPREGADO, NUM_PROJETO),
	--CHAVE ESTRANGEIRA
	CONSTRAINT TRABALHA_EMPREGADO_FK FOREIGN KEY (MAT_EMPREGADO)
	REFERENCES EMPREGADO (MATRICULA),
	CONSTRAINT TRABALHA_PROJETO_FK FOREIGN KEY (NUM_PROJETO)
	REFERENCES PROJETO (NUM_PROJ)	
);
INSERT INTO TRABALHA (MAT_EMPREGADO, NUM_PROJETO, HORAS) VALUES
(2, 1, 30),
(3, 1, 40),
(98, 1, 10)
SELECT * FROM TRABALHA;



-- DEPENDENTE (MATRICULA_EMPREG, NOME_DEPENDENTE, GRAU_PARENTESCO)
