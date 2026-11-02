CREATE DATABASE gimnasio;

SELECT s.nombre, p.nombre, p.precio_mensual 
FROM socios s 
JOIN planes p ON s.plan_id = p.id 
ORDER BY s.nombre;