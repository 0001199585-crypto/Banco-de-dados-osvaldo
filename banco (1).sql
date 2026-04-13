CREATE DATABASE SIS04T25;
USE SIS04T25;

-- CLIENTES
CREATE TABLE Clientes (
    ClienteID INT AUTO_INCREMENT PRIMARY KEY,
    NomeCliente VARCHAR(100),
    NomeContato VARCHAR(100),
    Cidade VARCHAR(50),
    Pais VARCHAR(50)
);

-- CATEGORIAS
CREATE TABLE Categorias (
    CategoriaID INT AUTO_INCREMENT PRIMARY KEY,
    NomeCategoria VARCHAR(100)
);

-- FUNCIONÁRIOS
CREATE TABLE Funcionarios (
    FuncionarioID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50),
    Sobrenome VARCHAR(50)
);

-- FORNECEDORES
CREATE TABLE Fornecedores (
    FornecedorID INT AUTO_INCREMENT PRIMARY KEY,
    NomeFornecedor VARCHAR(100),
    Cidade VARCHAR(50)
);

-- PRODUTOS
CREATE TABLE Produtos (
    ProdutoID INT AUTO_INCREMENT PRIMARY KEY,
    NomeProduto VARCHAR(100),
    FornecedorID INT,
    CategoriaID INT,
    Preco DECIMAL(10,2),
    FOREIGN KEY (FornecedorID) REFERENCES Fornecedores(FornecedorID),
    FOREIGN KEY (CategoriaID) REFERENCES Categorias(CategoriaID)
);

-- TRANSPORTADORAS
CREATE TABLE Transportadoras (
    TransportadoraID INT AUTO_INCREMENT PRIMARY KEY,
    NomeTransportadora VARCHAR(100)
);

-- PEDIDOS
CREATE TABLE Pedidos (
    PedidoID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    FuncionarioID INT,
    TransportadoraID INT,
    DataPedido DATE,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),
    FOREIGN KEY (FuncionarioID) REFERENCES Funcionarios(FuncionarioID),
    FOREIGN KEY (TransportadoraID) REFERENCES Transportadoras(TransportadoraID)
);

-- ITENS DO PEDIDO
CREATE TABLE ItensPedido (
    ItemPedidoID INT AUTO_INCREMENT PRIMARY KEY,
    PedidoID INT,
    ProdutoID INT,
    Quantidade INT,
    FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID),
    FOREIGN KEY (ProdutoID) REFERENCES Produtos(ProdutoID)
);