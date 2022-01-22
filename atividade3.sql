create database db_farmacia_do_bem;

use db_farmacia_do_bem;

CREATE TABLE `tb_produto` (
	`id_produto` bigint NOT NULL AUTO_INCREMENT,
	`nome` varchar(255) NOT NULL,
	`preco` DECIMAL NOT NULL,
	`data_registro` DATE NOT NULL,
	`qtde_estoque` int NOT NULL,
	`ativo` BOOLEAN NOT NULL,
	`fk_id_categoria` bigint NOT NULL,
	PRIMARY KEY (`id_produto`)
);

ALTER TABLE tb_produto DROP ativo;

ALTER TABLE tb_produto ADD categoria varchar(100);

insert into tb_produto (nome, preco, data_registro, qtde_estoque, ativo) values ("Dorflex", 18.99, '2022-01-01', 89, true);
insert into tb_produto (nome, preco, data_registro, qtde_estoque, ativo) values ("Rimel", 27.83, '2022-01-02', 3, true);
insert into tb_produto (nome, preco, data_registro, qtde_estoque, ativo) values ("Pasta de dente", 2.89, '2021-01-03', 200, true);
insert into tb_produto (nome, preco, data_registro, qtde_estoque, ativo) values ("Bromoprida", 7.80, '2021-01-04', 156, true);
insert into tb_produto (nome, preco, data_registro, qtde_estoque, ativo) values ("Blush", 38.00, '2022-01-05', 19, true);
insert into tb_produto (nome, preco, data_registro, qtde_estoque, ativo) values ("Escova de cabelo", 20.00, '2021-01-06', 13, true);
insert into tb_produto (nome, preco, data_registro, qtde_estoque, ativo) values ("Vitaminas", 69.80, '2021-01-07', 40, true);
insert into tb_produto (nome, preco, data_registro, qtde_estoque, ativo) values ("Base", 72.00, '2022-01-08', 0, false);

UPDATE tb_produto SET categoria = "Remédios" WHERE id_produto = 1;
UPDATE tb_produto SET categoria = "Maquiagem" WHERE id_produto = 2;
UPDATE tb_produto SET categoria = "Prod_hig_pessoal" WHERE id_produto = 3;
UPDATE tb_produto SET categoria = "Remédios" WHERE id_produto = 4;
UPDATE tb_produto SET categoria = "Maquiagem" WHERE id_produto = 5;
UPDATE tb_produto SET categoria = "Prod_hig_pessoal" WHERE id_produto = 6;
UPDATE tb_produto SET categoria = "Remédios" WHERE id_produto = 7;
UPDATE tb_produto SET categoria = "Maquiagem" WHERE id_produto = 8;

ALTER TABLE tb_produto MODIFY fk_id_categoria bigint NULL;

CREATE TABLE `tb_categoria` (
	`id_categoria` bigint NOT NULL AUTO_INCREMENT,
	`remedios` varchar(255) NOT NULL,
	`maquiagem` varchar(255) NOT NULL,
	`prod_hig_pessoal` varchar(255) NOT NULL,
	PRIMARY KEY (`id_categoria`)
);
ALTER TABLE `tb_produto` ADD CONSTRAINT `tb_produto_fk0` FOREIGN KEY (`fk_id_categoria`) REFERENCES `tb_categoria`(`id_categoria`);

insert into tb_categoria (remedios, maquiagem, prod_hig_pessoal) values ("Dorflex", "Rimel", "Pasta de dente");
insert into tb_categoria (remedios, maquiagem, prod_hig_pessoal) values ("Nelsadina", "Batom", "Sabonete");
insert into tb_categoria (remedios, maquiagem, prod_hig_pessoal) values ("Bromoprida", "Blush", "Escova de cabelo");
insert into tb_categoria (remedios, maquiagem, prod_hig_pessoal) values ("Benegripe", "Corretivo", "Absorvente");
insert into tb_categoria (remedios, maquiagem, prod_hig_pessoal) values ("Vitaminas", "Base", "Creme de corpo");

select * from tb_produto where preco > 50;
select * from tb_produto where preco between 3 and 60; 
select * from tb_produto where nome like "%B%";
select * from tb_produto where categoria = "Maquiagem";
select remedios, maquiagem, prod_hig_pessoal from tb_categoria inner join tb_produto on id_produto = id_categoria;

ALTER TABLE tb_produto MODIFY preco decimal(4,2);

