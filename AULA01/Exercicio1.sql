CREATE DATABASE db_rh;

USE db_rh;

CREATE TABLE tb_funcionario(
    Id BIGINT IDENTITY(1,1),
    Nome VARCHAR(255) NOT NULL,
    Idade INT,
    Dataaniver DATE,
    Salario DECIMAL (6,2)NOT NULL,
	Email VARCHAR(255) NOT NULL,
    PRIMARY KEY(Id)
);

INSERT INTO tb_funcionario
(Nome, Idade, Dataaniver, Salario, Email)
VALUES
('Pedro', 21, '2002-09-25', 1000.00, 'pedro@hotmail.com'),
('Miguel', 25, '1998-08-25', 2000.00,'miguel@hotmail.com'),
('Rafael', 35, '1988-04-25', 3000.00,'rafael@hotmail.com'),
('Dario', 38, '1985-11-25', 4000.00,'dario@hotmail.com'),
('Erick', 56, '1967-01-25', 5000.00, 'erick@hotmail.com');

SELECT * FROM tb_funcionario;

SELECT * FROM tb_funcionario WHERE Salario > 2000.00;

SELECT * FROM tb_funcionario WHERE Salario < 2000.00;

UPDATE tb_funcionario SET Salario = 9000.00 WHERE Id = 5;


