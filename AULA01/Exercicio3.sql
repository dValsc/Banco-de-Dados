CREATE DATABASE db_escola;

USE db_escola;

CREATE TABLE tb_alunos(
    Id BIGINT IDENTITY(1,1),
    Nome VARCHAR(255) NOT NULL,
    Idade INT,
    AnoEscolar VARCHAR(255) NOT NULL,
    NotaFinal DECIMAL (4,1)NOT NULL,
	Desempenho VARCHAR(255),
    PRIMARY KEY(Id)
);

INSERT INTO tb_alunos
(Nome, Idade, AnoEscolar, NotaFinal, Desempenho)
VALUES
('Aldo', 16, '1 ano', 8.5, 'bom'),
('Ana', 17, '2 ano', 4.5,'baixo'),
('Ana Luisa', 18, '3 ano', 5.5,'baixo'),
('Erica', 16, '1 ano', 6.5,'baixo'),
('Diego', 15, '1 ano', 7.5,'regular'),
('Lucas', 17, '2 ano', 8.5,'bom'),
('Felipe', 17, '3 ano', 9.0,'muito bom'),
('Luis', 18, '3 ano', 10.0,'muito bom');

SELECT * FROM tb_alunos;

SELECT * FROM tb_alunos WHERE NotaFinal > 7.0;

SELECT * FROM tb_alunos WHERE NotaFinal < 7.0;

UPDATE tb_alunos SET Idade = 18 WHERE Id = 2;

