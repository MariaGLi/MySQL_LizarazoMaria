 DROP DATABASE IF EXISTS AutoRental_María;

 CREATE DATABASE AutoRental_María;

 USE AutoRental_María;

 CREATE TABLE Sucursales (
 idSucursales INT PRIMARY KEY,
 Ciudad varchar(45) NOT NULL,
 Direccion varchar(45) NOT NULL,
 Telefono_Fijo varchar(45) NOT NULL,
 Celular varchar(45) NOT NULL,
 Email varchar(45) NOT NULL
);
 
 CREATE TABLE Empleados (
 idEmpleados INT PRIMARY KEY,
 Nombre1 varchar(45) NOT NULL,
 Nombre2 varchar(45) NOT NULL,
 Apellido1 varchar(45) NOT NULL,
 Apellido2 varchar(45) NOT NULL,
 Cedula varchar(45) NOT NULL,
 Celular varchar(45) NOT NULL,
 Direccion varchar(45) NOT NULL,
 Ciudad_Residencia varchar(45) NOT NULL,
 Email varchar(45),
 idSucursales INT,
 FOREIGN KEY (idSucursales) REFERENCES Sucursales (idSucursales)
);

CREATE TABLE Clientes (
 idClientes INT PRIMARY KEY,
 Nombre1 varchar(45) NOT NULL,
 Nombre2 varchar(45) NOT NULL,
 Apellido1 varchar(45) NOT NULL,
 Apellido2 varchar(45) NOT NULL,
 Cedula varchar(45) NOT NULL,
 Celular varchar(45) NOT NULL,
 Direccion varchar(45) NOT NULL,
 Ciudad_Residencia varchar(45) NOT NULL,
 Email varchar(45),
 idEmpleados INT,
 FOREIGN KEY (idEmpleados) REFERENCES Empleados (idEmpleados)
);

CREATE TABLE Vehiculos (
idVehiculos INT PRIMARY KEY,
Tipo_Vehiculo VARCHAR (45) NOT NULL,
Modelo INT NOT NULL,
Capacidad VARCHAR (45) NOT NULL,
Placa VARCHAR (45) NOT NULL,
Motor VARCHAR (45) NOT NULL,
Sunroof VARCHAR (45) NOT NULL,
Puertas INT NOT NULL,
Color VARCHAR (45) NOT NULL,
Referencia VARCHAR (45) NOT NULL,
idClientes INT,
FOREIGN KEY (idClientes) REFERENCES Clientes (idClientes)
);

CREATE TABLE Alquileres (
IdAlquileres INT PRIMARY KEY,
Fecha_Salida DATE,
Fecha_Llegada DATE,
Fecha_Esperada_Llegada DATE,
Valor_Alquiler_Semana INT NOT NULL,
Valor_Alquiler_Dia INT NOT NULL,
Valor_Cotizado INT NOT NULL,
Valor_Pagado INT NOT NULL,
idSucursales INT,
idEmpleados INT,
idSucursal_Llegada INT,
idSucursal_Salida INT,
idVehiculos INT,
FOREIGN KEY (idSucursales) REFERENCES Sucursales (idSucursales),
FOREIGN KEY (idEmpleados) REFERENCES Empleados (idEmpleados),
FOREIGN KEY (idSucursal_Llegada) REFERENCES Sucursales (idSucursales),
FOREIGN KEY (idSucursal_Salida) REFERENCES Sucursales (idSucursales),
FOREIGN KEY (idVehiculos) REFERENCES Vehiculos (idVehiculos)
);

CREATE TABLE Retraso(
idRetraso INT PRIMARY KEY,
Dias_Retraso INT NOT NULL,
Porcentaje_Dias_Retraso VARCHAR (45) NOT NULL,
idVehiculos INT,
IdAlquileres INT,
FOREIGN KEY (idVehiculos) REFERENCES Vehiculos (idVehiculos),
FOREIGN KEY (idAlquileres) REFERENCES Alquileres (idAlquileres)
);

CREATE TABLE Descuentos(
idDescuentos INT PRIMARY KEY,
Fecha_Inicio_Dto DATE,
Fecha_Finalizacion_Dto DATE,
Porcentaje_Descuento VARCHAR (45) NOT NULL,
idClientes INT,
idAlquileres INT,
FOREIGN KEY (idClientes) REFERENCES Clientes (idClientes),
FOREIGN KEY (idAlquileres) REFERENCES Alquileres (idAlquileres)
);