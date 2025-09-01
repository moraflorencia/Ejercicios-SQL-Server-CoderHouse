/*Análisis de docentes por camada/ comisión: 
- Número de documento de identidad, nombre del docente y camada, para identificar la camada mayor y la menor según el número de la  camada. 
- Número de documento de identidad, nombre de docente y camada para identificar la camada con fecha de ingreso Mayo 2021. 
- Agregar un campo indicador que informe cuáles son los registros ”mayor o menor” y los que son “mayo 2021” y ordenar el listado de menor a mayor 
por camada.*/

SELECT * FROM Staff

SELECT Documento, Nombre, Camada,'Mayor' AS MarcaFROM StaffWHERE Camada = (SELECT MAX(Camada) FROM Staff)UNIONSELECT Documento, Nombre, Camada,'Menor' AS MarcaFROM StaffWHERE Camada = (SELECT MAX(Camada) FROM Staff)UNIONSELECT Documento, Nombre, Camada,'Mayo ' AS MarcaFROM staffWHERE year([Fecha Ingreso])=2021 and month([Fecha Ingreso])=05order by Camada desc;

/*Análisis diario de estudiantes: 
Por medio de la fecha de ingreso de los estudiantes identificar: cantidad total de estudiantes.
Mostrar los periodos de tiempo separados por año, mes y día, y presentar la información ordenada por la fecha que más ingresaron estudiantes.
*/

SELECT * FROM Estudiantes

SELECT YEAR([Fecha Ingreso]) AS Anio, MONTH([Fecha Ingreso]) AS Mes, DAY([Fecha Ingreso]) AS Dia, COUNT (EstudiantesID) AS CantidadEstudiantes
FROM Estudiantes
GROUP BY [Fecha Ingreso]
ORDER BY CantidadEstudiantes

/*Análisis de encargados con más docentes a cargo: 
Identificar el top 10 de los encargados que tiene más docentes a cargo, filtrar solo los que tienen a cargo docentes. 
Ordenar de mayor a menor para poder tener el listado correctamente.*/

SELECT * FROM Encargado
SELECT * FROM Staff

SELECT TOP (10) Encargado.Nombre, Encargado.Apellido, COUNT (Staff.DocentesID) as CantidadDocentes
FROM Encargado 
JOIN Staff
ON  Staff.Encargado = Encargado.Encargado_ID
WHERE Encargado.Tipo LIKE '%Docente%'
GROUP BY Encargado.Nombre, Encargado.Apellido
ORDER BY CantidadDocentes

/*Análisis de profesiones con más estudiantes: 
Identificar la profesión y la cantidad de estudiantes que ejercen, mostrar el listado solo de las profesiones que tienen más de 5 estudiantes.
Ordenar de mayor a menor por la profesión que tenga más estudiantes.*/

SELECT * FROM Estudiantes
SELECT * FROM Profesiones

SELECT Profesiones.Profesiones, COUNT(Estudiantes.EstudiantesID) AS Cantidad_de_Alumnos
FROM Estudiantes
JOIN Profesiones
ON Estudiantes.Profesion = Profesiones.ProfesionesID
GROUP BY Profesiones.Profesiones
HAVING COUNT(Estudiantes.Profesion) > 5
ORDER BY Cantidad_de_Alumnos DESC;

/*Análisis de estudiantes por área de educación: 
Identificar: nombre del área, si la asignatura es carrera o curso , a qué jornada pertenece, cantidad de estudiantes y monto total del costo de la 
asignatura. 
Ordenar el informe de mayor a menor por monto de costos total, tener en cuenta los docentes que no tienen asignaturas ni estudiantes asignados, 
también sumarlos.*/

SELECT * FROM Estudiantes
SELECT * FROM Asignaturas
SELECT * FROM Area
SELECT * FROM Staff

SELECT t2.Nombre, t1.Tipo, t1.Jornada, COUNT(t4.EstudiantesID) AS Cantidad_Estudiantes, SUM(t1.Costo) AS Costo_Total
FROM Asignaturas t1
INNER JOIN Area t2 ON t1.Area=t2.AreaID
LEFT JOIN Staff t3 ON T3.Asignatura=t1.AsignaturasID
LEFT JOIN Estudiantes t4 ON t3.DocentesID=t4.Docente
GROUP BY t2.Nombre, t1.Tipo, t1.Jornada
ORDER BY Costo_total desc;

/*Análisis encargado tutores jornada noche: 
Identificar el nombre del encargado, el documento de identidad, el número de la camada (solo el número) y la fecha de ingreso del tutor. 
Ordenar por camada de forma mayor a menor.*/

SELECT * FROM Staff
SELECT * FROM Encargado
SELECT * FROM Asignaturas

SELECT Encargado.Nombre, StafF.Documento, RIGHT (Staff.Camada, 5) AS Camada, Staff.[Fecha Ingreso]
FROM Encargado
JOIN Staff
ON Encargado.Encargado_ID = Staff.Encargado
JOIN Asignaturas
ON Staff.Asignatura = Asignaturas.AsignaturasID
WHERE Asignaturas.Jornada = 'Noche' and Encargado.Tipo like '%Tutores%'
ORDER BY Camada DESC

/*Análisis asignaturas sin docentes o tutores: 
Identificar el tipo de asignatura, la jornada, la cantidad de áreas únicas y la cantidad total de asignaturas que no tienen asignadas docentes o tutores.
Ordenar por tipo de forma descendente.*/

SELECT * FROM Staff
SELECT * FROM Area
SELECT * FROM Asignaturas

SELECT Asignaturas.Tipo, Asignaturas.Jornada, COUNT(DISTINCT Asignaturas.Area) as Cant_Areas,COUNT(Asignaturas.Nombre) AS Cant_Asignaturas
FROM Staff
LEFT JOIN Asignaturas
ON Staff.Asignatura = Asignaturas.AsignaturasID
WHERE DocentesID IS NULLGROUP BY Asignaturas.Tipo, Asignaturas.JornadaORDER BY Asignaturas.tipo DESC
/*Análisis asignaturas mayor al promedio: 
Identificar el nombre de la asignatura, el costo de la asignatura y el promedio del costo de las asignaturas por área. 
Una vez obtenido el dato, del promedio se debe visualizar solo las carreras que se encuentran por encima del promedio. 
*/

SELECT * FROM Asignaturas
SELECT * FROM Area

SELECT Nombre, [Costo], AVG ([Costo])
FROM Asignaturas
WHERE [Costo] > AVG ([Costo]
GROUP BY Nombre
ORDER BY Area

select A.Nombre, A.Costo, AVG (A.Costo) as Promedio, AR.AreaIDfrom Asignaturas Ajoin Area Ar  on Ar.AreaID  = A.Areawhere promedio > AVG A.Costogroup by A.Nombre, A.Costo, AR.AreaIDorder by Promedio desc;