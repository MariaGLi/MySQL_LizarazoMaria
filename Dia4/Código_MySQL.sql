CREATE DATABASE Librería_Mundo_Sofía;

USE Librería_Mundo_Sofía;

create table Clientes(
idClientes INT PRIMARY KEY,
nombre_cliente varchar (15) not null,
apellido_cliente varchar(15) not null,
direccion_cliente varchar (20) not null,
email_cliente varchar (20) not null,
telefono_cliente int not null
);

create table Pedidos(
idPedidos INT PRIMARY KEY,
fecha_pedido INT NOT NULL,
hora_pedido INT NOT NULL,
estado_pedido varchar (20) not null,
cantidad_pedido INT NOT NULL
);

create table Clientes_has_Pedidos (
Clientes_idClientes int,
Pedidos_idPedidos int,
FOREIGN KEY (Clientes_idClientes) REFERENCES Clientes(idClientes),
foreign key (Pedidos_idPedidos) references Pedidos(idPedidos)
);

create table Ventas (
idVentas INT PRIMARY KEY,
fecha_venta INT NOT NULL,
hora_venta INT NOT NULL,
precio_total INT NOT NULL,
metodo_pago varchar (20) not null,
factura_venta varchar (50)
);

create table Transacciones(
idTransacción INT PRIMARY KEY,
forma_pago varchar (15) not null,
fecha_transferencia int not null,
monto_transferido int not null
);

create table Actualizacion_Registros_Libros(
idRegistros_Actualizados INT PRIMARY KEY,
ISBN_nuevo int not null,
nombre_libro_nuevo varchar (30) not null,
nombre_editorial varchar (20) not null,
nombre_autor varchar (20) not null,
tipo_categoria varchar (20) not null,
precio_libro int not null,
cantidad_ingresada int not null
);

create table Inventario (
idInventario INT PRIMARY KEY,
actualizacion_inventario varchar (30) not null,
stock_total varchar (20) not null,
categorías_stock varchar (20) not null
);

create table Libros (
ISBN INT PRIMARY KEY,
titulo varchar (20) not null,
autor varchar (20) not null,
categoria varchar (20) not null,
precio int not null,
editorial varchar (20) not null,
fecha_publicacion int not null,
cantidad int not null
);

create table Autores(
idAutor INT PRIMARY KEY,
nombre_autor varchar (15) not null,
apellido_autor varchar (15) not null,
fecha_nacimiento int not null,
nacionalidad_autor varchar (20) not null
);

create table Libros_has_Autores(
libros_ISBN int,
autores_idAutor int,
FOREIGN KEY (libros_ISBN) REFERENCES Libros(ISBN),
FOREIGN KEY (autores_idAutor) REFERENCES Autores(idAutor)
);