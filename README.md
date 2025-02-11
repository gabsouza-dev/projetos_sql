### 📌 **Projetos SQL**  
Este repositório contém cinco projetos desenvolvidos **somente com SQL**, incluindo criação de tabelas, procedures, triggers e views para diferentes sistemas de gerenciamento.  

## 📂 Estrutura de Arquivos  

```
projetos_sql/
│── biblioteca.sql          # Sistema de Gestão de Biblioteca  
│── reservas_hotel.sql      # Sistema de Reservas de Hotel  
│── controle_financeiro.sql # Controle Financeiro Pessoal  
│── pedidos_restaurante.sql # Sistema de Pedidos para Restaurante  
│── controle_estoque.sql    # Sistema de Controle de Estoque  
│── README.md               # Documentação dos projetos  
```

## 🚀 Como Usar  

1. **Crie um banco de dados** no seu SGBD favorito (MySQL, PostgreSQL, etc.).  
   ```sql
   CREATE DATABASE meu_banco;
   USE meu_banco;
   ```

2. **Importe o SQL desejado** no banco de dados.  
   ```
   mysql -u usuario -p meu_banco < nome_do_arquivo.sql
   ```

3. **Execute comandos SQL** para testar as tabelas e procedures.  

---

## 📋 Descrição dos Projetos  

### 📖 **1. Sistema de Gestão de Biblioteca** (`biblioteca.sql`)  
Gerencia livros, usuários e empréstimos. Possui procedures para registrar empréstimos e views para consultar disponibilidade.  

### 🏨 **2. Sistema de Reservas de Hotel** (`reservas_hotel.sql`)  
Gerencia quartos, clientes e reservas. Inclui procedures para check-in e check-out.  

### 💰 **3. Controle Financeiro Pessoal** (`controle_financeiro.sql`)  
Registra receitas e despesas, permitindo relatórios de movimentação financeira.  

### 🍽 **4. Sistema de Pedidos para Restaurante** (`pedidos_restaurante.sql`)  
Controla pedidos, clientes e produtos. Inclui procedures para calcular total de pedidos.  

### 📦 **5. Sistema de Controle de Estoque** (`controle_estoque.sql`)  
Gerencia produtos, fornecedores e transações de estoque. Inclui triggers para evitar estoque negativo.  

---

## 🛠 Tecnologias  
- SQL puro (MySQL/PostgreSQL compatível)  
- Procedures, Triggers, Views e Constraints  

📌 **Sinta-se à vontade para modificar e expandir os arquivos conforme necessário!** 🚀  

---
