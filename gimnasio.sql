CREATE DATABASE gimnasio;
/-- B4.1
SELECT s.nombre, p.nombre, p.precio_mensual 
FROM socios s 
JOIN planes p ON s.plan_id = p.id 
ORDER BY s.nombre;
/--B4.2
SELECT c.actividad, c.fecha_hora, c.sala, m.nombre AS monitor
FROM clases c
JOIN monitores m ON c.monitor_id = m.id
ORDER BY c.fecha_hora;
//--B4.3
SELECT s.nombre, t.codigo
FROM socios s
LEFT JOIN tarjetas t ON s.id = t.socio_id;
//--B4.4
SELECT s.nombre
From socios s
LEFT JOIN tarjetas t ON s.id = t.socio_id
WHERE t.id IS NULL;
//--B4.5
SELECT p.nombre, COUNT(s.id) AS total_socios
FROM planes p
LEFT JOIN socios s ON p.id = s.plan_id
GROUP BY p.id, p.nombre;
//--B4.6 
SELECT s.nombre, c.actividad, c.fecha_hora 
FROM reservas r 
JOIN socios s ON r.socio_id = s.id 
JOIN clases c ON r.clase_id = c.id;
//-B4.7
SELECT s.nombre 
FROM reservas r 
JOIN socios s ON r.socio_id = s.id 
WHERE r.clase_id = 1;
//--B4.8
SELECT c.actividad, c.fecha_hora, c.plazas, COUNT(r.id) AS total_reservas 
FROM clases c 
LEFT JOIN reservas r ON c.id = r.clase_id 
GROUP BY c.id, c.actividad, c.fecha_hora, c.plazas;
//--B4.9
SELECT m.nombre 
FROM monitores m 
LEFT JOIN clases c ON m.id = c.monitor_id 
WHERE c.id IS NULL;
//--B4.10
SELECT m.nombre AS monitor, e.nombre AS especialidad 
FROM monitores m 
JOIN monitor_especialidades me ON m.id = me.monitor_id 
JOIN especialidades e ON me.especialidad_id = e.id;