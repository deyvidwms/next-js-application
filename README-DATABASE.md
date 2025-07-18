# 🐳 Docker PostgreSQL para My App

Este projeto utiliza Docker para rodar um banco de dados PostgreSQL.

## 🚀 Como usar

### 1. Iniciar o banco de dados
```bash
docker-compose up -d
```

### 2. Parar o banco de dados
```bash
docker-compose down
```

### 3. Reiniciar o banco de dados
```bash
docker-compose restart
```

### 4. Ver logs do banco
```bash
docker-compose logs postgres
```

### 5. Conectar ao banco via psql
```bash
docker-compose exec postgres psql -U myapp_user -d myapp_db
```

## 🔧 Configuração

### Variáveis de ambiente
O arquivo `.env.local` contém as configurações do banco:
- **DATABASE_URL**: URL completa de conexão
- **POSTGRES_DB**: Nome do banco de dados
- **POSTGRES_USER**: Usuário do banco
- **POSTGRES_PASSWORD**: Senha do banco
- **POSTGRES_HOST**: Host do banco (localhost)
- **POSTGRES_PORT**: Porta do banco (5432)

### Porta
O PostgreSQL estará disponível na porta **5432**.

### Dados iniciais
O arquivo `docker/postgres/init.sql` contém:
- Criação de tabelas de exemplo
- Inserção de dados de teste
- Criação de índices

## 📊 Conectar com ferramentas externas

Você pode conectar com ferramentas como:
- **pgAdmin**: http://localhost:5432
- **DBeaver**: Host: localhost, Port: 5432
- **VS Code Extensions**: PostgreSQL explorer

### Credenciais:
- **Host**: localhost
- **Port**: 5432
- **Database**: myapp_db
- **Username**: myapp_user
- **Password**: myapp_password

## 🗃️ Volumes

Os dados do banco são persistidos no volume `postgres_data`, então seus dados não serão perdidos quando o container for parado.

## 🔄 Comandos úteis

### Resetar o banco (apagar todos os dados)
```bash
docker-compose down -v
docker-compose up -d
```

### Backup do banco
```bash
docker-compose exec postgres pg_dump -U myapp_user myapp_db > backup.sql
```

### Restaurar backup
```bash
docker-compose exec -T postgres psql -U myapp_user myapp_db < backup.sql
```
