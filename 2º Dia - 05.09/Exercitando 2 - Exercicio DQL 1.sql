USE workshop;

SELECT COUNT(*) AS 'Contagem de Alunos na Rua 1' FROM aluno WHERE endereco='Rua 1';
-- ou
SELECT COUNT(*) AS 'Total de Alunos' FROM aluno;

SELECT AVG(rgm) AS 'A média da soma de todos RGM' FROM aluno;

SELECT MAX(rgm) AS 'O maior RGM dos nosso alunos' FROM aluno;

SELECT MIN(rgm) AS 'O menor RGM dos nossos alunos' FROM aluno;

SELECT endereco AS 'Endereço do Aluno', COUNT(*) AS 'Quantidade de Alunos' FROM aluno GROUP BY endereco ORDER BY endereco ASC;

SELECT TRIM(endereco) AS 'Endereço do Aluno', COUNT(*) AS 'Quantidade de Alunos' FROM aluno GROUP BY TRIM(endereco) HAVING COUNT(*) >= 2 ORDER BY COUNT(*) DESC;