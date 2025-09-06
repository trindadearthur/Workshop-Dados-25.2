CREATE DATABASE desafio;

USE desafio;

CREATE TABLE Livro (
id_livro INT PRIMARY KEY,
autor_id INT,
nome_livro VARCHAR(100) NOT NULL,
preco DEC(5,2) NOT NULL,
editora VARCHAR (100) NOT NULL,
edicao INT NOT NULL,
capa VARCHAR(10) CHECK (capa IN ('Dura','Normal')),
FOREIGN KEY (autor_id) REFERENCES Autor(id_autor)
);

CREATE TABLE Autor (
id_autor INT PRIMARY KEY,
nome_autor VARCHAR(100) NOT NULL,
nacionalidade VARCHAR(20) NOT NULL,
avaliacao DEC(3,1) NOT NULL DEFAULT 5.0 CHECK (avaliacao BETWEEN 0.0 AND 10.0)
);

INSERT INTO Autor  VALUES
(1, 'Machado de Assis', 'Brasileiro', 9.8), (2, 'J.K. Rowling', 'Britânico', 9.5),
(3, 'Stephen King', 'Americano', 9.2), (4, 'Clarice Lispector', 'Brasileiro', 9.7),
(5, 'George Orwell', 'Britânico', 9.4), (6, 'Yuval Noah Harari', 'Israelense', 9.6),
(7, 'J.R.R. Tolkien', 'Britânico', 9.9), (8, 'Isaac Asimov', 'Americano', 9.3),
(9, 'Agatha Christie', 'Britânico', 9.1), (10, 'Cecília Meireles', 'Brasileiro', 9.0),
(11, 'Haruki Murakami', 'Japonês', 8.8), (12, 'Gabriel García Márquez', 'Colombiano', 9.5),
(13, 'Jorge Amado', 'Brasileiro', 8.9), (14, 'Carlos Drummond', 'Brasileiro', 9.2),
(15, 'Jane Austen', 'Britânico', 8.7), (16, 'Edgar Allan Poe', 'Americano', 9.0),
(17, 'Fernando Pessoa', 'Português', 9.4), (18, 'Virginia Woolf', 'Britânico', 8.6),
(19, 'Simone de Beauvoir', 'Francês', 9.3), (20, 'Fiódor Dostoiévski', 'Russo', 9.8);


INSERT INTO Livro (id_livro, autor_id, nome_livro, preco, editora, edicao, capa) VALUES
(1, 1, 'Dom Casmurro', 45.50, 'Companhia das Letras', 3, 'Normal'), (2, 2, 'Harry Potter e a Pedra Filosofal', 59.90, 'Rocco', 1, 'Dura'),
(3, 3, 'It - A Coisa', 89.90, 'Suma', 2, 'Dura'), (4, 4, 'A Hora da Estrela', 39.90, 'Rocco', 5, 'Normal'),
(5, 5, '1984', 52.80, 'Companhia das Letras', 1, 'Normal'), (6, 6, 'Sapiens: Uma Breve História da Humanidade', 75.00, 'L&PM', 1, 'Dura'),
(7, 7, 'O Senhor dos Anéis: A Sociedade do Anel', 99.50, 'HarperCollins', 4, 'Dura'), (8, 8, 'Eu, Robô', 65.00, 'Aleph', 2, 'Normal'),
(9, 9, 'O Assassinato no Expresso do Oriente', 49.90, 'HarperCollins', 1, 'Normal'), (10, 10, 'Romanceiro da Inconfidência', 42.00, 'Global Editora', 6, 'Normal'),
(11, 1, 'Memórias Póstumas de Brás Cubas', 48.00, 'Antofágica', 2, 'Dura'), (12, 3, 'O Iluminado', 78.60, 'Suma', 1, 'Dura'),
(13, 7, 'O Hobbit', 68.90, 'HarperCollins', 3, 'Normal'), (14, 5, 'A Revolução dos Bichos', 35.50, 'Companhia das Letras', 2, 'Normal'),
(15, 2, 'Harry Potter e a Câmara Secreta', 62.90, 'Rocco', 1, 'Dura'), (16, 6, 'Homo Deus: Uma Breve História do Amanhã', 79.90, 'Companhia das Letras', 1, 'Dura'),
(17, 13, 'Capitães da Areia', 55.00, 'Companhia das Letras', 8, 'Normal'), (18, 16, 'O Corvo e Outros Contos', 44.90, 'Darkside', 1, 'Dura'),
(19, 12, 'Cem Anos de Solidão', 85.00, 'Record', 4, 'Normal'), (20, 15, 'Orgulho e Preconceito', 51.00, 'Martin Claret', 3, 'Normal');

SELECT 
    *
FROM
    Livro
ORDER BY autor_id ASC;


DELETE FROM Livro 
WHERE
    autor_id = 5;


SELECT 
    *
FROM
    Livro
WHERE
    autor_id = 5;


SELECT 
    *
FROM
    Livro
WHERE
    autor_id BETWEEN 3 AND 6
ORDER BY autor_id ASC;


SELECT 
    AVG(l.preco) AS 'Valor Médio dos Livros'
FROM
    Livro AS l;
    

SELECT 
    MAX(l.preco) AS 'Maior Valor de Livro'
FROM
    Livro AS l;
-- ou
SELECT 
    nome_livro AS 'Nome do Livro de Maior Valor',
    preco AS 'Preço do Livro'
FROM
    Livro
WHERE
    preco = (SELECT 
            MAX(preco)
        FROM
            Livro);
            

SELECT 
    MIN(l.preco) AS 'Menor Valor de Livro'
FROM
    Livro AS l;
-- ou
SELECT 
    nome_livro AS 'Nome do Livro de Menor Valor',
    preco AS 'Preço do Livro'
FROM
    Livro
WHERE
    preco = (SELECT 
            MIN(preco)
        FROM
            Livro);
            

SELECT 
    autor_id, COUNT(id_livro)
FROM
    Livro
GROUP BY autor_id;


SELECT 
    preco, COUNT(preco)
FROM
    Livro
GROUP BY preco
HAVING preco > 40.00;


SELECT 
    COUNT(id_livro) AS 'Total de Livros entre 20,00 e 40,00'
FROM
    Livro
WHERE
    preco BETWEEN 20.00 AND 40.00;
    

SELECT 
    a.nome_autor AS 'Nome do Autor',
    COUNT(l.id_livro) AS 'Total de Livros'
FROM
    Autor AS a
        JOIN
    Livro AS l ON a.id_autor = l.autor_id
GROUP BY a.nome_autor
ORDER BY 'Total de Livros' DESC;