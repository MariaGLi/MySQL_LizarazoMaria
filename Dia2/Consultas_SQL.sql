CREATE DATABASE Second_Work;

USE Second_Work;

create table Pais(
idPais INT NOT NULL PRIMARY KEY,
nombre varchar (45) NOT NULL,
continente varchar (45) NOT NULL,
poblacion INT NOT NULL
);

create table Ciudad(
idCiudad INT NOT NULL PRIMARY KEY,
nombre varchar (45) NOT NULL,
idPais INT NOT NULL,
foreign key (idPais) references Pais (idPais) 
);

create table Idioma (
idIdioma INT NOT NULL PRIMARY KEY,
idioma varchar (50) NOT NULL
);
describe Idioma;

create table Idioma_Pais(
id_idioma INT NOT NULL,
id_pais INT NOT NULL,
es_oficial tinyint,
primary key (id_idioma, id_pais),
foreign key (id_idioma) references Idioma (idIdioma),
foreign key (id_pais) references Pais (idPais)
);

insert into Idioma (idIdioma, idioma) values (1, 'Español'), (2,'Inglés'), (3, 'Francés');

insert into Pais (idPais,nombre,continente,poblacion)
values (1, 'México', 'América', 126000000),
(2, 'Estados Unidos', 'América', 331000000),
(3, 'Francia', 'Europa', 67000000),
(4, 'Canadá', 'América', 38000000);

insert into Ciudad(idPais, idCiudad, nombre)
values (1, 1, 'Monte Rey'),
(1,2, 'Cancún'),
(1,3, 'Puerto Vallarta'),
(2,4, 'Filadelfia'),
(2,5, 'Houston'),
(2,6, 'Phoenix'),
(3,7, 'Marsella'),
(3,8, 'Versalles'),
(3,9, 'Grenoble'),
(4,10, 'Vancouver'),
(4,11, 'Saskatoon'),
(4,12, 'Niagara Falls')
;


-- La lengua base de méxico es el español
insert into Idioma_Pais (id_idioma, id_pais, es_oficial) values(1,1,1);

-- La lengua de méxico no es el inglés
insert into Idioma_Pais (id_idioma, id_pais, es_oficial) values(2,1,0);
select * from Idioma_Pais;
select * from Pais;
select * from Idioma;
select * from Ciudad;

-- Trabajito
-- 1. Listar todos los idiomas
select * from Idioma;
select idioma from Idioma;

-- 2. Listar el idioma con ID = 1
select * from Idioma where idIdioma=1;
select idioma from Idioma where idIdioma=1;

-- 3. Consultar los países que estén en América
select nombre from Pais where continente = 'América';
select * from Pais where continente = 'América';
select nombre as NombrePais from Pais where continente = 'América';

-- SUBCONSULTAS
-- 4. Subconsulta que encuentre los idiomas oficiales
select idioma from Idioma where idIdioma in
(select id_idioma from Idioma_Pais where es_oficial = 1);