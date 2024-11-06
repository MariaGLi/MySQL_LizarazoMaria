-- La dificultad de hacer una relación adecuada entre dos o más tablas
-- hizo que surgiera la utilización de JOINS

-- JOINS: Se encargan de unir tablas entre sí (Dos o más).

create database JOINS;

USE JOINS;

CREATE TABLE departamento (
    codigo INT PRIMARY KEY,
    nombre VARCHAR(50),
    presupuesto DECIMAL(10, 2)
);

CREATE TABLE empleado (
    codigo INT PRIMARY KEY,
    nif VARCHAR(10),
    nombre VARCHAR(50),
    apellido1 VARCHAR(50),
    apellido2 VARCHAR(50),
    codigo_departamento INT,
    FOREIGN KEY (codigo_departamento) REFERENCES departamento(codigo)
);

INSERT INTO departamento (codigo, nombre, presupuesto) VALUES
(1, 'Desarrollo', 120000),
(2, 'Sistemas', 150000),
(3, 'Recursos Humanos', 280000);

INSERT INTO empleado (codigo, nif, nombre, apellido1, apellido2, codigo_departamento) VALUES
(1, '32481596F', 'Aarón', 'Rivero', 'Gómez', 1),
(2, 'Y557632D', 'Adela', 'Salas', 'Díaz', 2),
(3, 'R6970642B', 'Adolfo', 'Rubio', 'Flores', 3);

select * from empleado, departamento;

select * from empleado;

-- Intersección con where
select * from empleado, departamento where empleado.codigo_departamento = departamento.codigo;

-- Interseccion con INNER JOIN
select * from empleado INNER JOIN departamento on empleado.codigo_departamento = departamento.codigo;

-- Interseccion con INNER JOIN y USING
select * from empleado INNER JOIN departamento USING (codigo);

INSERT INTO empleado (codigo, nif, nombre, apellido1, apellido2, codigo_departamento) VALUES
(4, '32481596F', 'Pepito', 'Pérez', 'Solo', null);
-- Intersección LEFT JOIN y ON
select * from empleado LEFT JOIN departamento on empleado.codigo_departamento = departamento.codigo;

INSERT INTO departamento (codigo, nombre, presupuesto) VALUES
(4, 'Desarrollo', 120000);
-- Intersección RIGHT JOIN y ON
select * from empleado RIGHT JOIN departamento on empleado.codigo_departamento = departamento.codigo;