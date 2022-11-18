-- criação do banco de dados para o cenário E-commerce 
-- drop database ecommerce;
create database ecommerce; 
use ecommerce; 

-- criar as tabelas de: 
-- clientes
create table client (
	idClient int auto_increment primary key, 
    Fname varchar (10),
    Minit char (3),
	Lname varchar (20),
    CPF char (11) not null, 
    constraint unique_cpf_client unique (CPF),
    Address varchar (30)
);

alter table client auto_increment=1;
 
-- desc client;

-- produto 
-- size = dimensão do produto 
create table product (
	idProduct int auto_increment primary key, 
    Pname varchar (10),
    Categoria enum ("eletronico", "Vestimento", "Briquedos", "Alimentos", "Móveis", "Livros") not null,
	Avaliação float default 0,
    size varchar(10)
);
alter table product auto_increment =1;

-- pedido 
create table orders(
	idOrder int auto_increment primary key, 
    idOrderClient int,
    ordersdescription varchar(255),
    orderstatus enum ("Confirmado", "Cancelado", "Processando") default "Processando",
	sendValue float default 10,
    paymentcash bool default false, 
	constraint fk_order_client foreign key(IdOrderClient) references client(idClient)
);
 
alter table orders drop constraint fk_order_client;
alter table orders add constraint fk_order_client foreign key (IdOrderClient) references client(idClient);
alter table orders add constraint fk_product_orders foreign key (idOrder) references product(idProduct);
alter table orders auto_increment=1;



-- desc orders;

-- pagamento terminar de implementar a table e criar a conexão com as tabelas necessárias
-- criar constrains relacionadas ao pagamento
create table payment(
	idClient int, 
    id_payment int, 
    typepayment enum("Boleto", "Debito", "Crédito"),
    limitAvailable float,
    primary key (idClient, id_payment)
);
-- o refinamento fo realizado aqui para relacionar formas de pagamento e cliente
 alter table payment drop constraint fk_client_payment;
 alter table payment drop constraint fk_product_payment;
 alter table payment add constraint fk_client_payment foreign key (idClient) references orders(idOrderClient);
alter table payment add constraint fk_product_payment foreign key (id_payment) references orders(idOrder);
desc payment;
-- criar tabele estoque 
create table prodstorage(
	idProdStorage int auto_increment primary key, 
    LocationStorage varchar (20),
    quantity int default 0
);
alter table prodstorage add constraint fk_storage_product foreign key prodstorage(idProdStorage) references product(idProduct);
-- criar tabela forncedor 
create table supplier(
	idSupplier int auto_increment primary key, 
    SocialName varchar (255) not null,
    CNPJ char(15) not null, 
    contact char (11) not null, 
    constraint unique_supplier unique (CNPJ) 
);
alter table supplier auto_increment = 1;

-- desc supplier;
 -- criar tabela terceiro-vendendor 
create table seller(
	idSeller int auto_increment primary key, 
    SocialName varchar (255) not null,
    FantasyName varchar (50), 
    place varchar(255) not null, 
    CNPJ char(15),
    CPF char (9), 
    contact char (11) not null, 
    constraint unique_seller_cnpj unique (CNPJ), 
    constraint unique_seller_cpf unique (CPF)
);

-- desc seller;
-- desc productSeller;
create table productSeller(
	idPSeller int, 
    idPproduct int,
    prodQuantity int default 1, 
	primary key (idPSeller, idPproduct), 
    constraint fk_product_seller foreign key (idPseller) references seller(idSeller), 
    constraint fk_product_product foreign key (idPproduct) references product(idProduct)
); 
-- criar a tabela de storage location (tabela criada no relacionamento n para m )
create table storageLocation(
	idLproduct int, 
    idLstorage int, 
    location varchar(255) not null, 
    primary key (idLproduct, idLstorage),
    constraint fk_productstorage_seller foreign key (idLproduct) references product(idProduct),
    constraint fk_product_productstorage foreign key (idLstorage) references prodstorage(idProdStorage) 
);
-- criar a tabela de order de produto 
-- desc productOrder;
create table productOrder(
	idPOproduct int, 
    idPOorder int, 
    poQuantity int default 1, 
    poStatus enum("Disponível", "Sem estoque") default "Disponível", 
    primary key(idPOproduct, idPOorder), 
    constraint fk_productorder_seller foreign key (idPOproduct) references product(idProduct), 
    constraint fk_productorder_product foreign key (idPOorder) references orders(idOrder)

);
create table productSupplier(
	idPsSupplier int, 
    idPsProduct int, 
    quantity int not null, 
    primary key (idPsSupplier, idPsProduct),
    constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
    constraint fk_product_supplier_product foreign key (idPsProduct) references product(idProduct)
);
 -- esc productSupplier;

show tables;
-- show databases;