--criar uma base de dados com o nome db_quitanda
CREATE DATABASE db_generation_game_online;

-- colocar a base de dados db_quitanda em uso
USE db_generation_game_online;

-- criar a tabela tb_classes
CREATE TABLE tb_classes(
	Id BIGINT IDENTITY(1,1),
	Classe VARCHAR(255) NOT NULL,
	Nivel VARCHAR (255) NOT NULL,
	PRIMARY KEY(Id)
);

--criar uma tabela com chave estrangeira onde a foreign Key indica a chave estrangeira e a References indica a tabela que esta sendo relacionada
CREATE TABLE tb_personagens(
	Id BIGINT IDENTITY(1,1),
	Nome VARCHAR(255)NOT NULL,
	Ataque INT,
	Defesa INT,
	Adereco VARCHAR(255)NOT NULL,
	PRIMARY KEY(Id),
	classe_id BIGINT,
	FOREIGN KEY (classe_id) REFERENCES tb_classes(Id)
);

-- Insere dados na tabela tb_categorias
INSERT INTO tb_classes(Classe, Nivel)
VALUES ('Arqueiro', 'Iniciante'), ('Ninfa', 'Avançado'), ('Mago', 'Intermediário'), ('Ninja', 'Iniciante'), ('Gnomo', 'Ultimate');

-- Insere dados na tabela tb_produtos
INSERT INTO tb_personagens (Nome, Ataque, Defesa, Adereco, classe_id)
VALUES ('Cora', 1000, 1060, 'Capa', 2), ('Dante', 2010, 1001, 'Flecha de fogo', 1), ('Elfy', 3000, 1010, 'Bola de fumaça', 5),
 ('Morgue', 100, 2050, 'Foice', 4), ('Miro', 5000, 1085, 'Cajado', 3), ('Almy', 1500, 7000, 'Coroa Aniquiladora', 2),
 ('Taz', 1000, 100, 'Poções', 1), ('Volt', 4060, 3000, 'Espelho mágico', 5);


--visualizar a tabela criada - produtos
SELECT * FROM tb_classes;

--visualizar a tabela categorias
SELECT * FROM tb_personagens;

 --retornar os dados das tabelas relacionadas utilizando critério inner (apenas dados relacionados)
 SELECT tb_personagens.Id,Nome, Ataque, Defesa, Adereco, Nivel, classe_id, Classe FROM tb_personagens INNER JOIN tb_classes
 ON tb_classes.Id = tb_personagens.classe_id;

  SELECT tb_personagens.Id,Nome, Ataque, Defesa, Adereco, classe_id, Classe, Nivel  
 FROM tb_classes INNER JOIN tb_personagens
 ON tb_classes.Id = tb_personagens.classe_id WHERE classe_id  = 1;

 SELECT * FROM tb_personagens WHERE Ataque > 2000;

 SELECT * FROM tb_personagens WHERE Defesa > 1000 AND Defesa< 2000;

 SELECT * FROM tb_personagens WHERE Nome LIKE '%c%';



 