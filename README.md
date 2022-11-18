# Desafio_de_Projeto_Ecommerce

## Nesse desafio foi construído um banco de dados do zero de um ecommerce

### Observou-se o relacionamento entre as entidades e realizados alguns comandos como alter table, order by, group By, entre outros.

### Realizações das querys:

```use ecommerce;
desc client;
select * from client;
select * from product;
select * from orders;
select * from productOrder;
```

![Produto/Cliente](https://github.com/gillrosas/Desafio_de_Projeto_Ecommerce/blob/main/produtos%20por%20clientes.PNG)

```
-- Produtos por clientes
select Fname, Pname from client, product;

-- algum vendendor is fornecedor
select distinct v.SocialName, f.SocialName  from supplier as v, seller as f
      where (v.SocialName=f.SocialName);
select * from seller;


-- relação entre produtos forncedores e estoque 
select * from product;
select * from supplier;
select * from prodstorage;

select Pname, SocialName, quantity from product, supplier, prodstorage
group by SocialName, Pname;

-- nomes dos fornecedores e nome do produtos 
select * from productSeller;
select SocialName as Nome_Fornecedor, Pname from seller, productSeller, product 
		where idPproduct = idProduct;
        
        
-- utilizando order by
select * from client
order by Fname;

-- utilizando Having 
select * from product 
having Pname = "Chocolate";
```
