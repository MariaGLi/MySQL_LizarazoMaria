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

-- 4. calcular el valor total de alquiler semanal, tomando como base el valor diario. 

DELIMITER //
CREATE FUNCTION TotalAlquilerSemana(Valor_Alquiler_Dia double)
RETURNS DOUBLE DETERMINISTIC
BEGIN
	DECLARE totalDias DOUBLE;
    SET totalDias = Valor_Alquiler_Dia * 7;
    RETURN totalDias;
END //
DELIMITER ;
select TotalAlquilerSemana(Valor_Alquiler_Dia) as Valor_Por_Semana from alquileres;

-- 5. Calcular el número de días entre la Fecha de salida y la Fecha de llegada del alquiler de un vehiculo.

DELIMITER //
CREATE FUNCTION DiasAlquiler (Fecha_Llegada double, Fecha_Salida double)
RETURNS double DETERMINISTIC
BEGIN
    DECLARE totalDias double;
	SET totalDias = Fecha_Llegada - Fecha_Salida;
    RETURN totalDias;
END //
DELIMITER ;
SELECT DiasAlquiler (Fecha_Llegada, Fecha_Salida) AS TotalDiasAlquiler from alquileres;

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

-- 12. Liste la cantidad de modelos que hay del 2019.

select Modelo, count(modelo) as Cantidad  from vehiculos where Modelo = 2019;

-- 13. Liste el tipo del vehiculo, la referencia y la capacidad de todos los vehiculos, ordenando  de mayor a menor las capacidades.

select Tipo_Vehiculo, Referencia, Capacidad from vehiculos order by 3 desc;

-- 14. Liste la cantidad de clientes atendida por cada empleado, ordenado de mayor a menor.

select e.Nombre1, e.Apellido1, count(c.Nombre1) as Cantidad_Atendida from clientes c
inner join empleados e on c.idClientes = e.idEmpleados group by 1,2 order by 3 desc;

-- 15. Muestre el listado de los precios del alquiler por semana en el rango de 1000000 a 1500000 ordenados de manera ascendente.

SELECT Valor_Alquiler_Semana FROM Alquileres
WHERE Valor_Alquiler_Semana BETWEEN 1000000 AND 1500000 order by 1 asc;

-- 16. Muestre el listado que no esten dentro del rango de 1000000 a 1500000 ordenados de manera descendente.

SELECT Valor_Alquiler_Semana FROM Alquileres
WHERE Valor_Alquiler_Semana NOT BETWEEN 1000000 AND 1500000 order by 1 desc;

-- 17. Liste todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno, en orden alfabético.

SELECT * 
FROM empleados e
WHERE e.apellido2 = 'Díaz' OR e.apellido2 = 'Vega' order by 2,3,4,5 asc;

-- 18. Calcula el valor mínimo de los valores  cotizados y pagados.

select min(Valor_Cotizado) as ValorMinCotizado, min(Valor_Pagado) as ValorMinPagado from alquileres;

-- 19. Calcula el valor máximo de los alquileres diarios y por semana

select max(Valor_Alquiler_Semana) as ValorMaxSemana, max(Valor_Alquiler_Dia) as ValorMaxDia from alquileres;

-- 20. Calcule la cantidad de empleados según su ciudad de residencia. Ordenarlo de manera alfabetica.

select Ciudad_Residencia, count(Nombre1) as Cantidad_Empleados from empleados group by 1 order by 1 asc;

-- 21. Cacule el promedio general del valor del alquiler por dia.

select avg(Valor_Alquiler_Dia) as PromedioAlquilerPorDia from alquileres;

-- 22. Liste  todos los datos de las sucursales existentes.

select * from sucursales;

-- 23. liste los vehiculos que tienen sunroof.

select * from vehiculos where sunroof = 'Sí';

-- 24. Liste los vehiculos con motor v6.

select * from vehiculos where Motor = 'V6';

-- 25. Que colores de carro maneja autoRental.

select distinct Color from vehiculos;


select * from vehiculos;
select * from retraso;
select * from empleados;
select * from clientes;
select * from alquileres;
select * from descuentos;
select * from sucursales;