CREATE DATABASE `Concessionaria VelozCar`;

USE `Concessionaria VelozCar`;

CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    endereco VARCHAR(255),
    telefone VARCHAR(20),
    email VARCHAR(100) NOT NULL UNIQUE,
    data_cadastro DATE
);

CREATE TABLE Veiculos (
    id_veiculo INT PRIMARY KEY AUTO_INCREMENT,
    placa VARCHAR(10) NOT NULL UNIQUE,
    modelo VARCHAR(50),
    cor VARCHAR(30),
    ano_fabricacao INT,
    valor_diaria DECIMAL(10, 2),
    `status` VARCHAR(20)
);

CREATE TABLE Funcionarios (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    cargo VARCHAR(50),
    data_admissao DATE,
    telefone VARCHAR(20),
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Alugueis (
    id_aluguel INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    id_veiculo INT,
    id_funcionario INT,
    data_inicio DATE,
    data_fim DATE,
    valor_total DECIMAL(10, 2),
    `status` VARCHAR(20),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_veiculo) REFERENCES Veiculos(id_veiculo),
    FOREIGN KEY (id_funcionario) REFERENCES Funcionarios(id_funcionario)
);

CREATE TABLE Pagamentos (
    id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    id_aluguel INT UNIQUE,
    valor DECIMAL(10, 2),
    data_pagamento DATE,
    metodo VARCHAR(20),
    `status` VARCHAR(20),
    FOREIGN KEY (id_aluguel) REFERENCES Alugueis(id_aluguel)
);

CREATE TABLE Manutencoes (
    id_manutencao INT PRIMARY KEY AUTO_INCREMENT,
    id_veiculo INT,
    descricao_servico TEXT,
    custo DECIMAL(10, 2),
    data_manutencao DATE,
    responsavel VARCHAR(100),
    FOREIGN KEY (id_veiculo) REFERENCES Veiculos(id_veiculo)
);

INSERT INTO Clientes (nome, cpf, endereco, telefone, email, data_cadastro) VALUES
('João Silva', '111.222.333-44', 'Rua A, 123, São Paulo', '11987654321', 'joao.silva@email.com', '2023-01-15'),
('Maria Souza', '222.333.444-55', 'Av. B, 456, Rio de Janeiro', '21987654321', 'maria.souza@email.com', '2023-02-20'),
('Pedro Almeida', '555.666.777-88', 'Travessa C, 789, Belo Horizonte', '31987654321', 'pedro.almeida@email.com', '2023-03-10'),
('Ana Costa', '888.999.000-11', 'Rua D, 101, Salvador', '71987654321', 'ana.costa@email.com', '2023-04-05'),
('Lucas Pereira', '123.456.789-10', 'Av. E, 212, Curitiba', '41987654321', 'lucas.pereira@email.com', '2023-05-12'),
('Juliana Santos', '109.876.543-21', 'Rua F, 313, Fortaleza', '85987654321', 'juliana.santos@email.com', '2023-06-18'),
('Marcos Oliveira', '234.567.890-12', 'Av. G, 414, Recife', '81987654321', 'marcos.oliveira@email.com', '2023-07-21'),
('Fernanda Lima', '345.678.901-23', 'Rua H, 515, Porto Alegre', '51987654321', 'fernanda.lima@email.com', '2023-08-02'),
('Ricardo Rocha', '456.789.012-34', 'Av. I, 616, Brasília', '61987654321', 'ricardo.rocha@email.com', '2023-09-09'),
('Patrícia Ribeiro', '567.890.123-45', 'Rua J, 717, Manaus', '92987654321', 'patricia.ribeiro@email.com', '2023-10-14'),
('Fábio Azevedo', '678.901.234-56', 'Av. K, 818, Goiânia', '62987654321', 'fabio.azevedo@email.com', '2023-11-25'),
('Camila Martins', '789.012.345-67', 'Rua L, 919, Belém', '91987654321', 'camila.martins@email.com', '2024-01-03'),
('Gustavo Borges', '890.123.456-78', 'Av. M, 1010, São Luís', '98987654321', 'gustavo.borges@email.com', '2024-02-07'),
('Sandra Nogueira', '901.234.567-89', 'Rua N, 1111, Natal', '84987654321', 'sandra.nogueira@email.com', '2024-03-11'),
('Thiago Mendes', '012.345.678-90', 'Av. O, 1212, Florianópolis', '48987654321', 'thiago.mendes@email.com', '2024-04-16');

INSERT INTO Veiculos (placa, modelo, cor, ano_fabricacao, valor_diaria, status) VALUES
('ABC-1234', 'Fiat Mobi', 'Branco', 2022, 120.00, 'disponível'),
('DEF-5678', 'Hyundai HB20', 'Prata', 2023, 150.00, 'alugado'),
('GHI-9012', 'Chevrolet Onix', 'Preto', 2022, 145.00, 'disponível'),
('JKL-3456', 'Jeep Renegade', 'Cinza', 2023, 250.00, 'em manutenção'),
('MNO-7890', 'Renault Kwid', 'Vermelho', 2021, 110.00, 'disponível'),
('PQR-1235', 'Volkswagen Gol', 'Branco', 2020, 100.00, 'disponível'),
('STU-6789', 'Fiat Argo', 'Prata', 2023, 160.00, 'alugado'),
('VWX-0123', 'Toyota Corolla', 'Preto', 2024, 300.00, 'disponível'),
('YZA-4567', 'Honda Civic', 'Cinza', 2023, 320.00, 'disponível'),
('BCD-8901', 'Hyundai Creta', 'Branco', 2022, 220.00, 'alugado'),
('EFG-2345', 'Chevrolet Tracker', 'Azul', 2023, 230.00, 'disponível'),
('HIJ-6789', 'Jeep Compass', 'Preto', 2024, 350.00, 'disponível'),
('KLM-0124', 'Renault Sandero', 'Prata', 2021, 130.00, 'em manutenção'),
('NOP-3457', 'Volkswagen T-Cross', 'Cinza', 2022, 240.00, 'disponível'),
('QRS-7891', 'Fiat Cronos', 'Vermelho', 2023, 170.00, 'alugado');

INSERT INTO Funcionarios (nome, cpf, cargo, data_admissao, telefone, email) VALUES
('Carlos Pereira', '333.444.555-66', 'Atendente', '2022-03-10', '11912345678', 'carlos.pereira@velozcar.com'),
('Ana Lima', '444.555.666-77', 'Gerente', '2021-08-01', '21912345678', 'ana.lima@velozcar.com'),
('Roberto Dias', '111.000.222-33', 'Atendente', '2023-01-20', '31912345678', 'roberto.dias@velozcar.com'),
('Sofia Barros', '222.111.333-44', 'Supervisor', '2022-05-15', '41912345678', 'sofia.barros@velozcar.com'),
('Daniel Farias', '333.222.444-55', 'Mecânico Chefe', '2020-11-01', '51912345678', 'daniel.farias@velozcar.com'),
('Laura Peixoto', '444.333.555-66', 'Atendente', '2023-06-30', '61912345678', 'laura.peixoto@velozcar.com'),
('Bruno Gomes', '555.444.666-77', 'Auxiliar Administrativo', '2022-09-05', '71912345678', 'bruno.gomes@velozcar.com'),
('Helena Andrade', '666.555.777-88', 'Atendente', '2024-02-12', '81912345678', 'helena.andrade@velozcar.com'),
('Igor Carvalho', '777.666.888-99', 'Gerente de Frota', '2021-02-18', '85912345678', 'igor.carvalho@velozcar.com'),
('Vanessa Teles', '888.777.999-00', 'Recepcionista', '2023-11-08', '91912345678', 'vanessa.teles@velozcar.com'),
('Otávio Ramos', '999.888.000-11', 'Manobrista', '2022-07-22', '92912345678', 'otavio.ramos@velozcar.com'),
('Larissa Cunha', '000.999.111-22', 'Atendente', '2023-03-14', '98912345678', 'larissa.cunha@velozcar.com'),
('Douglas Matos', '121.232.343-45', 'Mecânico Auxiliar', '2023-08-20', '62912345678', 'douglas.matos@velozcar.com'),
('Beatriz Neves', '232.343.454-56', 'Analista Financeiro', '2022-01-10', '84912345678', 'beatriz.neves@velozcar.com'),
('Rodrigo Justo', '343.454.565-67', 'Gerente Geral', '2019-05-01', '48912345678', 'rodrigo.justo@velozcar.com');

INSERT INTO Alugueis (id_cliente, id_veiculo, id_funcionario, data_inicio, data_fim, valor_total, status) VALUES
(1, 2, 1, '2024-05-01', '2024-05-05', 600.00, 'finalizado'),
(2, 7, 3, '2024-05-02', '2024-05-07', 800.00, 'finalizado'),
(3, 10, 6, '2024-05-10', '2024-05-15', 1100.00, 'ativo'),
(4, 15, 8, '2024-05-11', '2024-05-14', 510.00, 'ativo'),
(5, 1, 1, '2024-05-12', '2024-05-19', 840.00, 'ativo'),
(6, 3, 3, '2024-04-20', '2024-04-25', 725.00, 'atrasado'),
(7, 5, 6, '2024-05-14', '2024-05-16', 220.00, 'ativo'),
(8, 6, 8, '2024-05-05', '2024-05-08', 300.00, 'finalizado'),
(9, 8, 12, '2024-05-15', '2024-05-20', 1500.00, 'ativo'),
(10, 9, 1, '2024-04-15', '2024-04-18', 960.00, 'finalizado'),
(11, 11, 3, '2024-05-18', '2024-05-22', 920.00, 'ativo'),
(12, 12, 6, '2024-05-01', '2024-05-06', 1750.00, 'finalizado'),
(13, 14, 8, '2024-04-28', '2024-05-02', 960.00, 'atrasado'),
(14, 1, 12, '2024-05-20', '2024-05-25', 600.00, 'ativo'),
(15, 3, 1, '2024-05-21', '2024-05-24', 435.00, 'ativo');

INSERT INTO Pagamentos (id_aluguel, valor, data_pagamento, metodo, status) VALUES
(1, 600.00, '2024-05-01', 'cartão', 'concluído'),
(2, 800.00, '2024-05-02', 'pix', 'concluído'),
(3, 1100.00, '2024-05-10', 'cartão', 'concluído'),
(4, 510.00, NULL, 'pix', 'pendente'),
(5, 840.00, '2024-05-12', 'boleto', 'concluído'),
(6, 725.00, NULL, 'cartão', 'pendente'),
(7, 220.00, '2024-05-14', 'pix', 'concluído'),
(8, 300.00, '2024-05-05', 'cartão', 'concluído'),
(9, 1500.00, NULL, 'boleto', 'pendente'),
(10, 960.00, '2024-04-15', 'pix', 'concluído'),
(11, 920.00, NULL, 'cartão', 'pendente'),
(12, 1750.00, '2024-05-01', 'boleto', 'concluído'),
(13, 960.00, NULL, 'cartão', 'cancelado'),
(14, 600.00, '2024-05-20', 'pix', 'concluído'),
(15, 435.00, NULL, 'boleto', 'pendente');

INSERT INTO Manutencoes (id_veiculo, descricao_servico, custo, data_manutencao, responsavel) VALUES
(1, 'Troca de óleo e filtro', 250.00, '2024-03-10', 'Oficina Parceira'),
(2, 'Alinhamento e balanceamento', 180.00, '2024-02-15', 'Daniel Farias'),
(3, 'Revisão completa de 20.000km', 600.00, '2024-04-01', 'Oficina Parceira'),
(4, 'Troca de pastilhas de freio', 450.00, '2024-05-08', 'Daniel Farias'),
(5, 'Troca de pneus', 1200.00, '2024-01-20', 'Fornecedor Pneus Top'),
(6, 'Revisão do sistema de ar condicionado', 350.00, '2023-12-05', 'Daniel Farias'),
(7, 'Troca de óleo', 220.00, '2024-03-25', 'Douglas Matos'),
(8, 'Reparo na pintura (pequeno arranhão)', 300.00, '2024-04-12', 'Funilaria Express'),
(9, 'Inspeção geral pré-venda (hipotético)', 150.00, '2024-02-28', 'Igor Carvalho'),
(10, 'Troca de bateria', 400.00, '2024-05-02', 'Auto Elétrica Rápida'),
(11, 'Revisão de suspensão', 550.00, '2024-03-18', 'Oficina Parceira'),
(12, 'Limpeza e higienização interna', 200.00, '2024-04-22', 'Estética Automotiva Clean'),
(13, 'Troca de correia dentada', 800.00, '2024-05-10', 'Daniel Farias'),
(14, 'Manutenção preventiva geral', 400.00, '2024-02-01', 'Douglas Matos'),
(15, 'Troca de fluido de freio', 150.00, '2024-01-30', 'Oficina Parceira');

UPDATE Alugueis SET status = 'finalizado' WHERE id_aluguel = 3;
UPDATE Veiculos SET status = 'disponível' WHERE id_veiculo = (SELECT id_veiculo FROM Alugueis WHERE id_aluguel = 3);

UPDATE Pagamentos 
SET status = 'concluído', data_pagamento = CURDATE() 
WHERE id_pagamento = 4;

SET SQL_SAFE_UPDATES = 0;

UPDATE Veiculos
SET valor_diaria = valor_diaria * 1.10
WHERE modelo LIKE '%Jeep%' OR modelo LIKE '%Creta%' OR modelo LIKE '%Tracker%' OR modelo LIKE '%T-Cross%';

SET SQL_SAFE_UPDATES = 1;

UPDATE Funcionarios
SET cargo = 'Supervisor de Atendimento', email = 'laura.peixoto.sup@velozcar.com'
WHERE id_funcionario = 6;

UPDATE Veiculos
SET status = 'disponível'
WHERE placa = 'JKL-3456';

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