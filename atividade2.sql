create database db_pizzaria_legal;

use db_pizzaria_legal;

create table tb_categoria (
id bigint auto_increment,
tipo varchar (50) not null, 
tamanho varchar (50) not null,
bebidas varchar (50) not null,
primary key (id)
);
insert into tb_categoria (tipo, tamanho, bebidas) values ("Pizza Doce", "Pequena", "Coca-Cola");
insert into tb_categoria (tipo, tamanho, bebidas) values ("Pizza Salgada", "Grande", "Sprit");
insert into tb_categoria (tipo, tamanho, bebidas) values ("Brotinho", "Médio", "Guaraná");
insert into tb_categoria (tipo, tamanho, bebidas) values ("Pizza Doce", "Média", "Suco de Uva");
insert into tb_categoria (tipo, tamanho, bebidas) values ("Pizza Salgada", "Grande", "Cerveja"); 

use db_pizzaria_legal;

create table tb_pizza (
id bigint auto_increment,
id_categoria bigint,
nome varchar (100) not null,
tipo varchar (50) not null, 
tamanho varchar (50) not null,
preco decimal (4,2) not null,
retirar_no_local boolean not null,
primary key (id),
constraint fk_id_categoria foreign key (id_categoria) references tb_categoria (id)
);

insert into tb_pizza (nome, tipo, tamanho, preco, retirar_no_local) values ("Atum", "Pizza Salgada", "Grande", 45.00, false);
insert into tb_pizza (nome, tipo, tamanho, preco, retirar_no_local) values ("Baiana", "Pizza Salgada", "Média", 39.00, false);
insert into tb_pizza (nome, tipo, tamanho, preco, retirar_no_local) values ("Caipira", "Pizza Salgada", "Pequena", 42.00, false);
insert into tb_pizza (nome, tipo, tamanho, preco, retirar_no_local) values ("Carne Seca", "Pizza Salgada", "Grande", 51.00, true);
insert into tb_pizza (nome, tipo, tamanho, preco, retirar_no_local) values ("Dois Queijos", "Pizza Salgada", "Média", 41.00, true);
insert into tb_pizza (nome, tipo, tamanho, preco, retirar_no_local) values ("Cheddar", "Brotinho", "Pequena", 29.00, true);
insert into tb_pizza (nome, tipo, tamanho, preco, retirar_no_local) values ("Chocolate com Uva", "Pizza Doce", "Média", 52.00, false);
insert into tb_pizza (nome, tipo, tamanho, preco, retirar_no_local) values ("Romeu e Julieta", "Pizza Doce", "Grande", 60.00, true);

select * from tb_pizza where preco > 45;

select * from tb_pizza where preco between 29 and 60;

select * from tb_pizza where nome like "C%";

select bebidas from tb_categoria inner join tb_pizza on tb_pizza.id = tb_categoria.id;

select * from tb_pizza where tipo = "Pizza Salgada";