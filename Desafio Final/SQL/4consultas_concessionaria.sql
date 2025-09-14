USE `Concessionaria VelozCar`;

SELECT
    status AS 'Status do Veículo',
    COUNT(id_veiculo) AS 'Quantidade'
FROM
    Veiculos
GROUP BY
    status
ORDER BY
    'Quantidade' DESC;
    
SELECT
    YEAR(data_inicio) AS 'Ano',
    MONTHNAME(data_inicio) AS 'Mês',
    FORMAT(SUM(valor_total), 2, 'de_DE') AS 'Faturamento Total (R$)'
FROM
    Alugueis
GROUP BY
    YEAR(data_inicio),
    MONTH(data_inicio),
    MONTHNAME(data_inicio)
ORDER BY
    'Ano', MONTH(data_inicio);
    
    SELECT
    V.placa AS 'Placa',
    V.modelo AS 'Modelo do Veículo',
    COUNT(M.id_manutencao) AS 'Nº de Manutenções',
    FORMAT(AVG(M.custo), 2, 'de_DE') AS 'Custo Médio por Serviço (R$)',
    FORMAT(SUM(M.custo), 2, 'de_DE') AS 'Custo Total (R$)'
FROM
    Manutencoes M
JOIN
    Veiculos V ON M.id_veiculo = V.id_veiculo
GROUP BY
    V.placa, V.modelo
ORDER BY
    SUM(M.custo) DESC;
    
    SELECT
    metodo AS 'Método de Pagamento',
    COUNT(id_pagamento) AS 'Quantidade de Transações',
    FORMAT(SUM(valor), 2, 'de_DE') AS 'Valor Total Transacionado (R$)'
FROM
    Pagamentos
WHERE
    status = 'concluído'
GROUP BY
    metodo
ORDER BY
    'Quantidade de Transações' DESC;
    
SELECT
    A.id_aluguel AS 'ID Aluguel',
    C.nome AS 'Cliente',
    C.telefone AS 'Contato do Cliente',
    V.modelo AS 'Veículo',
    V.placa AS 'Placa',
    F.nome AS 'Funcionário Responsável',
    DATE_FORMAT(A.data_inicio, '%d/%m/%Y') AS 'Data de Início',
    DATE_FORMAT(A.data_fim, '%d/%m/%Y') AS 'Data de Término',
    FORMAT(A.valor_total, 2, 'de_DE') AS 'Valor (R$)'
FROM
    Alugueis A
INNER JOIN Clientes C ON A.id_cliente = C.id_cliente
INNER JOIN Veiculos V ON A.id_veiculo = V.id_veiculo
INNER JOIN Funcionarios F ON A.id_funcionario = F.id_funcionario
WHERE
    A.status = 'ativo';
    
SELECT
    C.nome AS 'Nome do Cliente',
    C.email AS 'E-mail',
    DATE_FORMAT(C.data_cadastro, '%d/%m/%Y') AS 'Data de Cadastro',
    IFNULL(DATE_FORMAT(MAX(A.data_inicio), '%d/%m/%Y'), 'Nunca alugou') AS 'Último Aluguel'
FROM
    Clientes C
LEFT JOIN Alugueis A ON C.id_cliente = A.id_cliente
GROUP BY
    C.id_cliente, C.nome, C.email, C.data_cadastro
ORDER BY
    MAX(A.data_inicio) DESC, C.data_cadastro DESC;
    
SELECT
    C.nome AS 'Cliente Devedor',
    C.telefone AS 'Contato',
    A.id_aluguel AS 'ID do Aluguel',
    FORMAT(P.valor, 2, 'de_DE') AS 'Valor Pendente (R$)',
    DATE_FORMAT(A.data_fim, '%d/%m/%Y') AS 'Data de Devolução'
FROM
    Alugueis A
RIGHT JOIN Pagamentos P ON A.id_aluguel = P.id_aluguel
LEFT JOIN Clientes C ON A.id_cliente = C.id_cliente
WHERE
    P.status = 'pendente';
    
SELECT
    V.placa AS 'Placa',
    V.modelo AS 'Modelo',
    V.ano_fabricacao AS 'Ano',
    V.status AS 'Status Atual'
FROM
    Veiculos V
LEFT JOIN Manutencoes M ON V.id_veiculo = M.id_veiculo
WHERE
    M.id_manutencao IS NULL;
    
SELECT
    C.nome AS 'Cliente',
    C.email AS 'E-mail',
    A.id_aluguel AS 'ID Aluguel',
    V.modelo AS 'Veículo Alugado',
    V.placa AS 'Placa',
    DATE_FORMAT(A.data_inicio, '%d/%m/%Y') AS 'Data Início',
    DATE_FORMAT(A.data_fim, '%d/%m/%Y') AS 'Data Fim',
    FORMAT(A.valor_total, 2, 'de_DE') AS 'Valor do Aluguel (R$)',
    P.status AS 'Status do Pagamento',
    P.metodo AS 'Método de Pagamento'
FROM
    Alugueis A
JOIN Clientes C ON A.id_cliente = C.id_cliente
JOIN Veiculos V ON A.id_veiculo = V.id_veiculo
LEFT JOIN Pagamentos P ON A.id_aluguel = P.id_aluguel
WHERE
    C.id_cliente = 6 
ORDER BY
    A.data_inicio DESC;