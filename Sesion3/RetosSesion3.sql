/*
Agrupaciones y Subconsultas
	Ramirez Mendez Kevin
	kramirezm1600@alumno.ipn.mx
*/
USE tienda;
SHOW TABLES;
DESCRIBE puesto;
DESCRIBE empleado;
DESCRIBE articulo;
DESCRIBE venta;

#Reto 1
#¿Cuál es el nombre de los empleados cuyo sueldo es menor a $10,000?
SELECT nombre 
FROM empleado 
WHERE id_puesto in (SELECT id_puesto FROM puesto WHERE salario > 10000);

#¿Cuál es la cantidad mínima y máxima de ventas de cada empleado?
SELECT id_empleado, MIN(cantidad) AS cantidad_min, MAX(cantidad) AS cantidad_max 
FROM (SELECT clave, id_empleado, COUNT(*) AS cantidad FROM venta GROUP BY clave, id_empleado) AS Subconsulta 
GROUP BY id_empleado;

#¿Cuáles claves de venta incluyen artículos cuyos precios son mayores a $5,000?
SELECT DISTINCT clave FROM venta 
WHERE id_articulo in (SELECT id_articulo FROM articulo WHERE precio > 5000);

#Reto 2
#¿Cuál es el nombre de los empleados que realizaron cada venta?
SELECT id_venta, CONCAT(nombre, ' ', apellido_paterno, ' ', apellido_materno) AS Nombre_Completo FROM empleado 
JOIN venta ON empleado.id_empleado = venta.id_empleado 
ORDER BY id_venta;

#¿Cuál es el nombre de los artículos que se han vendido?
SELECT nombre FROM articulo 
JOIN venta ON articulo.id_articulo = venta.id_articulo;

#¿Cuál es el total de cada venta?
SELECT clave, ROUND(SUM(precio),2) AS Suma_Venta FROM venta 
JOIN articulo ON venta.id_articulo = articulo.id_articulo 
GROUP BY clave ORDER BY clave;

#Reto 3
#Obtener el puesto de un empleado.
CREATE VIEW Puesto_Empleo_106 
AS (SELECT CONCAT(e.nombre, ' ', e.apellido_paterno, ' ', e.apellido_materno) AS Nombre_Completo, p.nombre 
FROM puesto AS p  JOIN empleado AS e ON p.id_puesto = e.id_empleado);
SELECT * FROM Puesto_Empleo_106;

#Saber qué artículos ha vendido cada empleado.
CREATE VIEW empleado_articulo_106 AS
(SELECT CONCAT(e.nombre, ' ', e.apellido_paterno, ' ', e.apellido_materno) 
AS Nombre_Completo, a.nombre FROM empleado AS e 
JOIN venta AS v ON e.id_empleado = v.id_empleado 
JOIN articulo AS a ON a.id_articulo = v.id_articulo 
ORDER BY e.id_empleado);
SELECT * FROM empleado_articulo_106;

#Saber qué puesto ha tenido más ventas.
CREATE VIEW puesto_venta_106 AS
(SELECT p.id_puesto, p.nombre, COUNT(v.clave) AS ventas_por_puesto
FROM puesto AS p 
JOIN empleado AS e ON p.id_puesto = e.id_puesto
JOIN venta AS v ON e.id_empleado = v.id_empleado
GROUP BY id_puesto
ORDER BY id_puesto);
SELECT * FROM puesto_venta_106 ORDER BY ventas_por_puesto DESC LIMIT 1;
