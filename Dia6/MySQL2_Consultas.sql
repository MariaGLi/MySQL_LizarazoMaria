USE universidad_T2;

-- Consultas

-- Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los alumnos.
-- El listado deberá estar ordenado alfabéticamente de menor a mayor por el primer apellido, segundo apellido y nombre.

select apellido1 as Apellido_1, apellido2 as Apellido_2, nombre as Nombre from alumno order by 1,2,3 ASC;

-- Averigua el nombre y los dos apellidos de los alumnos
-- que no han dado de alta su numero de telefono en la base de datos

select * from alumno;
select nombre, apellido1, apellido2 from alumno where telefono is null;

-- Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre,
-- en el tercer curso del grado que tiene el identificador 7.

select * from asignatura where cuatrimestre = 1 and curso = 3 and id_grado = 7;

-- Devuelve un listado con todas las asignaturas ofertadas en el grado en Ingienería Informática (Plan 2015)

select * from asignatura, grado where grado.id = 4;

select asignatura.nombre from asignatura INNER JOIN grado on asignatura.id_grado = grado.id
where grado.nombre = 'Grado en Ingeniería Informática (Plan 2015)';

-- Devuelve un listado con todos los alumnos que se han matriculado en alguna asignatura
-- durante el curso escolar 2017/2018

select * from alumno al 
inner join alumno_se_matricula_asignatura asm on al.id = asm.id_alumno
inner join asignatura a on asm.id_asignatura = a.id
inner join curso_escolar ce on ce.id = asm.id_curso_escolar
where ce.anyo_inicio = '2017' and ce.anyo_fin = '2018';

-- Devuelve el número total de alumnas que hay.
select count(*) as Cantidad_Alumnas from alumno where sexo = 'M';

-- Calcula cuántos alumnos nacieron en 1999.
select count(*) from alumno where year (fecha_nacimiento) = 1999;

-- Calcula cuántos profesores hay en cada departamento. El resultado sólo debe mostrar dos columnas, 
-- una con el nombre del departamento y otra con el número de profesores que hay en ese departamento. 
-- El resultado sólo debe incluir los departamentos que tienen profesores asociados y deberá estar ordenado 
-- de mayor a menor por el número de profesores.

select count(p.id_departamento) as Cantidad_profesores, d.nombre from profesor p
inner join departamento d on p.id_departamento = d.id
group by 2 order by Cantidad_profesores desc;

-- Devuelve un listado con todos los departamentos y el número de profesores que hay en cada uno de ellos.
-- Tenga en cuenta que pueden existir departamentos que no tienen profesores asociados. Estos departamentos 
-- también tienen que aparecer en el listado.

select * from profesor;
select d.nombre, count(p.id_departamento) as Cantidad_profesores from departamento d 
left join profesor p on d.id = p.id_departamento group by 1 order by Cantidad_profesores asc;

-- Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de 
-- asignaturas que tiene cada uno. Tenga en cuenta que pueden existir grados que no tienen asignaturas asociadas.
-- Estos grados también tienen que aparecer en el listado. El resultado deberá estar ordenado de mayor a menor por 
-- el número de asignaturas.

select g.nombre, count(ag.nombre) as Conteo_Asignaturas from grado g
left join asignatura ag on g.id = ag.id_grado
group by 1 order by 2 desc;

-- Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de 
-- asignaturas que tiene cada uno, de los grados que tengan más de 40 asignaturas asociadas.

select g.nombre, count(ag.nombre) as Conteo_Asignaturas from grado g
inner join asignatura ag  on g.id = ag.id_grado group by 1 having count(2) > 40;

-- Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos 
-- que hay para cada tipo de asignatura. El resultado debe tener tres columnas: nombre del grado, 
-- tipo de asignatura y la suma de los créditos de todas las asignaturas que hay de ese tipo. Ordene el 
-- resultado de mayor a menor por el número total de crédidos.

select g.nombre, ag.tipo, sum(ag.creditos) as Total_creditos from grado g
inner join asignatura ag on g.id = ag.id_grado group by 1,2 order by 3 desc;

-- Devuelve un listado que muestre cuántos alumnos se han matriculado de alguna asignatura en cada uno 
-- de los cursos escolares. El resultado deberá mostrar dos columnas, una columna con el año de inicio 
-- del curso escolar y otra con el número de alumnos matriculados.

select * from alumno;
select ce.anyo_inicio, count(al.nombre) as Cantidad_alumnos from alumno al 
inner join curso_escolar ce group by 1;

-- Devuelve un listado con el número de asignaturas que imparte cada profesor. El listado debe tener en 
-- cuenta aquellos profesores que no imparten ninguna asignatura. El resultado mostrará cinco columnas: 
-- id, nombre, primer apellido, segundo apellido y número de asignaturas. El resultado estará ordenado
-- de mayor a menor por el número de asignaturas.

select p.id, p.nombre, p.apellido1, p.apellido2, count(ag.nombre) from profesor p
left join asignatura ag on p.id = ag.id_profesor
group by 1 order by 5 desc;

-- Devuelve todos los datos del alumno más joven.

select * from alumno order by fecha_nacimiento desc limit 1;

-- Devuelve un listado con los profesores que no están asociados a un departamento.

select * from profesor p inner join departamento d on p.id_departamento = d.id where p.id_departamento is null;

-- Devuelve un listado con los departamentos que no tienen profesores asociados.

select * from departamento d left join profesor p
on d.id = p.id_departamento where p.id_departamento is null;

-- Devuelve un listado con los profesores que tienen un departamento asociado y que no imparten ninguna asignatura.

select * from profesor p 
inner join departamento d on p.id_departamento = d.id
inner join asignatura ag on p.id = ag.id_profesor
where ag.id_profesor is null;

select * from profesor p 
left join asignatura ag on ag.id_profesor = p.id where ag.id_profesor is null;

-- Devuelve un listado con las asignaturas que no tienen un profesor asignado.

select * from asignatura ag 
left join profesor p on ag.id_profesor = p.id where ag.id_profesor is null;

select * from asignatura ag 
where ag.id_profesor is null;

-- Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar.



-- Devuelve un listado con el nombre de todos los departamentos que tienen profesores que imparten alguna 
-- asignatura en el Grado en Ingeniería Informática (Plan 2015).

select d.nombre from departamentos
inner join asignatura ag ;

-- Devuelve un listado con los nombres de todos los profesores y los departamentos que tienen vinculados. 
-- El listado también debe mostrar aquellos profesores que no tienen ningún departamento asociado. 
-- El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido 
-- y nombre del profesor. El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del 
-- departamento, apellidos y el nombre.



-- Devuelve un listado con los profesores que no están asociados a un departamento.



-- Devuelve un listado con los departamentos que no tienen profesores asociados.

select * from departamento d left join profesor p
on d.id = p.id_departamento where p.id_departamento is null;

-- Devuelve un listado con los profesores que no imparten ninguna asignatura.

select * from profesor p 
left join asignatura ag on ag.id_profesor = p.id where ag.id_profesor is null;

-- Devuelve un listado con las asignaturas que no tienen un profesor asignado.

select * from asignatura ag 
left join profesor p on ag.id_profesor = p.id where ag.id_profesor is null;

-- Devuelve un listado con todos los departamentos que tienen alguna asignatura que no se haya 
-- impartido en ningún curso escolar. El resultado debe mostrar el nombre del departamento y el 
-- nombre de la asignatura que no se haya impartido nunca.

