-- Americans Air | Banco de Dados | Filipe Victor

create database projeto_americanAir;
use projeto_americanAir;



create table clientes(
id_cliente int not null auto_increment primary key,
nome varchar (30) not null,
data_nascimento date,
sexo enum('M','F'),
nacionalidade varchar (30) default 'Brasil')default charset = utf8;

create table voo(
id_voo int not null auto_increment primary key,
modelo_aviao varchar(30) not null,
horario_de_embarque varchar(15) not null,
destino varchar (30))default charset = utf8;


-- Dados das tabelas
insert into clientes values
(default,'Francisco das Xagas','1999-07-02','M','Brasileiro'),
(default,'Cláudio Fontes','1988-03-12','M','Brasileiro'),
(default,'Eli Phillips','2000-12-14','M','Americano'),
(default,'Gregory Willians','1996-04-22','M','Inglês'),
(default,'Ana Amari','1982-07-03','F','Ârabe'),
(default,'Thales Miller','2003-11-23','M','Alemão'),
(default,'Willian Hernandes','1922-02-23','M','Mexicano'),
(default,'Stephanny Guerra','1977-07-12','F','Brasileiro'),
(default,'Jesse Cook','2002-12-25','F','Austrália'),
(default,'James Riverwood','1999-07-11','M','Inglaterra'),
(default,'Eliza Yamachiro','2000-03-21','F','Japão'),
(default,'Terry Rock','1933-07-08','M','EUA'),
(default,'Rita Rock','1935-10-05','F','EUA'),
(default,'Arold Winchester','1966-03-06','M','Tailândia'),
(default,'Francisca Pereira','1888-08-08','F','Brasileiro');

insert into voo values
(default,'Boeing 777-200ER','12:00 am','Japão','2022-11-12'),
(default,'Airbus A350-1000','7:00 pm','Espanha','2022-03-22'),
(default,'Boeing 747-8','15:30 pm','Alemanha','2022-06-09'),
(default,'Airbus A380','9:30 pm','Bolívia','2022-11-15'),
(default,'Boeing 777-200ER','1:00 am','Quatar','2022-07-22');

select*from voo;
select*from clientes;

desc clientes;

alter table clientes
add column id_voo_cliente int;

alter table clientes
add foreign key (id_voo_cliente)
references voo(id_voo);

select c.id_cliente, c.nome, c.data_nascimento, 
v.id_voo, v.horario_de_embarque, v.data_voo, v.modelo_aviao 
from clientes as c inner join voo as v 
on v.id_voo = c.id_voo_cliente
order by c.id_cliente;
