/*
Agrupaciones y subconsultas
	Ramirez Mendez Kevin
	kramirezm1600@alumno.ipn.mx
*/
USE tienda;
SHOW TABLES;
DESCRIBE venta;
/*
Reto #1
Usando la base de datos tienda, escribe consultas que permitan responder las siguientes preguntas.
a)¿Qué artículos incluyen la palabra Pasta en su nombre?
b)¿Qué artículos incluyen la palabra Cannelloni en su nombre?
c)¿Qué nombres están separados por un guión (-) por ejemplo Puree - Kiwi?
d)¿Qué puestos incluyen la palabra Designer?
e)¿Qué puestos incluyen la palabra Developer?
*/
SELECT * FROM articulo WHERE nombre LIKE '%Pasta%';
SELECT * FROM articulo WHERE nombre LIKE '%Cannelloni%';
SELECT * FROM articulo WHERE nombre LIKE '%-%';
SELECT * FROM puesto WHERE nombre LIKE '%Designer';
SELECT * FROM puesto WHERE nombre LIKE '%Developer%';
/*
Reto #2
Usando la base de datos tienda, escribe consultas que permitan responder las siguientes preguntas.
a)¿Cuál es el promedio de salario de los puestos?
b)¿Cuántos artículos incluyen la palabra Pasta en su nombre?
c)¿Cuál es el salario mínimo y máximo?
d)¿Cuál es la suma del salario de los últimos cinco puestos agregados?
*/
SELECT AVG(salario) AS 'Promedio' FROM puesto;
SELECT COUNT(*) AS 'Conteo_Pasta' FROM articulo WHERE nombre LIKE '%Pasta%';
SELECT MIN(salario) AS 'Salario_Minimo', MAX(salario) AS 'Salario_Maximo' FROM puesto;
#Forma 1
SELECT SUM(salario) AS 'Suma' FROM puesto WHERE id_puesto > (SELECT MAX(id_puesto) - 5 FROM puesto);
#Forma 2
SELECT sum(salario) sum FROM (SELECT salario FROM puesto ORDER BY id_puesto DESC limit 5) sal;
/*
Reto #3
Usando la base de datos tienda, escribe consultas que permitan responder las siguientes preguntas.
a)¿Cuántos registros hay por cada uno de los puestos?
b)¿Cuánto dinero se paga en total por puesto?
c)¿Cuál es el número total de ventas por vendedor?
d)¿Cuál es el número total de ventas por artículo?
*/
SELECT nombre, COUNT(*) AS total_Registros FROM puesto GROUP BY nombre;
SELECT nombre, SUM(salario) AS Pago_puesto FROM puesto GROUP BY nombre;
SELECT id_empleado, COUNT(*) AS Ventas_Vendedor FROM venta GROUP BY id_empleado;
SELECT id_articulo, COUNT(*) AS Ventas_Articulo FROM venta GROUP BY id_Articulo;
