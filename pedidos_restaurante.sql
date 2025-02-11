-- Tabela de Produtos
CREATE TABLE Produtos (
    produto_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL
);

-- Tabela de Clientes
CREATE TABLE Clientes (
    cliente_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    telefone VARCHAR(20)
);

-- Tabela de Pedidos
CREATE TABLE Pedidos (
    pedido_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    data DATE,
    total DECIMAL(10, 2),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);

-- Tabela de Itens do Pedido
CREATE TABLE Itens_Pedido (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    pedido_id INT,
    produto_id INT,
    quantidade INT,
    FOREIGN KEY (pedido_id) REFERENCES Pedidos(pedido_id),
    FOREIGN KEY (produto_id) REFERENCES Produtos(produto_id)
);

-- Procedure para realizar pedido
DELIMITER //
CREATE PROCEDURE RealizarPedido(IN cliente_id INT, IN produto_id INT, IN quantidade INT)
BEGIN
    DECLARE preco DECIMAL(10, 2);
    DECLARE total DECIMAL(10, 2);
    
    SELECT preco INTO preco FROM Produtos WHERE produto_id = produto_id;
    
    INSERT INTO Pedidos (cliente_id, data, total)
    VALUES (cliente_id, CURDATE(), preco * quantidade);
    
    SET total = preco * quantidade;
    
    INSERT INTO Itens_Pedido (pedido_id, produto_id, quantidade)
    VALUES (LAST_INSERT_ID(), produto_id, quantidade);
END //
DELIMITER ;
