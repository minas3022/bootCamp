---Criar a tabela clientes
CREATE TABLE IF NOT EXISTS CLIENTES(
	ID SERIAL NOT NULL,
	NOME VARCHAR(60) NOT NULL,
	EMAIL VARCHAR(15) NOT NULL,
	TELEFONE VARCHAR(11) NOT NULL,
	IDADE INTEGER NOT NULL,
	--CHAVE PRIMÁRIA
	CONSTRAINT ID_PK PRIMARY KEY(ID);
);

---Nao permitir duplicação email,telefone
ALTER TABLE clientes
ADD CONSTRAINT nome_data UNIQUE (email, telefone);


--Inserir registros clientes
INSERT INTO CLIENTES(NOME,EMAIL,TELEFONE,IDADE) VALUES
	('JOSE CARLOS','martins@armart.com.br','(34)5221-5241','55'),
	('MARIA JOSE','maria@gmail.com','(34)5221-5241','55'),
	('MARCOS ANTONIO','marcos15@gmail.com','(34)5221-5310','40'),
	('FONSECA SILVA','banco15@uol.com','(34)5221-1112','45'),
	('DALVINO JOSE ','dal52@ig.com.br','(34)5221-1012','25');

--seleciona dados tabela clientes 
SELECT * FROM CLIENTES;

-- criação da tabela produtos
CREATE TABLE IF NOT EXISTS PRODUTOS(
	CODIGO SERIAL NOT NULL,
	NOME VARCHAR(60) NOT NULL,
	PRECO DECIMAL (10,2) NOT NULL,
	QUANTIDADE DECIMAL (10,2) NOT NULL,
	--CHAVE PRIMÁRIA
	CONSTRAINT CODIGO_PK PRIMARY KEY(CODIGO)
);

---não permitir duplicação nome de produtos
ALTER TABLE produtos
ADD CONSTRAINT prod_uniq UNIQUE (nome);


---insere dados na tabela de produtos
INSERT INTO PRODUTOS(NOME,PRECO,QUANTIDADE) VALUES
	('CHOCOLATE BARRA',5.40,1500),
	('BALA BROKINHA',0.40,1200),
	('PIRULITO',1.40,550);

	
---seleciona dados da tabela produtos
--SELECT * FROM PRODUTOS;


-- criar tabela itens
CREATE TABLE IF NOT EXISTS itens (
    id SERIAL PRIMARY KEY,
    CODIGO_PRODUTO INT NOT NULL,
    ID_CLIENTE INT NOT NULL,
    QUANTIDADE DECIMAL (10,2) NOT NULL,
    FOREIGN KEY (codigo_produto) REFERENCES produtos(codigo),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);

---seleciona dados da tabela de itens
--select * from itens;


--insere dados na tabela de itens.
INSERT INTO ITENS (CODIGO_PRODUTO,ID_CLIENTE,QUANTIDADE) VALUES
(1,1,65),
(1,1,15),
(2,2,25),
(2,2,35),
(3,3,45),
(3,3,65),
(3,4,120),
(3,4,15),
(1,5,25),
(2,5,45);


---criar view consulta_completa para visualizar dos dados completos
CREATE VIEW CONSULTA_COMPLETA AS (
SELECT 
    itens.id_cliente as cd_cliente,
    itens.quantidade,
    produtos.nome as produto,
    clientes.nome as cliente
FROM 
    itens
JOIN 
    produtos ON itens.codigo_produto = produtos.codigo
JOIN 
    clientes ON itens.id_cliente = clientes.id); 

---consulta a view criada.
---SELECT * FROM CONSULTA_COMPLETA;



---criar view Consulta saldo por produto
CREATE VIEW SALDO AS (
SELECT 
    produtos.nome as produto,
	produtos.quantidade as quant_est, 
	itens.quantidade as quant_vend,
    sum(produtos.quantidade-itens.quantidade)as saldo
FROM 
    itens
JOIN 
    produtos ON itens.codigo_produto = produtos.codigo
JOIN 
    clientes ON itens.id_cliente = clientes.id 
group by itens.quantidade,produtos.nome,produtos.quantidade
	);


---seleciona as views que foram criadas...
---SELECT * FROM SALDO;
