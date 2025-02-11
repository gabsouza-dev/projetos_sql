-- Tabela de Categorias
CREATE TABLE Categorias (
    categoria_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL
);

-- Tabela de Movimentações (Receitas e Despesas)
CREATE TABLE Movimentacoes (
    movimentacao_id INT PRIMARY KEY AUTO_INCREMENT,
    categoria_id INT,
    tipo ENUM('receita', 'despesa') NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    data DATE,
    FOREIGN KEY (categoria_id) REFERENCES Categorias(categoria_id)
);

-- Procedure para adicionar movimentação
DELIMITER //
CREATE PROCEDURE AdicionarMovimentacao(IN categoria_id INT, IN tipo VARCHAR(10), IN valor DECIMAL(10, 2), IN data DATE)
BEGIN
    INSERT INTO Movimentacoes (categoria_id, tipo, valor, data)
    VALUES (categoria_id, tipo, valor, data);
END //
DELIMITER ;
