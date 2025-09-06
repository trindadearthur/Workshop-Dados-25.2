USE workshop;

INSERT INTO aluno VALUES 
(1, 'Arthur', 12345678900,'teste@teste.com', 'Rua 1'),
(2, 'Maria', 11122233300, 'maria@maria.com', 'Rua 2'),
(3, 'João', 3332221100, 'joao@joao.com', 'Rua feia'),
(4, 'Claúdio', 22211133300, 'claudio@claudio', 'Rua 4');

UPDATE aluno SET endereco = 'Rua 3' WHERE rgm=3;

DELETE FROM aluno WHERE rgm=4;