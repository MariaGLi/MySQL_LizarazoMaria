USE ventas;

-- 1. Obtener el total de pedidos realizados por un cliente.

DELIMITER //
CREATE FUNCTION TotalPedidos (total double, id_cliente double)
RETURNS DOUBLE DETERMINISTIC
BEGIN
	DECLARE Total DOUBLE;
    select p.total, c.nombre, c.apellido1 into TotalPed from pedido p
	inner join cliente c on p.id = c.id_cliente;
    RETURN Total;
END //
DELIMITER ;

select p.total, c.nombre, c.apellido1 from pedido p
inner join cliente c on p.id = c.id_cliente;

-- 2. Calcular la comisión total ganada por un comercial.


-- 3. Obtener el cliente con mayor total en pedidos.


-- 4. Contar la cantidad de pedidos realizados en un año específico.


-- 5. Obtener el promedio total de pedidos por cliente.

DELIMITER //
CREATE FUNCTION PromTotalPedidos (id_cliente double, total double)
RETURNS DOUBLE DETERMINISTIC
BEGIN
	DECLARE Total DOUBLE;
    select c.nombre, c.apellido1, avg(p.total) into Promedio from pedido p
	inner join cliente c on p.id = c.id_cliente;
    RETURN Total;
END //
DELIMITER ;

select c.nombre, c.apellido1, avg(p.total) from pedido p
inner join cliente c on c.id_cliente = p.id group by 1,2;

select * from pedido;