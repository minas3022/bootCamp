--1. **Adicionar um novo cliente**:
--   - Adicione um novo cliente com os seguintes dados: nome, email, telefone e idade.

INSERT INTO CLIENTES(NOME,EMAIL,TELEFONE,IDADE) VALUES
	('MARLOS SILVA','marlos@armart.com.br','(11)3221-5241','60');

--2. **Adicionar um novo produto**:
--   - Adicione um novo produto com os seguintes dados: nome, preço e quantidade.

INSERT INTO PRODUTOS(NOME,PRECO,QUANTIDADE) VALUES
	('REFRIGERANTES COLA',6.52,560);

--3. **Adicionar um novo item de venda**:
--   - Adicione um novo item de venda relacionando um produto e um
--cliente existentes com uma quantidade específica.

INSERT INTO ITENS (CODIGO_PRODUTO,ID_CLIENTE,QUANTIDADE) VALUES
(5,12,122);


--4. **Atualizar o telefone de um cliente**:
--   - Atualize o telefone de um cliente específico usando seu email como referência.

UPDATE CLIENTES SET TELEFONE ='(34)6522-5744'
WHERE
EMAIL='maria@gmail.com';


--5. **Atualizar o preço e a quantidade de um produto**:
--   - Atualize o preço e a quantidade de um produto específico
--usando o nome do produto como referência.

UPDATE produtos SET PRECO =2.22, QUANTIDADE=150
WHERE
NOME='PIRULITO';

--6. **Atualizar a quantidade de um item de venda**:
--   - Atualize a quantidade de um item de venda 
--específico usando seu ID como referência.

UPDATE ITENS SET QUANTIDADE=25
	WHERE ID=7;

--7. **Deletar um cliente específico**:
--   - Delete um cliente específico usando seu email como referência.

DELETE FROM CLIENTES WHERE EMAIL ='banco15@uol.com';

---------------------------
--8. **Deletar um produto específico**:
--   - Delete um produto específico usando o nome do produto como referência.

DELETE FROM PRODUTOS WHERE NOME='PIRULITO';

--9. **Deletar um item de venda específico**:
--   - Delete um item de venda específico usando seu ID como referência.

DELETE FROM ITENS WHERE ID=16;

--10. **Criar uma view que exibe todos os clientes com suas respectivas idades e telefones**:
--    - Crie uma view que mostra o nome, idade e telefone de todos os clientes.

CREATE VIEW CLIENTE_DADOS AS 
SELECT C.NOME ,C.IDADE,C.TELEFONE FROM CLIENTES C;

--11. **Criar uma view que exibe todos os produtos com seus preços e quantidades em estoque**:
--    - Crie uma view que mostra o nome, preço e quantidade de todos os produtos.


CREATE VIEW QUANTIDADE_PRECO AS
SELECT P.NOME,P.PRECO,P.QUANTIDADE FROM PRODUTOS P;



--12. **Criar uma view que exibe o total vendido por cada cliente**:
--    - Crie uma view que mostra o nome do cliente e o total vendido por ele.

CREATE VIEW TOTAL_VENDIDO AS
SELECT 
    C.NOME AS CLIENTE,
    SUM(I.QUANTIDADE)AS "Total Vendido"
FROM 
   ITENS I
JOIN 
  CLIENTES  C ON I.ID_CLIENTE = C.ID 
GROUP BY C.NOME ORDER BY 1;

--TESTANDO A VIEW
-- SELECT * FROM TOTAL_VENDIDO


--13. **Adicionar um novo cliente e uma nova compra para esse cliente**:
--    - Adicione um novo cliente com dados fictícios.
--    - Adicione um novo item de venda para esse cliente relacionando um produto existente.
WITH NOVO_CLIENTE AS (
    INSERT INTO CLIENTES (NOME, EMAIL, TELEFONE,IDADE)
    VALUES ('MARIETA SILVA', 'marieta@EXAMPLE.COM', '(11) 99999-9999',45)
    RETURNING ID
)
-- ADICIONAR NOVA VENDA USANDO O CLIENTE_ID CAPTURADO
INSERT INTO ITENS (CODIGO_PRODUTO,ID_CLIENTE, QUANTIDADE)
SELECT 1,ID, 2
FROM NOVO_CLIENTE;

--14. **Atualizar o nome e o email de um cliente específico**:
--    - Atualize o nome e o email de um cliente usando seu ID como referência.

UPDATE CLIENTES SET NOME='AMARILDO SILVA',EMAIL='joao_silva@uol.com'
WHERE ID=15;

--15. **Deletar todos os itens de venda de um produto específico**:
--    - Delete todos os itens de venda de um produto específico usando
--o código do produto como referência.

DELETE FROM ITENS WHERE CODIGO_PRODUTO=1;

--16. **Adicionar múltiplos clientes**:
--   - Adicione três novos clientes com dados fictícios em uma única instrução `INSERT`.
INSERT INTO CLIENTES(NOME,EMAIL,TELEFONE,IDADE) VALUES
	('ATAIDES MAURO','ataides@armart.com.br','(11)3111-5241','50'),
	('MAURO SILVA','mauro@armart.com.br','(11)3201-5241','30'),
	('JOAO BRITO','jaob@armart.com.br','(11)3111-5211','40');

--17. **Adicionar múltiplos produtos**:
--   - Adicione dois novos produtos com dados fictícios em uma única instrução `INSERT`.

INSERT INTO PRODUTOS(NOME,PRECO,QUANTIDADE) VALUES
	('CERVEJA COLA2',11.52,5),
	('SOBREMESA1',1.55,4);

--18. **Adicionar múltiplos itens de venda**:
--   - Adicione três novos itens de venda relacionando diferentes produtos e clientes existentes em uma única instrução `INSERT`.

INSERT INTO ITENS (CODIGO_PRODUTO,ID_CLIENTE,QUANTIDADE) VALUES
(5,13,65),
(6,14,78),
(7,15,92);

--19. **Atualizar a idade de todos os clientes acima de 30 anos**:
--   - Aumente a idade de todos os clientes que têm mais de 30 anos em 1 ano.
UPDATE CLIENTES SET IDADE=IDADE+1
	WHERE IDADE>30;

--20. **Atualizar o preço de todos os produtos com quantidade menor que 10**:
--   - Aumente o preço de todos os produtos com quantidade menor que 10 em 10%.

UPDATE PRODUTOS SET PRECO=PRECO*1.10
	WHERE QUANTIDADE<10;


--21. **Atualizar o nome de todos os produtos para incluir uma palavra-chave**:
--   - Adicione a palavra "Promoção" ao início do nome de todos os produtos.

UPDATE PRODUTOS SET NOME = 'Promoção ' || NOME;

--22. **Deletar todos os clientes com idade menor que 18 anos**:
--   - Delete todos os clientes que têm menos de 18 anos.

DELETE FROM CLIENTES
	WHERE IDADE<18;

--23. **Deletar todos os produtos com preço maior que 50**:
--   - Delete todos os produtos cujo preço é maior que 50.

DELETE FROM PRODUTOS
	WHERE PRECO>50;

--24. **Deletar todos os itens de venda de clientes específicos**:
--   - Delete todos os itens de venda de clientes com email específico.

DELETE FROM ITENS WHERE
	ID_CLIENTE IN(
	SELECT ID FROM CLIENTES
	WHERE EMAIL='martins@armart.com.br'
	);

--25. **Criar uma view que exibe o estoque total de produtos vendidos**:
--    - Crie uma view que mostra o nome do produto e o total 
--vendido em relação ao estoque.
CREATE VIEW PROD_VEND AS 
SELECT 
    P.NOME AS PRODUTO,
	P.QUANTIDADE AS "Estoque",
    SUM(i.QUANTIDADE)AS "Quant.Vend"
FROM 
    ITENS I
LEFT JOIN 
    PRODUTOS P ON I.CODIGO_PRODUTO = P.CODIGO
GROUP BY P.NOME,P.QUANTIDADE;

--TESTAR A VIEW
--SELECT * FROM PROD_VEND

--26. **Criar uma view que exibe os clientes que não fizeram compras**:
--- Crie uma view que mostra o nome e email dos clientes que não têm itens de venda associados.

CREATE VIEW CLIENTES_SEM_VENDAS AS
SELECT 
    C.NOME,
    C.EMAIL
FROM 
    CLIENTES C
LEFT JOIN 
    ITENS IV ON C.ID = IV.ID_CLIENTE
WHERE 
    IV.ID_CLIENTE IS NULL;
 
--select * from clientes_sem_vendas

--27. **Criar uma view que exibe os produtos não vendidos**:
--- Crie uma view que mostra o nome e preço dos produtos que não 
--foram vendidos (quantidade de vendas igual a zero).


CREATE VIEW PRODUTOS_NAO_VENDIDOS AS
SELECT 
    P.NOME AS NOME_PRODUTO,
    P.PRECO AS PRECO_PRODUTO

FROM 
    PRODUTOS P
LEFT JOIN 
    ITENS IV ON P.CODIGO = IV.CODIGO_PRODUTO
GROUP BY 
    P.NOME, P.PRECO
HAVING 
    COALESCE(SUM(IV.QUANTIDADE), 0) = 0;
--CONFERENCIA
--SELECT * FROM PRODUTOS_NAO_VENDIDOS;



--28. **Adicionar uma nova coluna em uma tabela e atualizar dados**:
--    - Adicione uma nova coluna `data_de_cadastro` à tabela `clientes` 
--e preencha-a com a data atual para todos os clientes.
	-- ADICIONAR A NOVA COLUNA
ALTER TABLE CLIENTES
ADD COLUMN DATA_DE_CADASTRO DATE;

-- PREENCHER A NOVA COLUNA COM A DATA ATUAL
UPDATE CLIENTES
SET DATA_DE_CADASTRO = CURRENT_DATE;

--29. **Atualizar o preço dos produtos com base em uma condição**:
---    - Aumente o preço de todos os produtos em 5% se a quantidade 
--em estoque for menor que 20.

UPDATE PRODUTOS SET PRECO=PRECO*1.05 WHERE
QUANTIDADE<20;

--30. **Deletar registros duplicados em uma tabela**:
--    - Encontre e delete registros duplicados na tabela `clientes`, 
--mantendo apenas um registro por cliente com base no email.

DELETE FROM clientes
USING (WITH duplicados AS (SELECT id,email, 
	ROW_NUMBER() OVER (PARTITION BY email ORDER BY id) AS rn
        FROM
            clientes
    )
    SELECT id
    FROM duplicados
    WHERE rn > 1
) AS del
WHERE clientes.id = del.id;

--31. **Criar uma view que exibe a média de vendas por produto**:
--    - Crie uma view que mostra o nome do produto e a 
--média de itens vendidos por produto.

SELECT P.NOME AS "Produto",ROUND(AVG(I.QUANTIDADE),2) as "Media Quant.vendidas"
FROM
ITENS I
LEFT JOIN
PRODUTOS P
ON P.CODIGO=I.CODIGO_PRODUTO
GROUP BY P.NOME;

--32. **Adicionar um novo cliente e realizar múltiplas 
--compras para esse cliente**:
--    - Adicione um novo cliente com dados fictícios.
--    - Adicione três novos itens de venda para esse cliente,
--relacionando diferentes produtos.

INSERT INTO clientes (nome, email, telefone, idade,data_de_cadastro)
VALUES ('João Silva', 'joao.silva@example.com','034-3225-5262',48,CURRENT_DATE);

-- INSERIR 3 NOVOS ITENS DE VENDA
INSERT INTO ITENS (ID_CLIENTE, CODIGO_PRODUTO, QUANTIDADE)
VALUES
    ((SELECT ID FROM CLIENTES WHERE EMAIL = 'joao.silva@example.com'), 1, 2),
    ((SELECT ID FROM CLIENTES WHERE EMAIL = 'joao.silva@example.com'), 2, 1),
    ((SELECT ID FROM CLIENTES WHERE EMAIL = 'joao.silva@example.com'), 3, 3);

--33. **Atualizar o email de todos os clientes para um novo domínio**:
--    - Atualize o email de todos os clientes para um novo domínio,
--por exemplo, mude `@example.com` para `@novodominio.com`.

UPDATE CLIENTES SET EMAIL='@novodominio.com'
	WHERE EMAIL='@example.com';

--34. **Deletar produtos que não foram vendidos nos últimos 6 meses**:
--    - Delete todos os produtos que não têm itens de venda
--associados nos últimos 6 meses.
--CRIAR CAMPO DATA TABELA ITENS

DELETE FROM produtos
WHERE CODIGO NOT IN (
    SELECT DISTINCT p.CODIGO
    FROM produtos p
    LEFT JOIN itens iv ON p.CODIGO = iv.CODIGO_PRODUTO
    WHERE iv.data_de_venda >= CURRENT_DATE - INTERVAL '6 months'
);


--35. **Criar uma view que exibe a proporção de vendas por cliente**:
--    - Crie uma view que mostra o nome do cliente e 
--a proporção do total de vendas em relação ao total de vendas de 
--todos os clientes.

	CREATE VIEW PROPORCAO_VENDAS_CLIENTE AS
SELECT 
    C.NOME AS NOME_CLIENTE,
    SUM(IV.QUANTIDADE) AS TOTAL_VENDAS_CLIENTE,
    ROUND(SUM(IV.QUANTIDADE) / TOTAL.TOTAL_VENDAS_TOTAL * 100.0, 2) AS PROPORCAO_VENDAS_PERCENTUAL
FROM 
    CLIENTES C
JOIN 
    ITENS IV ON C.ID = IV.ID_CLIENTE
JOIN 
    (SELECT SUM(QUANTIDADE) AS TOTAL_VENDAS_TOTAL FROM ITENS) AS TOTAL
ON 
    TRUE
GROUP BY 
    C.NOME, TOTAL.TOTAL_VENDAS_TOTAL;

--TESTANDO VIEW
--SELECT * FROM PROPORCAO_VENDAS_CLIENTE


















