USE SIS04T25;

-- CLIENTES
INSERT INTO Clientes (NomeCliente, NomeContato, Cidade, Pais) VALUES
('João Silva', 'Maria Silva', 'São Paulo', 'Brasil'),
('Ana Souza', 'Carlos Souza', 'Rio de Janeiro', 'Brasil'),
('Pedro Santos', 'Juliana Santos', 'Belo Horizonte', 'Brasil');

-- CATEGORIAS
INSERT INTO Categorias (NomeCategoria) VALUES
('Filmes'),
('Músicas'),
('Jogos');

-- FUNCIONÁRIOS
INSERT INTO Funcionarios (Nome, Sobrenome) VALUES
('Lucas', 'Oliveira'),
('Mariana', 'Costa'),
('Rafael', 'Almeida');

-- FORNECEDORES
INSERT INTO Fornecedores (NomeFornecedor, Cidade) VALUES
('Distribuidora Alpha', 'São Paulo'),
('Media Supply', 'Curitiba'),
('Global Filmes', 'Rio de Janeiro');

-- PRODUTOS
INSERT INTO Produtos (NomeProduto, FornecedorID, CategoriaID, Preco) VALUES
('DVD Vingadores', 1, 1, 29.90),
('CD Rock Nacional', 2, 2, 19.90),
('Jogo FIFA 24', 3, 3, 199.90);

-- TRANSPORTADORAS
INSERT INTO Transportadoras (NomeTransportadora) VALUES
('Correios'),
('Transportadora Rápida'),
('Logística Brasil');

-- PEDIDOS
INSERT INTO Pedidos (ClienteID, FuncionarioID, TransportadoraID, DataPedido) VALUES
(1, 1, 1, '2025-01-10'),
(2, 2, 2, '2025-02-15'),
(3, 3, 3, '2025-03-20');

