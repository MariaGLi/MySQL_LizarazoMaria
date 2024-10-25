CREATE DATABASE Librería_del_Mundo_de_Sofía; -- Crear una base de datos

USE Librería_del_Mundo_de_Sofía; -- Utilizar mi BBDD

CREATE TABLE Clientes(idClientes INT NOT NULL auto_increment primary KEY,
Nombre_cliente varchar(45) not null,
Apellido_cliente varchar(45) not null,
Direccion_cliente varchar(45) not null,
Email_cliente varchar(45) not null,
Telefono_cliente INT not null
);
describe Clientes;