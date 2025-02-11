-- Tabela de Livros
CREATE TABLE Livros (
    livro_id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(255) NOT NULL,
    ano_publicacao INT,
    status ENUM('disponível', 'emprestado') DEFAULT 'disponível'
);

-- Tabela de Usuários
CREATE TABLE Usuarios (
    usuario_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    endereco VARCHAR(255),
    telefone VARCHAR(20)
);

-- Tabela de Empréstimos
CREATE TABLE Emprestimos (
    emprestimo_id INT PRIMARY KEY AUTO_INCREMENT,
    livro_id INT,
    usuario_id INT,
    data_emprestimo DATE,
    data_devolucao DATE,
    FOREIGN KEY (livro_id) REFERENCES Livros(livro_id),
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(usuario_id)
);

-- Procedure para registrar empréstimo
DELIMITER //
CREATE PROCEDURE RegistrarEmprestimo(IN livro_id INT, IN usuario_id INT)
BEGIN
    DECLARE disponibilidade ENUM('disponível', 'emprestado');
    
    SELECT status INTO disponibilidade FROM Livros WHERE livro_id = livro_id;
    
    IF disponibilidade = 'disponível' THEN
        INSERT INTO Emprestimos (livro_id, usuario_id, data_emprestimo)
        VALUES (livro_id, usuario_id, CURDATE());
        
        UPDATE Livros SET status = 'emprestado' WHERE livro_id = livro_id;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Livro já emprestado';
    END IF;
END //
DELIMITER ;
