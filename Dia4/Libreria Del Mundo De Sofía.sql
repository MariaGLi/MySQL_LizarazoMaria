CREATE DATABASE Libreria_Del_Mundo_De_Sofía;

USE Libreria_Del_Mundo_De_Sofía;

CREATE TABLE clientes(
Id_clientes INT PRIMARY KEY AUTO_INCREMENT,
nombre_cliente varchar(15) NOT NULL,
apellido_cliente varchar(15) NOT NULL,
telefono_cliente INT NOT NULL,
direccion_cliente varchar(20) NOT NULL,
email_cliente varchar(20) NOT NULL
);

CREATE TABLE pedidos(
Id_pedidos INT PRIMARY KEY AUTO_INCREMENT,
fecha_pedido INT NOT NULL,
hora_pedido INT NOT NULL,
cantidad_pedido INT NOT NULL,
estado_pedido varchar(20) NOT NULL
);

CREATE TABLE Clientes_has_Pedidos(
Clientes_idClientes INT,
Pedidos_idPedidos INT,
foreign key (Clientes_idClientes) REFERENCES clientes(Id_clientes),
foreign key (Pedidos_idPedidos) references pedidos(Id_pedidos)
);

CREATE TABLE ventas(
Id_ventas INT PRIMARY KEY AUTO_INCREMENT,
fecha_venta INT NOT NULL,
hora_venta INT NOT NULL,
precio_total INT NOT NULL,
metodo_pago varchar(20) NOT NULL,
factura_venta varchar(45) NOT NULL
);

CREATE TABLE transacciones(
Id_transaccion INT PRIMARY KEY AUTO_INCREMENT,
fecha_transferencia INT NOT NULL,
forma_pago varchar(15) NOT NULL,
monto_transferido INT NOT NULL
);

CREATE TABLE libros(
ISBN INT PRIMARY KEY AUTO_INCREMENT,
autor varchar(20) NOT NULL,
titulo varchar(20) NOT NULL,
categoria varchar(20) NOT NULL,
fecha_publicacion INT NOT NULL,
precio INT NOT NULL,
cantidad INT NOT NULL,
editorial varchar(20) NOT NULL,
foreign key (autor) REFERENCES libros(autor),
foreign key (titulo) REFERENCES libros(titulo),
foreign key (categoria) REFERENCES libros(categoria)
);

CREATE TABLE autores(
Id_autor INT PRIMARY KEY AUTO_INCREMENT,
nombre_autor varchar(15) NOT NULL,
apellido_autor varchar(15) NOT NULL,
nacionalidad varchar(20) NOT NULL,
fecha_nacimiento INT NOT NULL
);

CREATE TABLE libros_has_autores(
Libros_ISBN INT,
Libros_titulo INT,
Libros_autor INT,
Libros_categoria INT,
Autores_idAutores INT,
foreign key (Libros_ISBN) REFERENCES libros(ISBN),
foreign key (Libros_titulo) REFERENCES libros(titulo),
foreign key (Libros_autor) REFERENCES libros(autor),
foreign key (Libros_categoria) REFERENCES libros(categoria),
foreign key (Autores_idAutores) REFERENCES autores(Id_autor)
);

CREATE TABLE actualizacion_registros_libros(
Id_registros_actualizados INT PRIMARY KEY AUTO_INCREMENT,
ISBN_nuevo INT NOT NULL,
nombre_libro_nuevo varchar(30) NOT NULL,
nombre_autor varchar(20) NOT NULL,
nombre_editorial varchar(20) NOT NULL,
tipo_categoria varchar(20) NOT NULL,
cantidad_ingresada INT NOT NULL,
precio_libro INT NOT NULL,
actualizacion_general varchar(45) NOT NULL
);

CREATE TABLE inventario(
Id_inventario INT PRIMARY KEY AUTO_INCREMENT,
actualizacion_inventario varchar(30) NOT NULL,
stock_total varchar(15) NOT NULL,
categorias_stock varchar(20) NOT NULL
);