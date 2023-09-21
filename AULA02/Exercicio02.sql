
CREATE DATABASE db_pizzaria_legal;


USE db_pizzaria_legal;


CREATE TABLE tb_categorias(
	Id BIGINT IDENTITY(1,1),
	Tipo VARCHAR(255) NOT NULL,
	Tamanho VARCHAR (255) NOT NULL,
	PRIMARY KEY(Id)
);

CREATE TABLE tb_pizzas(
	Id BIGINT IDENTITY(1,1),
	Nome VARCHAR(255)NOT NULL,
	Ingredientes INT,
	Massa VARCHAR(255)NOT NULL,
	Preco DECIMAL (4,2)NOT NULL,
	PRIMARY KEY(Id),
	Tipo_id BIGINT,
	FOREIGN KEY (Tipo_id) REFERENCES tb_categorias(Id)
);



INSERT INTO tb_categorias(Tipo, Tamanho)
VALUES ('Premium', 'Grande'), ('Premium', 'Média'), ('Normal', 'Grande'), ('Normal', 'Média'), ('Normal', 'Pequena');

alter TABLE tb_pizzas ALTER COLUMN Ingredientes VARCHAR(255)NOT NULL;
alter TABLE tb_pizzas ALTER COLUMN Preco DECIMAL (5,2)NOT NULL;

INSERT INTO tb_pizzas(Nome, Ingredientes, Massa, Preco, Tipo_id)
VALUES ('Aurora', 'quatro queijos', 'Crocante', 47.99, 1), ('Por do sol', 'Goibada com queijo', 'Crocante', 25.88, 2), ('Amanhecer', 'Presunto, milho e queijo', 'macia', 80.30, 3),
 ('Alvorada', 'Brigadeiro', 'macia', 49.30, 4), ('Arco Iris', 'Bacon com leite condensado', 'Crocante', 75.30, 5), ('Exotica', 'Salmão com nutella', 'Crocante', 99, 1),
 ('Adocicada', 'Brigadeiro, Nutella e Leite Condensado', 'Macia', 105.30, 3), ('Padrão', 'Frango com Catupiry', 'Crocante', 65.80, 5);

 SELECT tb_pizzas.Id, Nome, Ingredientes, Massa, Preco, Tipo_id, Tipo, Tamanho FROM tb_pizzas INNER JOIN tb_categorias
 ON tb_categorias.Id = tb_pizzas.Tipo_id;

  SELECT tb_pizzas.Id, Nome, Ingredientes, Massa, Preco, Tipo_id, Tipo, Tamanho FROM tb_pizzas INNER JOIN tb_categorias
 ON tb_categorias.Id = tb_pizzas.Tipo_id WHERE Tipo  = 'Premium';

 SELECT * FROM tb_pizzas WHERE Preco > 45;

 SELECT * FROM tb_pizzas WHERE Preco > 50.00 AND Preco < 100.00;  

 SELECT * FROM tb_pizzas WHERE Nome LIKE '%m%';