use ecommerce;
desc client;
show tables;
desc client;
delete from client;
-- 1
insert into client (idClient, Fname, Minit, Lname, CPF, Address) 
					values(1, "Gillane", "R", "Batista", "10489745831", " Nova Cidade"),
						  (2, "Mateus", "C", "Souza", "13572755534", "Nova Cidade"),
                          (3, "Ricardo", "L", "Silva", "34512789012", " Nova Cidade"),
                          (4, "Olivia", "R", "Cantora", "62784529013", " Nova Cidade"),
                          (5, "Taylor", "R", "Swift", "19895640931", "  Nova Cidade"),
                          (6, "Gabriela", "D", "Melim", "38941834827", "Nova Cidade");
select * from client;
-- 2
insert into product (idProduct,Pname, Categoria, Avaliação, size) 
				values(1,"Fone", "eletronico", "4", null),
					  (2,"Boneca ", "Briquedos", "3", null),
                      (3,"Blusa", "Vestimento", "4", null),
                      (4,"Chocolate", "Alimentos", "5", null),
                      (5,"Mesa ", "Móveis", "5", null),
                      (6,"Livro", "Livros", "5", null);
select * from product;

desc orders;
-- 3
insert into orders(idOrder,idOrderClient, ordersdescription, orderstatus, sendValue, paymentcash)
			values( 1, 1,"compra via aplicativo","Confirmado", 34.0,1),
                  ( 2, 2,"compra via aplicativo","Processando", 50.0,0),
				  ( 3, 3, "compra site" , "Confirmado", 13.0,1),
                  ( 4, 4, "compra site", "Processando",150.0,0),
			      ( 5, 5,"compra site", "Processando", 13.0,0),
                  ( 6, 6, "compra via aplicativo","Processando", 23.5,0);
-- Delete from orders;

select * from orders;
desc payment;
-- 4
insert into payment(idClient, id_payment,typepayment,limitAvailable) 
			values (1, 1, "Boleto", 105),
				   (2, 2, "Debito", 134.50),
				   (3, 3, "Credito",359),
                   (4, 4, "Debito", 150),
                   (5, 5, "Debito",359),
                   (6,6,"Boleto",267);
select * from payment;
select * from Seller;

desc Seller;
-- 5
insert into Seller(idSeller, Socialname,FantasyName, place, CNPJ, CPF,contact)
			values(1,"LF company","Loja Sorriso","Rua A, 189 -Vila Velha","327894278190293",null, "983467647"),
                  (2,"DP story","Armarinho legal","Rua 4, 89 -Vila Mari ","957575278190293",null, "9846258371"),
                  (3,"Glauber Lira","Pessoalmente","Rua ouro, SN -Djalma Batista",null,"92846290", "95378947");
desc productSeller;
select * from productSeller;
-- 6
insert into productSeller(idPSeller,IdPproduct,prodQuantity)
            values(1, 1, 27),
	              (2, 2, 59),
                  (3, 3, 9);
desc prodstorage;
select * from prodstorage;
-- 7
insert into prodstorage(idProdStorage,LocationStorage,quantity) 
			values(1,"Rua 1- Nova Deli",34),
				  (2,"Rua 4- Cidade Nova",89),
                  (3,"Rua M Distrito 4",23),
                  (4,"Rua Mundo- Flores",5),
                  (5,"Rua 1- Parque L",21),
                  (6,"Rua Alta- Nova Deli",67);
show tables;

-- 6 
desc supplier;
insert into supplier(idSupplier, SocialName, CNPJ, contact) 
			values(1, "Silva Silva",127384903758353, 92998456734),
                  (2, "Romero Lima",345367833758942, 92996473902),
                  (3, "Souza Silva",647389275648920, 92998453672);
                  
-- 7
desc storageLocation;
select * from storageLocation;
insert into storageLocation(idLproduct, idLstorage, location) 
					values(1,1, "Nova Deli"),
				  (2,2,"Rua 4- Cidade Nova"),
                  (3,3,"Rua M Distrito 4"),
                  (4,4,"Rua Mundo- Flores"),
                  (5,5,"Rua 1- Parque L"),
                  (6,6,"Rua Alta- Nova Deli");
-- 8 
desc productOrder;
select * from productOrder;
insert into productOrder (idPOproduct,idPOorder,poQuantity, poStatus) 
	  values(1,1,10,"Disponível"),
            (2,2,78,"Disponível"),
            (3,3,5,"Disponível"),
            (4,4,23,"Disponível"),
            (5,5,5,"Disponível"),
            (6,6,8,"Disponível");
-- 9
desc productSupplier;
select * from productSupplier;
insert into productSupplier (idPsSupplier, idPsProduct, quantity) 
			values(1,1,10),
                  (2,2,45),
                  (3,3,10);