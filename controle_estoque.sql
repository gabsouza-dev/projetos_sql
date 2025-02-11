-- Tabela de Produtos
CREATE TABLE Produtos (
    produto_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    quantidade INT DEFAULT 0
);

-- Tabela de Fornecedores
CREATE TABLE Fornecedores (
    fornecedor_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    telefone VARCHAR(20)
);

-- Tabela de Transações de Estoque
CREATE TABLE Transacoes (
    transacao_id INT PRIMARY KEY AUTO_INCREMENT,
    produto_id INT,
    quantidade INT,
    tipo ENUM('entrada', 'saida') NOT NULL,
    data DATE,
    fornecedor_id INT,
    FOREIGN KEY (produto_id) REFERENCES Produtos(produto_id),
    FOREIGN KEY (fornecedor_id) REFERENCES Fornecedores(fornecedor_id)
);

-- Procedure para registrar entrada de produto
DELIMITER //
CREATE PROCEDURE RegistrarEntrada(IN produto_id INT, IN quantidade INT, IN fornecedor_id INT)
BEGIN
    UPDATE Produtos SET quantidade = quantidade + quantidade WHERE produto_id = produto_id;
    
    INSERT INTO Transacoes (produto_id, quantidade, tipo, data, fornecedor_id)
    VALUES (produto_id, quantidade, 'entrada', CURDATE(), fornecedor_id);
END //
DELIMITER ;
