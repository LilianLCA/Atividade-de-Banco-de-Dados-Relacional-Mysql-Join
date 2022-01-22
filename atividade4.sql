create database db_cidade_das_frutas;

use db_cidade_das_frutas; 

create table tb_categoria (
id_categoria bigint not null auto_increment,
legumes_verduras varchar (150) not null,
frutas varchar (150) not null,
temperos varchar (150) not null,
primary key (id_categoria)
);

insert into tb_categoria (legumes_verduras, frutas, temperos) values ("Couve", "Maçã", "Alho");
insert into tb_categoria (legumes_verduras, frutas, temperos) values ("Cenoura", "Melancia", "Coentro");
insert into tb_categoria (legumes_verduras, frutas, temperos) values ("Batata", "Laranja", "Pimenta");
insert into tb_categoria (legumes_verduras, frutas, temperos) values ("Vagem", "Limão", "Paprica Doce");
insert into tb_categoria (legumes_verduras, frutas, temperos) values ("Brócolis", "Mamão", "Ervas finas");

use db_cidade_das_frutas;

create table tb_produto (
id_produto bigint not null auto_increment,
nome varchar (100) not null, 
preco decimal (6,2) not null,
categoria varchar (100) not null, 
qtde_estoque int not null, 
ativo boolean not null,
primary key (id_produto),
fk_id_categoria bigint not null
); 
ALTER TABLE tb_produto MODIFY fk_id_categoria bigint NULL;

insert into tb_produto (nome, preco, categoria, qtde_estoque, ativo) values ("Couve", 3.99, "Legumes_Verduras", 10, true);
insert into tb_produto (nome, preco, categoria, qtde_estoque, ativo) values ("Maçã", 5.99, "Frutas", 20, true);
insert into tb_produto (nome, preco, categoria, qtde_estoque, ativo) values ("Alho", 10.99, "Temperos", 50, true);
insert into tb_produto (nome, preco, categoria, qtde_estoque, ativo) values ("Cenoura", 2.99, "Legumes_Verduras", 60, true);
insert into tb_produto (nome, preco, categoria, qtde_estoque, ativo) values ("Melancia", 10, "Frutas", 0, false);
insert into tb_produto (nome, preco, categoria, qtde_estoque, ativo) values ("Coentro", 1.99, "Temperos", 35, true);
insert into tb_produto (nome, preco, categoria, qtde_estoque, ativo) values ("Paprica Doce", 4.50, "Temperos", 0, false);
insert into tb_produto (nome, preco, categoria, qtde_estoque, ativo) values ("Mamão", 6.00, "Frutas", 6, true);

ALTER TABLE `tb_produto` ADD CONSTRAINT `tb_produto_fk0` FOREIGN KEY (`fk_id_categoria`) REFERENCES `tb_categoria`(`id_categoria`);

select * from tb_produto where preco > 50;
select * from tb_produto where preco between 3 and 60; 
select * from tb_produto where nome like "%C%";
select * from tb_produto where categoria = "Temperos";

select legumes_verduras, frutas, temperos from tb_categoria inner join tb_produto on id_produto = id_categoria;