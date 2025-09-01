
USE Academia

SELECT * FROM Base1.Estudiantes;  /*Traigo la tabla*/

/*Cumple alguna de las 2 condiciones*/
SELECT Legajo_Estudiante, Nombre_Alumno, DNI_Estudiante FROM Base1.Estudiantes WHERE DNI_Estudiante = 1234 OR DNI_Estudiante = 43123123; 

SELECT Legajo_Estudiante, Nombre_Alumno, DNI_Estudiante FROM Base1.Estudiantes WHERE DNI_Estudiante = 1234 AND DNI_Estudiante = 43123123;

/*Cumple con ambas condiciones a la vez*/
SELECT Legajo_Estudiante, Nombre_Alumno, DNI_Estudiante FROM Base1.Estudiantes WHERE DNI_Estudiante = 1234 AND Nombre_Alumno = 'Gris'; 

/*Niega la condicion*/
SELECT *FROM Base1.Estudiantes WHERE NOT Legajo_Estudiante = 'E100';

/*Muestra todos los nombres que terminan en A*/
SELECT * FROM Base1.Estudiantes WHERE Nombre_Alumno LIKE '%a';

/*Muestra todos los nombres que empiezan con J*/
SELECT * FROM Base1.Estudiantes WHERE Nombre_Alumno LIKE 'J%';

/*Muestra todos los nombres contengan A*/
SELECT * FROM Base1.Estudiantes WHERE Nombre_Alumno LIKE '%a%';

/*IN*/
SELECT * FROM Base1.Estudiantes WHERE Apellido_Estudiante IN ('Mora', 'Romero');

/*BETWEEN*/
SELECT * FROM Base1.Estudiantes WHERE Legajo_Estudiante BETWEEN 'E100' AND 'E102';

/*ORDER BY ASCENDENTEMENTE*/
SELECT * FROM Base1.Estudiantes ORDER BY Nombre_Alumno;

/*ORDER BY DESCENDENTEMENTE*/
SELECT * FROM Base1.Estudiantes ORDER BY Nombre_Alumno DESC;

