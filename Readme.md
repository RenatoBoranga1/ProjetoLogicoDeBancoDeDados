# Descrição do Projeto E-commerce

## Descrição do Projeto
Este projeto tem como objetivo criar um banco de dados para o cenário de e-commerce, incluindo a modelagem lógica, a criação do script SQL e a implementação de queries complexas.

## Objetivo
- Replique a modelagem do projeto lógico de banco de dados para o cenário de e-commerce.
- Crie um esquema do banco de dados utilizando um script SQL.
- Realize a persistência de dados para testes.
- Desenvolva queries SQL complexas para análise dos dados.

## Entidades e Relacionamentos

## Clientes
Armazena informações dos clientes, incluindo nome e tipo (PJ ou PF).

## Pedidos
Armazena informações dos pedidos realizados pelos clientes, incluindo a data do pedido.

## Produtos
Armazena informações dos produtos disponíveis no e-commerce, incluindo nome e preço.

## Fornecedores
Armazena informações dos fornecedores dos produtos.

## Vendedores
Armazena informações dos vendedores.

## Estoques
Armazena informações sobre o estoque dos produtos, incluindo a quantidade disponível.

## Pagamentos
Armazena informações sobre os métodos de pagamento utilizados nos pedidos.

## Entregas
Armazena informações sobre o status da entrega e o código de rastreamento.

## Script SQL
```sql
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Tipo VARCHAR(10)
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
```

## Consultas SQL

## Quantos pedidos foram feitos por cada cliente?
```sql
SELECT ClienteID, COUNT(PedidoID) AS NumeroPedidos
FROM Pedidos
GROUP BY ClienteID;
```

## Algum vendedor também é fornecedor?
```sql
SELECT v.NomeVendedor, f.NomeFornecedor
FROM Vendedores v
JOIN Fornecedores f ON v.NomeVendedor = f.NomeFornecedor;
```

## Relação de produtos, fornecedores e estoques:
```sql
SELECT p.NomeProduto, f.NomeFornecedor, e.Quantidade
FROM Estoques e
JOIN Produtos p ON e.ProdutoID = p.ProdutoID
JOIN Fornecedores f ON e.FornecedorID = f.FornecedorID;
```

## Relação de nomes dos fornecedores e nomes dos produtos:
```sql
SELECT f.NomeFornecedor, p.NomeProduto
FROM Fornecedores f
JOIN Estoques e ON f.FornecedorID = e.FornecedorID
JOIN Produtos p ON e.ProdutoID = p.ProdutoID;
```

