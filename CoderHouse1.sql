-LEFT

select  LEFT(Nombre, 3) as Primeras_Nombre, Nombre, Documento from Estudiantes;

----CONCAT

Select Documento, CONCAT (Nombre, Apellido) as Concatenados from Estudiantes;


--REPLACE
Select Documento,Nombre,  REPLACE (Nombre, 'a', 'o') as Reemplazados from Estudiantes;

SELECT Nombre, Apellido, REPLACE(Telefono,'11','(001)') as phone_formatted
FROM   
Estudiantes
WHERE Telefono IS NOT NULL
ORDER BY Apellido;

--UPPER/LOWER

select UPPER(Nombre) FROM Estudiantes;

----DATEPART/DATENAME 
Select Nombre,[Fecha de Nacimiento] Apellido, DATENAME(MONTH,[Fecha de Nacimiento]) as Mes from Estudiantes;

--DATEADD
Select Apellido,[Fecha de Nacimiento], DATEADD(DAY, 2, [Fecha de Nacimiento]) as Fecha_nueva from Estudiantes;

--DATEDIFF
 
Select Apellido,[Fecha Ingreso], DATEDIFF(MONTH,[Fecha ingreso],GETDATE()) as Permanencia FROM Estudiantes;

select Apellido, [Fecha de Nacimiento], datediff(Day,[Fecha de Nacimiento],getdate())/(365) as Edad From Estudiantes;

--FLOOR
Select Nombre, Costo, FLOOR(Costo) as Costo from Asignaturas;


--CAST
Select Nombre, CAST(Costo AS INT) as Costo from Asignaturas;

--SUBCONSULTAS

SELECT *
FROM Asignaturas 
where Area = (SELECT AreaID FROM Area WHERE Nombre like ('%Marketing%'))
and Jornada ='Manana';