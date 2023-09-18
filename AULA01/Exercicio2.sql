CREATE DATABASE db_ecommerce;

USE db_ecommerce;

CREATE TABLE tb_produtos(
    Id BIGINT IDENTITY(1,1),
    Nome VARCHAR(255) NOT NULL,
    Quantidade INT,
    DataCompra DATE,
    Preco DECIMAL (10,2)NOT NULL,
	Descrição VARCHAR(255),
    PRIMARY KEY(Id)
);

INSERT INTO tb_produtos
(Nome, Quantidade, DataCompra, Preco, Descrição)
VALUES
('Urso Roxo', 8, '2023-09-01', 200.00, 'urso de pelucia roxo'),
('Urso Rosa', 10, '2023-09-02', 215.00,'urso de pelucia rosa'),
('Urso Azul', 11, '2023-09-03', 280.00,'urso de pelucia azul'),
('Urso Marrom', 13, '2023-09-04', 340.00,'urso de pelucia marrom'),
('Urso Preto', 15, '2023-09-05', 375.00,'urso de pelucia preto'),
('Urso amarelo', 17, '2023-09-06', 600.00,'urso de pelucia premium amarelo'),
('Urso arco iris', 20, '2023-09-07', 700.00,'urso de pelucia premium arco iris'),
('Urso duplo arco iris', 25, '2023-09-08', 1000.00,'urso de pelucia premium duplo arco iris');

SELECT * FROM tb_produtos;

SELECT * FROM tb_produtos WHERE Preco > 500.00;

SELECT * FROM tb_produtos WHERE Preco < 500.00;

UPDATE tb_produtos SET Quantidade = 31 WHERE Id = 5;

