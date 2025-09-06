USE workshop;

-- Adicionando mais dados para que possa fazer a seleção do exercicio proposto!
INSERT INTO aluno VALUES
(5, 'Ana', 44455566600, 'ana@teste.com', 'Rua 1'),
(6, 'Pedro', 55566677700, 'pedro@email.com', 'Avenida Principal'),
(7, 'Maria', 66677788800, 'maria.silva@email.com', 'Rua 4'),
(8, 'Sofia', 77788899900, 'sofia@teste.com', 'Travessa B'),
(9, 'Lucas', 88899900000, 'lucas@email.com', 'Avenida Principal'),
(10, 'João', 99900011100, 'joao.souza@joao.com', 'Rua 5'),
(11, 'Laura', 10111213141, 'laura@teste.com', 'Rua 1'),
(12, 'Carlos', 12131415161, 'carlos@carlos.com', 'Rua 6'),
(13, 'Arthur', 13141516171, 'arthur.santos@teste.com', 'Rua 7'),
(14, 'Maria', 14151617181, 'maria.santos@maria.com', 'Rua 2'),
(15, 'Beatriz', 15161718191, 'beatriz@email.com', 'Avenida Principal');

SELECT * FROM aluno;

SELECT * FROM aluno WHERE rgm BETWEEN 5 AND 11;

SELECT * FROM aluno WHERE cpf LIKE '1%1';

SELECT * FROM aluno WHERE endereco IN ('Rua 1', 'Avenida Principal') ORDER BY endereco ASC;

