
CREATE DATABASE db_farmacia_bem_estar;


USE db_farmacia_bem_estar;


CREATE TABLE tb_categorias(
	Id BIGINT IDENTITY(1,1),
	Tipo VARCHAR(255) NOT NULL,
	Opcao VARCHAR (255) NOT NULL,
	PRIMARY KEY(Id)
);

CREATE TABLE tb_produtos(
	Id BIGINT IDENTITY(1,1),
	Nome VARCHAR(255)NOT NULL,
	Quantidade INT,
	Descricao VARCHAR(255)NOT NULL,
	Preco DECIMAL (4,2)NOT NULL,
	PRIMARY KEY(Id),
	Tipo_id BIGINT,
	FOREIGN KEY (Tipo_id) REFERENCES tb_categorias(Id)
);



INSERT INTO tb_categorias(Tipo, Opcao)
VALUES ('Maquiagem', 'Rosto'), ('Maquiagem', 'Acessorios'), ('Medicamento', 'febre'), ('Medicamento', 'Insonia'), ('Higiene', 'HigieneDiaria');

INSERT INTO tb_produtos(Nome, Quantidade, Descricao, Preco, Tipo_id)
VALUES ('Creme', 1, 'facial', 47.99, 1), ('Esponja', 2, 'Aplicar base', 6.00, 2), ('Dipirona', 3, 'Analgésico', 25.88, 3),
 ('Seakalm', 10,'Maracuja',  59.30, 4), ('Shampoo', 2,'Elvive', 75.30, 5), ('Batom',  4,'Vermelho', 99, 1),
 ('Pinça', 1, 'Sobrancelha', 10.30, 2), ('Condicionador', 2, 'Livia', 25.80, 5);

 SELECT tb_produtos.Id, Nome, Descricao, Quantidade, Preco, Tipo_id, Tipo, Opcao  FROM tb_produtos INNER JOIN tb_categorias
 ON tb_categorias.Id = tb_produtos.Tipo_id;

  SELECT tb_produtos.Id, Nome, Descricao, Quantidade, Preco, Tipo_id, Tipo, Opcao  FROM tb_produtos INNER JOIN tb_categorias
 ON tb_categorias.Id = tb_produtos.Tipo_id WHERE Tipo  = 'Maquiagem';

 SELECT * FROM tb_produtos WHERE Preco > 50;

 SELECT * FROM tb_produtos WHERE Preco > 5.00 AND Preco < 60.00;  

 SELECT * FROM tb_produtos WHERE Nome LIKE '%c%';