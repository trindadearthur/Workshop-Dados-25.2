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