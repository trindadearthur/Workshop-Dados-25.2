USE `Concessionaria VelozCar`;

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