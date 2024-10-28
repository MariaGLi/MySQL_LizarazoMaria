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

CREATE TABLE Clientes_has_Pedidos(
idClientes INT NOT NULL,
idPedidos INT NOT NULL,
foreign key (idClientes) references Clientes (idClientes),
foreign key (idPedidos) references Pedidos (idPedidos)
);
describe Clientes_has_Pedidos;

CREATE TABLE Pedidos(idPedidos INT NOT NULL auto_increment primary KEY,
Fecha_pedido INT not null,
Hora_pedido INT not null,
Estado_pedido varchar(45) not null,
Cantidad_pedido INT not null,
idVentas INT not null,
foreign key (idVentas) references Ventas (idVentas)
);
describe Pedidos;

CREATE TABLE Ventas(idVentas INT NOT NULL auto_increment primary KEY,
Fecha_venta INT not null,
Hora_venta INT not null,
Precio_total INT not null,
Metodo_pago varchar(20) not null,
Factura_venta varchar(50) not null,
id_Transacciones INT NOT NULL,
foreign key (id_Transacciones) references Transacciones (idTransacciones)
);
describe Ventas;

CREATE TABLE Transacciones(idTransacciones INT NOT NULL auto_increment primary KEY,
Forma_pago varchar(50) not null,
Fecha_transferencia INT not null,
Monto_transferido INT not null
);
describe Transacciones;



DROP TABLE Pedidos