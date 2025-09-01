/* 1. Indicar cuántos cursos y carreras  tiene el área de Data. Renombrar la nueva columna como cant_asignaturas. 
Keywords: Tipo, Área, Asignaturas.*/

SELECT
Tipo,
COUNT (Tipo) AS Cantidad_Asignaturas
FROM Asignaturas
WHERE Nombre LIKE '%data%'
GROUP BY Tipo;

/* 2. Se requiere saber cual es el nombre, el documento de identidad y el teléfono de los estudiantes que son profesionales en agronomía y que nacieron entre el
año1970 y el año 2000.
Keywords: Estudiantes, Profesión, Fecha de Nacimiento.*/

SELECT *FROM Estudiantes

SELECT Nombre, Documento, Telefono
FROM Estudiantes
WHERE Profesion = 6
AND [Fecha de Nacimiento] BETWEEN '1970-01-01' AND '2000-12-31';

/* 3. Se requiere un listado de los docentes que ingresaron en el año 2021 y concatenar los campos nombre y apellido. El resultado debe utilizar un separador: 
guión (-). Ejemplo: Elba-Jimenez. Renombrar la nueva columna como Nombres_Apellidos. Los resultados de la nueva columna deben estar en mayúsculas. 
Keywords: Staff, Fecha Ingreso, Nombre, Apellido.*/

SELECT *FROM Staff

SELECT UPPER(CONCAT(Nombre, '-', Apellido)) AS Nombres_Apellidos
FROM Staff
WHERE YEAR([Fecha Ingreso]) = 2021;

/* 4. Indicar la cantidad de encargados de docentes y de tutores. Renombrar la columna como CantEncargados. Quitar la palabra ”Encargado ” en cada uno de los registros. Renombrar la columna como NuevoTipo. Keywords: Encargado, tipo, Encargado_ID.*/

SELECT * FROM Encargado

SELECT 
    COUNT(Encargado_ID) AS CantEncargados,
    REPLACE(tipo, 'Encargado ', '') AS NuevoTipo
FROM Encargado
GROUP BY tipo

/* 5. Indicar cuál es el precio promedio de las carreras y los cursos por jornada. Renombrar la nueva columna como Promedio. Ordenar los promedios de Mayor a menor
Keywords: Tipo, Jornada, Asignaturas. */

SELECT * FROM Asignaturas

SELECT Tipo, Jornada,
AVG(Costo) AS Promedio
FROM Asignaturas
GROUP BY Tipo, Jornada
ORDER BY Promedio DESC

/* 6. Se requiere calcular la edad de los estudiantes en una nueva columna. Renombrar a la nueva columna Edad. Filtrar solo los que son mayores de 18 años. 
Ordenar de Menor a Mayor 
Keywords: Fecha de Nacimiento, Estudiantes.*/

SELECT * FROM Estudiantes

SELECT Nombre, Apellido, [Fecha de Nacimiento], datediff(Day,[Fecha de Nacimiento],getdate())/(365) as Edad 
FROM Estudiantes
WHERE datediff(Day,[Fecha de Nacimiento],getdate())/(365) > 18
ORDER BY Edad ASC

/* 7. Se requiere saber el Nombre,el correo, la camada y la fecha de ingreso de personas del staff que contienen correo .edu y su DocenteID se mayor o igual que 100
Keywords: Staff, correo, DocentesID*/

SELECT * FROM Staff

SELECT Correo, Camada, Nombre, [Fecha Ingreso]
FROM Staff
WHERE Correo LIKE '%.edu%' AND DocentesID >= 100

/* 8. Se requiere conocer el documento, el domicilio, el código postal y el nombre de los primeros estudiantes que se registraron en la plataforma. 
Keywords: Documento, Estudiantes, Fecha Ingreso.*/

SELECT * FROM Estudiantes

SELECT TOP (5)  Documento, Domicilio, [Codigo Postal], Nombre
FROM Estudiantes
ORDER BY [Fecha Ingreso]

/* 9. Indicar el nombre, apellido y documento de identidad de los docentes y tutores que tienen asignaturas “UX” . 
Keywords: Staff, Asignaturas, Nombre, Apellido.*/

SELECT * FROM Staff
SELECT * FROM Asignaturas

SELECT staff.Nombre, staff.Apellido, staff.Documento, Asignaturas.Nombre
FROM Staff 
JOIN Asignaturas
ON  Staff.Asignatura = Asignaturas.AsignaturasID
WHERE Asignaturas.Nombre LIKE '%UX%'

/* 10. Se desea calcular el 25% de aumento para las asignaturas del área de marketing de la jornada mañana se deben traer todos los campos, mas el de los cálculos 
correspondientes el porcentaje y el Nuevo costo debe estar en decimal con 3 digitos. Renombrar el calculo del porcentaje con el nombre porcentaje y la suma del
costo mas el porcentaje por NuevoCosto. 
Keywords: Asignaturas, Costo, Área, Jornada, Nombre*/

SELECT * FROM Asignaturas
SELECT * FROM Area

SELECT *, CAST ((Costo * 0.25) AS DECIMAL (7,3)) AS Porcentaje,
Costo + CAST ((Costo * 0.25) AS DECIMAL (7,3)) AS NuevoCosto
FROM Asignaturas
WHERE Area = (SELECT AreaID FROM Area WHERE Nombre LIKE ('%Marketing%') AND Jornada = 'Manana');
