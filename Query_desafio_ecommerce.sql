use ecommerce;
desc client;
select * from client;
select * from product;
select * from orders;
select * from productOrder;

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