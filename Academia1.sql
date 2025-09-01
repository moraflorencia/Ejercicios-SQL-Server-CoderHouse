/*Disponibilizamos la base de datos Academia*/
USE Academia

INSERT INTO Base1.Estudiantes(Legajo_Estudiante, Nombre_Alumno, Apellido_Estudiante, DNI_Estudiante)   /*Elijo donde cargar los datos*/
VALUES ('E100', 'Florencia', 'Mora', 42942488);             /*Carga de datos*/

/*Veo la tabla Estudiantes*/
SELECT * FROM Base1.Estudiantes;

/*Veo solo las 2 primeras columnas*/
SELECT Legajo_Estudiante, Nombre_Alumno FROM Base1.Estudiantes;

/*Cargo datos sin pasar parametros*/
INSERT INTO Base1.Estudiantes
VALUES ('E101', 'Juan', 'Romero', 43123123);

/*Cargo con datos vacios*/
INSERT INTO Base1.Estudiantes(Legajo_Estudiante, Nombre_Alumno)
VALUES ('E102', 'Gris');

/*Actulizo datos de la tabla*/
UPDATE  Base1.Estudiantes SET DNI_Estudiante = 1234 WHERE Legajo_Estudiante = 'E102';
UPDATE  Base1.Estudiantes SET Apellido_Estudiante = 'Romero' WHERE Legajo_Estudiante = 'E102';

/*Borro todo una fila*/
INSERT INTO Base1.Estudiantes
VALUES ('E104', 'Juan', 'Romero', 43123123);

INSERT INTO Base1.Estudiantes(Legajo_Estudiante, Nombre_Alumno)
VALUES ('E103', 'Gris');

DELETE FROM Base1.Estudiantes WHERE Legajo_Estudiante = 'E104' OR Legajo_Estudiante = 'E103';