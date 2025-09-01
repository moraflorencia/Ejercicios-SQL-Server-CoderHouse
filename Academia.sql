
/*Crear la base*/

CREATE DATABASE Academia;

USE Academia            /* Pongo en accion la base de datos "Academia"*/

CREATE SCHEMA Base1;    /*Genero el esquema*/

/*Genero las tablas*/

CREATE TABLE Base1.Estudiantes(
Legajo_Estudiante varchar(100) PRIMARY KEY NOT NULL,
Nombre_Estudiante varchar(100),
Apellido_Estudiante varchar(100),
DNI_Estudiante int);

CREATE TABLE Base1.Profesores(
Legajo_Profesor varchar(100) PRIMARY KEY NOT NULL,
Nombre_Profesor varchar(100),
Apellido_Profesor varchar(100),
DNI_Profesor int);

CREATE TABLE Base1.Asignaturas(
Id_Asignatura varchar(100) PRIMARY KEY NOT NULL,
Nombre_Asignatura varchar(100),
Legajo_Estudiante varchar(100),
Legajo_Profesor varchar(100),
FOREIGN KEY(Legajo_Estudiante) REFERENCES Base1.Estudiantes (Legajo_Estudiante),
FOREIGN KEY(Legajo_Profesor) REFERENCES Base1.Profesores (Legajo_Profesor)
);

/*Agregamos una columna*/
ALTER TABLE Base1.Estudiantes
ADD Email_Estudiante varchar(100);

/*Cambiamos el nombre del campo Nombre_Estudiante por Nombre_Alumno*/
SP_RENAME 'Base1.Estudiantes.Nombre_Estudiante', 'Nombre_Alumno';

/*Eliminamos el campo Email_Estudiante*/

ALTER TABLE Base1.Estudiantes
DROP column Email_Estudiante;