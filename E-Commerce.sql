CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Tipo VARCHAR(10) -- PJ ou PF
);

CREATE TABLE Pedidos (
    PedidoID INT PRIMARY KEY,
    ClienteID INT,
    DataPedido DATE,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

CREATE TABLE Produtos (
    ProdutoID INT PRIMARY KEY,
    NomeProduto VARCHAR(100),
    Preco DECIMAL(10, 2)
);

CREATE TABLE Fornecedores (
    FornecedorID INT PRIMARY KEY,
    NomeFornecedor VARCHAR(100)
);

CREATE TABLE Vendedores (
    VendedorID INT PRIMARY KEY,
    NomeVendedor VARCHAR(100)
);

CREATE TABLE Estoques (
    EstoqueID INT PRIMARY KEY,
    ProdutoID INT,
    FornecedorID INT,
    Quantidade INT,
    FOREIGN KEY (ProdutoID) REFERENCES Produtos(ProdutoID),
    FOREIGN KEY (FornecedorID) REFERENCES Fornecedores(FornecedorID)
);

CREATE TABLE Pagamentos (
    PagamentoID INT PRIMARY KEY,
    PedidoID INT,
    MetodoPagamento VARCHAR(50),
    FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID)
);

CREATE TABLE Entregas (
    EntregaID INT PRIMARY KEY,
    PedidoID INT,
    StatusEntrega VARCHAR(50),
    CodigoRastreamento VARCHAR(50),
    FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID)
);
