USE Triggers_Eventos;

-- Consultas simples
-- 1. Listar todos los paises
select * from countries;

-- 2. Listar todos los departamentos

select * from departments;

-- 3. Mostrar el titulo y salario minimo de todos los trabajos.

select job_title, min_salary from jobs;

-- 4. Lista de dependientes junto con los datos de los empleados a los que esten asociados.

select d.*, e.* from dependents d
inner join employees e on d.dependent_id = e.employee_id; 

-- 5. Salario promedio por departamento y ciudad.

select d.department_name, l.city, avg(e.salary) as Pormedio_Salario from departments d 
inner join employees e on d.department_id = e.department_id
inner join locations l on d.location_id = l.location_id
group by 1, 2 order by 3;

-- 6. Lista de empleados con su trabajo, departamento y ubicación.

select e.first_name, e.last_name, j.job_title, d.department_name, l.street_address from jobs j 
inner join employees e on e.job_id=j.job_id 
inner join departments d  on e.department_id=d.department_id
inner join locations l on d.location_id=l.location_id ;

-- Funciones
-- 1. Obtener el nombre de un país por su ID.

DELIMITER //
CREATE FUNCTION Obtener_pais_nombre(country_id_i char(2))
returns varchar(50) deterministic
begin
	declare country_name_r varchar(50);
    select country_name into country_name_r
    from countries
    where country_id = country_id_i;
    return country_name_r;
end //
delimiter ;
select Obtener_pais_nombre('CA');

-- PROCEDIMIENTO
-- 1. Insertar una nueva region.
-- insert into regions (region_name) values ("Africa")

DELIMITER // 
CREATE PROCEDURE InsertarRegion(in nombre_region varchar(50))
BEGIN
	insert into regions (region_name) values (nombre_region);
END
// DELIMITER ;

call InsertarRegion('Africa');
select * from regions;