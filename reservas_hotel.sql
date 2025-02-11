-- Tabela de Clientes
CREATE TABLE Clientes (
    cliente_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100)
);

-- Tabela de Quartos
CREATE TABLE Quartos (
    quarto_id INT PRIMARY KEY AUTO_INCREMENT,
    numero INT NOT NULL,
    tipo ENUM('individual', 'duplo', 'suite') NOT NULL,
    status ENUM('livre', 'ocupado') DEFAULT 'livre'
);

-- Tabela de Reservas
CREATE TABLE Reservas (
    reserva_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    quarto_id INT,
    data_checkin DATE,
    data_checkout DATE,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id),
    FOREIGN KEY (quarto_id) REFERENCES Quartos(quarto_id)
);

-- Procedure para realizar reserva
DELIMITER //
CREATE PROCEDURE RealizarReserva(IN cliente_id INT, IN quarto_id INT, IN data_checkin DATE, IN data_checkout DATE)
BEGIN
    DECLARE disponibilidade ENUM('livre', 'ocupado');
    
    SELECT status INTO disponibilidade FROM Quartos WHERE quarto_id = quarto_id;
    
    IF disponibilidade = 'livre' THEN
        INSERT INTO Reservas (cliente_id, quarto_id, data_checkin, data_checkout)
        VALUES (cliente_id, quarto_id, data_checkin, data_checkout);
        
        UPDATE Quartos SET status = 'ocupado' WHERE quarto_id = quarto_id;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Quarto já ocupado';
    END IF;
END //
DELIMITER ;
