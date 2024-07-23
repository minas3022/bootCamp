-- QUESTÃO 1

-- - CRIAR UMA TABELA DE AUDITORIA
CREATE TABLE auditoria_empregado (
    log_id SERIAL PRIMARY KEY,
    operacao VARCHAR(10),
    data_operacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    usuario VARCHAR(50),
    matricula INTEGER,
    nome_empregado VARCHAR(100),
	antigo_nome_empregado varchar(100),
    salario DECIMAL(10, 2),
    num_depto INTEGER
);

--- TRIGGER FUNCTION - 
CREATE OR REPLACE FUNCTION auditoria_empregado_changes()
RETURNS TRIGGER AS $$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        INSERT INTO auditoria_empregado (operacao, usuario, matricula, nome_empregado, antigo_nome_empregado, salario, num_depto)
        VALUES ('INSERT', current_user, NEW.matricula, NEW.nome_empregado, '-', NEW.salario, NEW.num_depto);
        RETURN NEW;
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO auditoria_empregado (operacao, usuario, matricula, nome_empregado, antigo_nome_empregado, salario, num_depto)
        VALUES ('UPDATE', current_user, NEW.matricula, NEW.nome_empregado, OLD.nome_empregado, NEW.salario, NEW.num_depto);
        RETURN NEW;
    ELSIF (TG_OP = 'DELETE') THEN
        INSERT INTO auditoria_empregado (operacao, usuario, matricula, nome_empregado, antigo_nome_empregado, salario, num_depto)
        VALUES ('DELETE', current_user, OLD.matricula, OLD.nome_empregado, '-', OLD.salario, OLD.num_depto);
        RETURN OLD;
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- CRIAÇÃO DA TRIGGER NA TABELA

CREATE TRIGGER audit_empregado
AFTER INSERT OR UPDATE OR DELETE ON empregado
FOR EACH ROW EXECUTE FUNCTION auditoria_empregado_changes();
	


-- QUESTÁO 2  Controle de Salário Máximo:--------------------------------------------------------
CREATE OR REPLACE FUNCTION verificar_aumento_salario()
RETURNS TRIGGER AS $$
BEGIN
    -- Verifica se o aumento de salário ultrapassa a  20%
    IF NEW.salario > OLD.salario * 1.20 THEN
        -- Lança uma exceção se o aumento for maior que 20%
        RAISE EXCEPTION 'O aumento de salário excede 20%% do salário atual';
    END IF;
    
    -- Se não exceder, permite a atualização
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


--CRIANDO A TRIGGER

CREATE TRIGGER trigger_verificar_aumento_salario
BEFORE UPDATE ON empregado
FOR EACH ROW
WHEN (OLD.salario IS DISTINCT FROM NEW.salario)
EXECUTE FUNCTION verificar_aumento_salario();

--testando a trigger
update empregado set salario=11500 where
matricula =3


-- Questão 03 HISTORICO DE SALARIO

-- Criação da tabela historico_salario
CREATE TABLE historico_salario (
    id SERIAL PRIMARY KEY,
    matricula INTEGER NOT NULL,
    nome_empregado VARCHAR(255) NOT NULL,
    salario_antigo NUMERIC(15, 2) NOT NULL,
    salario_novo NUMERIC(15, 2) NOT NULL,
    data_alteracao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

--Criação da função PL/pgSQL
CREATE OR REPLACE FUNCTION registrar_historico_salario()
RETURNS TRIGGER AS $$
BEGIN
    -- Insere um registro na tabela historico_salario
    INSERT INTO historico_salario (matricula, nome_empregado, salario_antigo, salario_novo)
    VALUES (OLD.matricula, OLD.nome_empregado, OLD.salario, NEW.salario);
    
    -- Permite a atualização
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--Criação do trigger
CREATE TRIGGER trigger_registrar_historico_salario
AFTER UPDATE ON empregado
FOR EACH ROW
WHEN (OLD.salario IS DISTINCT FROM NEW.salario)
EXECUTE FUNCTION registrar_historico_salario();

--TESTANDO A TRIGGER
update empregado set salario=6500 where
matricula =3

SELECT * FROM historico_salario

----------------------------------------------------------------------------------------------------
--QUESTÃO 04
-- Adicionando o campo datanascimento na tabela empregado
ALTER TABLE empregado
ADD COLUMN datanascimento DATE;

-- Adicionando o campo idade na tabela empregado
ALTER TABLE empregado
ADD COLUMN idade INTEGER;

-- Criando a função de trigger para calcular a idade na tabela empregado
CREATE OR REPLACE FUNCTION atualizar_idade()
RETURNS TRIGGER AS $$
BEGIN
    NEW.idade := DATE_PART('year', AGE(NEW.datanascimento));
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Criando o trigger

CREATE TRIGGER calcular_idade_trigger
BEFORE INSERT OR UPDATE ON empregado
FOR EACH ROW
EXECUTE FUNCTION atualizar_idade();

--testando trigger 
--update empregado set datanascimento='1970-05-15' where matricula=1420;
--select * from empregado order by 1 desc

---QUESTÃO 05 5. Calcular Média Salarial por Departamento:

CREATE OR REPLACE FUNCTION media_salarial_depto(depto_id INTEGER)
RETURNS NUMERIC AS $$
DECLARE
    media_salarial NUMERIC(10, 2);
BEGIN
    SELECT AVG(salario) INTO media_salarial
    FROM empregado
    WHERE num_depto = depto_id;

    RETURN media_salarial;
END;
$$ LANGUAGE plpgsql;

SELECT ROUND(media_salarial_depto(2),2);

---06-TAREFA 6. Promoção em Massa: 
	--FUNÇÃO PARA AUMENTAR SALARIO EM MASSA

CREATE OR REPLACE FUNCTION aumentar_salario_massa(percentual NUMERIC, depto_id INTEGER)
RETURNS VOID AS $$
BEGIN
    UPDATE empregado
    SET salario = salario + (salario * (percentual / 100))
    WHERE num_depto = depto_id;
END;
$$ LANGUAGE plpgsql;


--TESTANDO A FUNÇÃO
select aumentar_salario_massa(15,1);

select * from empregado where num_depto=1 order by 1 desc;


--QUESTÃO 07 - Função para Listar Empregados por Departamento:
-- CRIANDO A FUNÇÃO
CREATE OR REPLACE FUNCTION empregado_departamento(depto VARCHAR)
RETURNS TABLE (matricula INT, nome_empregado VARCHAR, num_depto INT) AS $$
BEGIN
    RETURN QUERY --Retorna a consulta de resultado
    SELECT e.matricula, e.nome_empregado, e.num_depto
    FROM empregado e
    JOIN departamento d ON e.num_depto = d.num_depto
    WHERE d.nome_depto = depto;
END;
$$ LANGUAGE plpgsql;

--TESTANDO A FUNÇÃO
SELECT * FROM empregado_departamento('VENDAS');

--QUESTÃO 8 Visão de Empregados e Departamentos:
CREATE VIEW empreg_depto AS
SELECT 
    e.nome_empregado AS nome_empregado,
    e.salario,
    d.nome_depto AS nome_departamento
FROM 
    empregado e
JOIN 
    departamento d ON e.num_depto = d.num_depto;

-- TESTANDO A VIEW
select * from empreg_depto;


--QUESTÃO 09. Visão de Empregados por Faixa Salarial:
CREATE VIEW empregado_faixa_salarial AS
SELECT 
    nome_empregado,
    salario,
    CASE
        WHEN salario < 2000 THEN 'Abaixo de 2000'
        WHEN salario BETWEEN 2000 AND 3000 THEN 'Entre 2000 e 3000'
        ELSE 'Acima de 3000'
    END AS faixa_salarial
FROM 
    empregado;

--TESTANDO A VIEW
SELECT * FROM empregado_faixa_salarial order by 2;

--QUESTAO 10 Visão de Empregados com Aumento Recente:
-- CRIAR UMA TABELA DE VARIACAO_SALARIO

CREATE TABLE variacao_salarial (
    id SERIAL PRIMARY KEY,
    matricula INTEGER NOT NULL,
    data_aumento DATE NOT NULL,
    novo_salario NUMERIC(10, 2) NOT NULL,
    CONSTRAINT fk_empregado
        FOREIGN KEY(matricula) 
        REFERENCES empregado(matricula)
);

-- VIEW
CREATE VIEW empregados_com_aumento AS
SELECT 
    e.nome_empregado AS nome_empregado,
    a.data_aumento,
    a.novo_salario
FROM 
    empregado e
JOIN 
    variacao_salarial a ON e.matricula = a.matricula
WHERE 
    a.data_aumento >= CURRENT_DATE - INTERVAL '6 months';

--TESTANDO A VIEW
SELECT * FROM empregados_com_aumento ORDER BY 2 ASC;

select * from variacao_salarial
insert into variacao_salarial(matricula,data_aumento,novo_salario)values
	(3,'2024-01-15',12000),
	(106,'2024-01-15',12000),
	(107,'2024-02-15',12000),
	(108,'2024-03-15',12000),
	(109,'2020-01-15',12000),
	(110,'2024-01-15',12000),
	(111,'2024-01-15',12000),
	(112,'2024-04-15',12000),
	(113,'2024-04-15',12000),
	(114,'2024-05-15',12000),
	(115,'2024-05-15',12000),
	(116,'2024-05-15',12000)
	;
	
select * from empregado order by 1













