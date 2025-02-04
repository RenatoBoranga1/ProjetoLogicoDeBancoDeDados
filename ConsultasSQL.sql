Quantos pedidos foram feitos por cada cliente?
SELECT ClienteID, COUNT(PedidoID) AS NumeroPedidos
FROM Pedidos
GROUP BY ClienteID;

Algum vendedor também é fornecedor?
SELECT v.NomeVendedor, f.NomeFornecedor
FROM Vendedores v
JOIN Fornecedores f ON v.NomeVendedor = f.NomeFornecedor;

Relação de produtos fornecedores e estoques:
SELECT p.NomeProduto, f.NomeFornecedor, e.Quantidade
FROM Estoques e
JOIN Produtos p ON e.ProdutoID = p.ProdutoID
JOIN Fornecedores f ON e.FornecedorID = f.FornecedorID;


Relação de nomes dos fornecedores e nomes dos produtos:
SELECT f.NomeFornecedor, p.NomeProduto
FROM Fornecedores f
JOIN Estoques e ON f.FornecedorID = e.FornecedorID
JOIN Produtos p ON e.ProdutoID = p.ProdutoID;

