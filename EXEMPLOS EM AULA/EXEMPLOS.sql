--criar uma base de dados com o nome db_quitanda
CREATE DATABASE db_quitanda;

-- colocar a base de dados db_quitanda em uso
USE db_quitanda;

-- criar a tabela categorias
CREATE TABLE tb_categorias(
	Id BIGINT IDENTITY(1,1),
	Descricao VARCHAR(255) NOT NULL,
	PRIMARY KEY(Id)
);

--criar uma tabela com chave estrangeira onde a foreign Key indica a chave estrangeira e a References indica a tabela que esta sendo relacionada
CREATE TABLE tb_produtos(
	Id BIGINT IDENTITY(1,1),
	nome VARCHAR(255)NOT NULL,
	quantidade INT,
	dtvalidade DATE,
	preco DECIMAL (6,2),
	PRIMARY KEY(Id),
	categoria_id BIGINT,
	FOREIGN KEY (categoria_id) REFERENCES tb_categorias(Id)
);

-- Insere dados na tabela tb_categorias
INSERT INTO tb_categorias (Descricao)
VALUES ('Frutas'), ('Verduras'), ('Legumes'), ('Temperos'), ('Ovos'), ('outros');


--visualizar a tabela criada - produtos
SELECT * FROM tb_produtos;

--visualizar a tabela categorias
SELECT * FROM tb_categorias;

-- Insere dados na tabela tb_produtos
INSERT INTO tb_produtos (Nome, quantidade, dtvalidade, Preco, categoria_id)
VALUES ('Maçã', 1000, '2022-03-07', 1.99, 1), ('Abacate', 45, '2023-09-22', 5.25, 1),
 ('Banana', 1300, '2022-03-08', 5.00, 1),
 ('Batata doce', 2000, '2022-03-09', 10.00, 3),
 ('Alface', 300, '2022-03-10', 7.00, 2),
 ('Cebola', 1020, '2022-03-08', 5.00, 3),
 ('Ovo Branco', 1000, '2022-03-07', 15.00, 5),
 ('Agrião', 1500, '2022-03-06', 3.00, 2),
 ('Cenoura', 1800, '2022-03-09', 3.50, 3),
 ('Pimenta', 1100, '2022-03-15', 10.00, 4),
 ('Alecrim', 130, '2022-03-10', 5.00, 4),
 ('Manga', 200, '2022-03-07', 5.49, 1),
 ('Laranja', 3000, '2022-03-13', 10.00, 1);

 --retornar os dados das tabelas relacionadas utilizando critério inner (apenas dados relacionados)
 SELECT tb_produtos.Id,nome, quantidade, dtvalidade, preco, categoria_id,
 Descricao FROM tb_produtos INNER JOIN tb_categorias
 ON tb_categorias.Id = tb_produtos.categoria_id;

  --retornar os dados das tabelas relacionadas utilizando critério LEFT (usa como peso a tabela do lado esquerdo do palavra Join no caso a tb_categoria)
 SELECT tb_produtos.Id,nome, quantidade, dtvalidade, preco, categoria_id,
 Descricao 
 FROM tb_categorias LEFT JOIN tb_produtos
 ON tb_categorias.Id = tb_produtos.categoria_id;

 INSERT INTO tb_produtos (Nome, Quantidade, Preco)
VALUES('Panela', 1118, 150.80);

  --retornar os dados das tabelas relacionadas utilizando critério RIGHT (usa como peso a tabela do lado direito do palavra Join no caso a tb_produtos)
SELECT tb_produtos.Id,nome, quantidade, dtvalidade, preco, categoria_id,
 Descricao 
 FROM tb_categorias RIGHT JOIN tb_produtos
 ON tb_categorias.Id = tb_produtos.categoria_id 
 WHERE nome like '%n%' ORDER BY tb_categorias.Id ASC
  ;

  --consulta simples da tabela produtos
SELECT * FROM tb_produtos;

--consulta com dados ordenados pelo preço (crescente)
SELECT * FROM tb_produtos ORDER BY Preco ASC;

--consulta com dados ordenados pelo preço (decrescente)
SELECT * FROM tb_produtos ORDER BY Preco DESC;

--consulta com dados com critério id diferente de 1
SELECT * FROM tb_produtos WHERE NOT id = 1;

--consulta com dados com critério id diferente de 1
SELECT * FROM tb_produtos WHERE  id != 1;

--consulta com dados intervalo dos valores do campo Preco nos valores 5 2 e 8
SELECT * FROM tb_produtos 
WHERE Preco IN(5,2,8)  ORDER BY nome ASC;

--consulta com dados intervalo dos valores do campo Preco entre os intervalos de 5 a 15
SELECT * FROM tb_produtos WHERE Preco BETWEEN 5 AND 15;

--consulta com campo nome que contem a letra a no inicio do campo nome
SELECT * FROM tb_produtos WHERE Nome LIKE 'a%';

--consulta com campo nome que contem a letra a no final do campo nome
SELECT * FROM tb_produtos WHERE Nome LIKE '%a';

--consulta com campo nome que contem a letra no campo nome
SELECT * FROM tb_produtos WHERE Nome LIKE '%a%';

-- selecionar todas as colunas do banco de dados onde o id = 1
SELECT * FROM tb_produtos WHERE Id = 1;

-- selecionar todas as colunas do banco de dados onde o Nome = 'banana'
SELECT * FROM tb_produtos WHERE Nome = 'banana';

-- selecionar apenas as colunas nome, quantidade e preco da tabela onde o nome = 'banana'
SELECT Nome, Quantidade, Preco FROM tb_produtos WHERE Nome = 'banana';

-- selecionar utilizando um critério ou o outro (ou id = 1 ou id = 2 ou id =3)
SELECT * FROM tb_produtos WHERE Id = 1 OR Id = 2 OR Id = 3;

--selecionar utilizando os dois critérios como verdadeiro preco > que 4 e também Menor que 10
SELECT * FROM tb_produtos WHERE preco >4 AND preco< 10;

-- alterar a tabela tb_produtos a coluna preco ter formato Decimal (6,2) seus caracteres e 2 casas após o ponto
alter TABLE tb_produtos ALTER COLUMN preco DECIMAL(6,2); 

-- selecionar todas as colunas do banco de dados onde o id = 1
SELECT * FROM tb_produtos WHERE Id = 1;

-- selecionar todas as colunas do banco de dados onde o Nome = 'banana'
SELECT * FROM tb_produtos WHERE Nome = 'banana';

-- selecionar apenas as colunas nome, quantidade e preco da tabela onde o nome = 'banana'
SELECT Nome, Quantidade, Preco FROM tb_produtos WHERE Nome = 'banana';

-- selecionar utilizando um critério ou o outro (ou id = 1 ou id = 2 ou id =3)
SELECT * FROM tb_produtos WHERE Id = 1 OR Id = 2 OR Id = 3;

--selecionar utilizando os dois critérios como verdadeiro preco > que 4 e também Menor que 10
SELECT * FROM tb_produtos WHERE preco >4 AND preco< 10;

-- alterar a tabela tb_produtos a coluna preco ter formato Decimal (6,2) seus caracteres e 2 casas após o ponto
alter TABLE tb_produtos ALTER COLUMN preco DECIMAL(6,2); 


INSERT INTO tb_produtos
(Nome, Quantidade, DataValidade, Preco)
VALUES
('Milho', 20, '2023-09-18',10.25);

--alterar a estrutura da tabela adicionando a coluna Descrição no formato VARCHAR tamanho 255
ALTER TABLE tb_produtos ADD Descricao VARCHAR(255);

-- atualizar os dados da tabela no campo Descricao onde o id = 7
UPDATE tb_produtos SET Descricao = 'Milho verde natural' WHERE id = 7;

-- deletar a linha de id 5 da tabela tb_produtos
DELETE FROM tb_produtos WHERE Id = 5;

-- esse select tem os nomes das colunas tratados 
SELECT Nome as 'Nome do produto', Descricao as 'Descrição'  From tb_produtos;

-- apagar uma tabela do banco de dados em uso
DROP TABLE tb_produtos;

--apagar o banco de dados (não pode estar em uso)
DROP DATABASE db_quitanda; 