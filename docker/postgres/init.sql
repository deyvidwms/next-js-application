-- Script de inicialização do banco de dados
-- Este arquivo será executado quando o container for criado pela primeira vez

-- Criar algumas tabelas de exemplo (opcional)
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Inserir dados de exemplo (opcional)
INSERT INTO users (name, email) VALUES 
    ('João Silva', 'joao@example.com'),
    ('Maria Santos', 'maria@example.com')
ON CONFLICT (email) DO NOTHING;

-- Criar índices
CREATE INDEX IF NOT EXISTS idx_users_email ON users(email);

-- Exibir informações do banco
SELECT 'Banco de dados inicializado com sucesso!' AS message;
