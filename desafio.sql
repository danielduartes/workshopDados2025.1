--Fábrica de Software 2025.1 - Análise de Dados--
		           Desafio SQL



--1. Crie um novo Schema com o nome DESAFIO

CREATE DATABASE desafio    


--2. Crie duas novas tabelas com pelo menos 4 colunas cada.   

USE desafio
CREATE TABLE DadosAlunos ( 
ID INT NOT NULL AUTO_INCREMENT, 
Nome VARCHAR(15) NOT NULL, 
Sobrenome VARCHAR(15) NOT NULL, 
Nascimento DATE,  
Sexo ENUM('M','F'),  
Peso DECIMAL(5,2), 
Altura DECIMAL(3,2), 
Nacionalidade VARCHAR(15) DEFAULT 'Brasil', 
Curso VARCHAR(15), 
Período ENUM('P1','P2','P3','P4','P5','P6','P7','P8','P9','P10','P11','P12'), 
PRIMARY KEY (id) 
 ) DEFAULT CHARSET = utf8mb4dadosalunos

CREATE TABLE Notas (
    ID_Nota INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Disciplina VARCHAR(20) NOT NULL, 
    Nota_A1 DECIMAL(2,1),
    Nota_A2 DECIMAL(2,1),,
    Projeto_Prático DECIMAL(2,1)
);


--3. Insira 10 novas linhas em cada tabela

INSERT INTO DadosAlunos
(Nome, Sobrenome, Nascimento, Sexo, Peso, Altura, Nacionalidade, Curso, Período)
VALUES
('Yasmin', 'Kaylane', '2007-05-08', 'F', '58.0', '1.68', 'Brasil', 'Medicina', 'P1'),
('Emanuel', 'Moreira', '2006-08-20', 'M', '85.0', '1.95', 'Brasil', 'Medicina', 'P3'),
('Marianna', 'Mendonça', '2007-01-20', 'F', '64.0', '1.55', 'Brasil', 'Direito', 'P1'),
('Lucas', 'Mendes', '2003-07-12', 'M', '75.7', '1.78', 'Chile', 'Engenharia', 'P3'),
('Ana', 'Oliveira', '2002-01-24', 'F', '60.4', '1.65', 'Argentina', 'Medicina', 'P4'),
('Carlos', 'Souza', '2004-05-05', 'M', '85.7', '1.82', 'Brasil', 'Psicologia', 'P2'),
('Beatriz', 'Lima', '2005-09-17', 'F', '62.3', '1.70', 'Espanha', 'Arquitetura', 'P1'),
('Rafael', 'Costa', '2006-03-02', 'M', '78.9', '1.80', 'Brasil', 'Direito', 'P1'),
('Juliana', 'Pereira', '2001-07-20', 'F', '54.6', '1.55', 'Colômbia', 'Filosofia', 'P5'), 
('Felipe', 'Rocha', '2007-11-07', 'M', '68.3', '1.76', 'Brasil', 'Biologia', 'P1');


INSERT INTO Notas
(ID_Nota, Disciplina, Nota_A1, Nota_A2, Projeto_Prático)
VALUES
('1', 'Anatomia', '2.5', '1.5', '2.5'),
('2', 'Bioquímica', '2.3', '1.2', '2.5'),
('3', 'Direito Digital', '2.4', '1.4', '2.4'),
('4', 'Cálculo Integral', '1.5', '0.9', '1.9'),
('5', 'Fisiologia', '1.8', '1.2', '2.1'),
('6', 'Psicopatologia', '1.3', '0.7', '1.7'),
('7', 'Desenho Técnico', '0.9', '1.4', '1.4'),
('8', 'Direito Agrário', '1.0', '0.8', '2.0'),
('9', 'Ética', '2.1', '1.5', ' 2.2'),
('10', 'Citologia', '1.4', '0.4', '1.2');


--4. Execute 3 ações de agregação

SELECT SUM(Nota_A1)
FROM notas

SELECT AVG(Nota_A2)
FROM notas

SELECT MAX(Projeto_Prático)
FROM notas

---------------------------------------
ALTER TABLE notas                     
CHANGE COLUMN ID_Nota ID VARCHAR(20)
---------------------------------------


--5. Execute 2 ações de agrupamentos

SELECT dadosalunos.Nome, dadosalunos.Sobrenome, dadosalunos.Nascimento, dadosalunos.Sexo, dadosalunos.Peso, dadosalunos.Altura, dadosalunos.Nacionalidade, dadosalunos.Curso, dadosalunos.Período, notas.ID, notas.Disciplina, notas.Nota_A1, notas.Nota_A2, notas.Projeto_Prático
FROM dadosalunos
INNER JOIN notas 
ON dadosalunos.ID = notas.ID;

SELECT Projeto_Prático, SUM(Nota_A1) AS Media_Nota_A1
FROM notas
GROUP BY Projeto_Prático;

---------------------
SELECT *
FROM dadosalunos 

SELECT *
FROM notas
---------------------