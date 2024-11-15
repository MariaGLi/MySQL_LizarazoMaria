USE AutoRental_María;

-- Hacer 5 Funciones

-- 1. Cual es la diferencia que se halla en el valor que cotiza el cliente y el valor que paga al final.

DELIMITER //
CREATE FUNCTION Diferencia_Pago (Valor_Cotizado DOUBLE, Valor_Pagado DOUBLE)
RETURNS DOUBLE DETERMINISTIC
BEGIN
	DECLARE Total DOUBLE;
    SET Total = Valor_Cotizado - Valor_Pagado;
    RETURN Total;
END //
DELIMITER ;

select Diferencia_Pago (Valor_Cotizado, Valor_Pagado) as Diferencia_Pago from Alquileres;

-- 2. De cuantos días han sido las fechas de descuentos.

DELIMITER //
CREATE FUNCTION Días_Descuento (Fecha_Inicio_Dto DOUBLE, Fecha_Finalizacion_Dto DOUBLE)
RETURNS DOUBLE DETERMINISTIC
BEGIN
	DECLARE Total DOUBLE;
    SET Total = Fecha_Finalizacion_Dto - Fecha_Inicio_Dto;
    RETURN Total;
END //
DELIMITER ;
select idDescuentos, Días_Descuento (Fecha_Inicio_Dto, Fecha_Finalizacion_Dto) as Dias_Dto from Descuentos;

-- 3. Cual es la diferencia que hay, al momento de cotizar un carro, por días o por semana.

DELIMITER //
CREATE FUNCTION Ahorro (Valor_Alquiler_Semana DOUBLE, Valor_Alquiler_Dia DOUBLE)
RETURNS DOUBLE DETERMINISTIC
BEGIN
	DECLARE Total DOUBLE;
    SET Total = Valor_Alquiler_Dia - (Valor_Alquiler_Semana / 7);
    RETURN Total;
END //
DELIMITER ;
select Ahorro (Valor_Alquiler_Semana, Valor_Alquiler_Dia) as Diferencia_Por_Dia from Alquileres;



-- Hacer 25 Consultas

-- 1. Liste Todos los empleados.
SELECT * from Empleados;

-- 2. Liste los nombres y apellidos de los empleados en una única columna.

select concat_ws('', Nombre1, ' ', Nombre2, ' ', Apellido1, ' ', Apellido2) as Nombres_Completos from Empleados;

-- 3. Que tipos de vehículos han sido entregados con días de retraso.

select distinct v.Tipo_Vehiculo, r.Dias_Retraso from retraso r
inner join vehiculos v on r.idRetraso = v.idVehiculos;

-- 4. Cuantas Ciudades tienen sucursales.

select count(Ciudad) as Cantidad_Sucursales from sucursales;

-- 5. Cuantas sucursales hay por ciudad.

select ciudad, count(ciudad) as Sucursales_Ciudad from sucursales group by 1;

-- 6. Que clientes han entregado con retraso el vehiculo y cuantos dias de retraso han sido.

select r.Dias_Retraso, concat_ws('', Nombre1, ' ', Apellido1) as Nombres_Completos from retraso r
inner join clientes c on r.idRetraso = c.idClientes;

-- 7. Liste cuantos empleados tiene cada sucursal y ordenelo alfabeticamente segun la ciudad.

select s.Ciudad, count(e.Nombre1) as Cantidad_Empleados from empleados e
inner join sucursales s on e.idEmpleados = s.idSucursales group by 1 order by 1 asc;

-- 8. Devuelva una lista con el tipo del vehiculo, la capacidad, el motor, la referencia y el modelo.

select distinct Tipo_Vehiculo, Modelo, Capacidad, Motor, Referencia from vehiculos;

-- 9. Que tipos de vehiculos tiene AutoRental_Maria y cuantos por cada tipo.

select Tipo_Vehiculo, count(Tipo_Vehiculo) as Cantidad from vehiculos group by 1;

-- 10. Modelo y referencia de los tipos de vehiculos.

select Tipo_Vehiculo, Modelo, Referencia from vehiculos;

-- 11. Cantidad de modelos de los vehiculos y ordenelos de menor a mayor según la cantidad.

select Modelo, count(Modelo) as Cantidad from vehiculos group by 1 order by 2 asc;

-- 12. 


select * from vehiculos;
select * from retraso;
select * from empleados;
select * from clientes;
select * from alquileres;
select * from descuentos;
select * from sucursales;