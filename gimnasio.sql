-- Ejercicio B1.1: tabla de planes
-- Aquí guardo los distintos tipos de cuota del gimnasio.
CREATE TABLE planes (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    precio_mensual DECIMAL(6,2) NOT NULL
);

-- Ejercicio B1.2: tabla de socios
-- Cada socio tiene un plan, por eso guardo plan_id como clave foránea.
CREATE TABLE socios (
    id SERIAL PRIMARY KEY,
    dni VARCHAR(15) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    fecha_alta DATE NOT NULL,
    plan_id INTEGER NOT NULL,
    CONSTRAINT fk_socios_planes
        FOREIGN KEY (plan_id) REFERENCES planes(id)
);

-- Ejercicio B1.3: tabla de tarjetas
-- Cada tarjeta pertenece a un socio y un socio no puede tener dos tarjetas.
CREATE TABLE tarjetas (
    id SERIAL PRIMARY KEY,
    codigo VARCHAR(20) NOT NULL UNIQUE,
    activa BOOLEAN NOT NULL DEFAULT TRUE,
    socio_id INTEGER NOT NULL UNIQUE,
    CONSTRAINT fk_tarjetas_socios
        FOREIGN KEY (socio_id) REFERENCES socios(id)
);

-- Ejercicio B1.4: tabla de monitores
CREATE TABLE monitores (
    id SERIAL PRIMARY KEY,
    dni VARCHAR(15) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

-- Ejercicio B1.5: tabla de clases
-- Cada clase la imparte un monitor.
CREATE TABLE clases (
    id SERIAL PRIMARY KEY,
    actividad VARCHAR(50) NOT NULL,
    sala VARCHAR(30) NOT NULL,
    fecha_hora TIMESTAMP NOT NULL,
    plazas INTEGER NOT NULL CHECK (plazas > 0),
    monitor_id INTEGER NOT NULL,
    CONSTRAINT fk_clases_monitores
        FOREIGN KEY (monitor_id) REFERENCES monitores(id)
);

-- Ejercicio B1.6: tabla de reservas
-- Esta tabla relaciona socios con clases.
-- Un socio no puede reservar dos veces la misma clase.
CREATE TABLE reservas (
    id SERIAL PRIMARY KEY,
    socio_id INTEGER NOT NULL,
    clase_id INTEGER NOT NULL,
    fecha_reserva DATE NOT NULL,
    CONSTRAINT fk_reservas_socios
        FOREIGN KEY (socio_id) REFERENCES socios(id),
    CONSTRAINT fk_reservas_clases
        FOREIGN KEY (clase_id) REFERENCES clases(id),
    CONSTRAINT uq_reserva_socio_clase
        UNIQUE (socio_id, clase_id)
);

-- Ejercicio B1.7: tabla de especialidades
-- Aquí guardo las especialidades que pueden tener los monitores.
CREATE TABLE especialidades (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

-- Ejercicio B1.8: tabla intermedia de monitores y especialidades
-- La uso porque un monitor puede tener varias especialidades
-- y una especialidad puede pertenecer a varios monitores.
CREATE TABLE monitor_especialidades (
    id SERIAL PRIMARY KEY,
    monitor_id INTEGER NOT NULL,
    especialidad_id INTEGER NOT NULL,
    CONSTRAINT fk_me_monitores
        FOREIGN KEY (monitor_id) REFERENCES monitores(id),
    CONSTRAINT fk_me_especialidades
        FOREIGN KEY (especialidad_id) REFERENCES especialidades(id),
    CONSTRAINT uq_monitor_especialidad
        UNIQUE (monitor_id, especialidad_id)
);

-- =========================================
-- EJERCICIO B2: insertar los datos iniciales
-- =========================================

-- B2.1: insertar los planes
-- Sustituye los precios por los que aparecen en el enunciado.
INSERT INTO planes (id, nombre, precio_mensual) VALUES
(1, 'Básico', 19.90),
(2, 'Completo', 39.90),
(3, 'Estudiante', 15.90),
(4, 'Mañanas', 19.90);

-- B2.2: insertar los socios
INSERT INTO socios (id, dni, nombre, email, fecha_alta, plan_id) VALUES
(1, '11111111A', 'Ana Pérez', 'ana@gym.com', '2026-10-01', 2),
(2, '22222222B', 'Luis García', 'luis@gym.com', '2026-10-02', 1),
(3, '33333333C', 'Marta López', 'marta@gym.com', '2026-10-03', 3),
(4, '44444444D', 'Hugo Sanz', 'hugo@gym.com', '2026-10-04', 2),
(5, '55555555E', 'Lucía Ruiz', 'lucia@gym.com', '2026-10-05', 3),
(6, '66666666F', 'Pablo Martín', 'pablo@gym.com', '2026-10-06', 1),
(7, '77777777G', 'Sara Gil', 'sara@gym.com', '2026-10-07', 2),
(8, '88888888H', 'Diego Vidal', 'diego@gym.com', '2026-10-08', 1);

-- B2.3: insertar las tarjetas
-- Diego no tiene tarjeta, así que no aparece en este INSERT.
INSERT INTO tarjetas (id, codigo, activa, socio_id) VALUES
(1, 'TJ-0001', TRUE, 1),
(2, 'TJ-0002', TRUE, 2),
(3, 'TJ-0003', TRUE, 3),
(4, 'TJ-0004', FALSE, 4),
(5, 'TJ-0005', TRUE, 5),
(6, 'TJ-0006', TRUE, 6),
(7, 'TJ-0007', TRUE, 7);

-- B2.4: insertar los monitores
INSERT INTO monitores (id, dni, nombre, email) VALUES
(1, '10101010A', 'Carla Navarro', 'carla@gym.com'),
(2, '20202020B', 'Javier Ortega', 'javier@gym.com'),
(3, '30303030C', 'Elena Romero', 'elena@gym.com'),
(4, '40404040D', 'Rubén Castro', 'ruben@gym.com');

-- B2.5: insertar las clases
INSERT INTO clases (id, actividad, sala, fecha_hora, plazas, monitor_id) VALUES
(1, 'Spinning', 'Sala 1', '2026-11-02 09:00', 20, 1),
(2, 'Yoga', 'Sala 2', '2026-11-02 18:00', 15, 2),
(3, 'Pilates', 'Sala 3', '2026-11-03 10:00', 15, 3),
(4, 'Spinning', 'Sala 1', '2026-11-03 19:00', 20, 1),
(5, 'Zumba', 'Sala 2', '2026-11-04 18:30', 20, 3),
(6, 'Yoga', 'Sala 2', '2026-11-05 09:30', 15, 2),
(7, 'Crossfit', 'Sala 4', '2026-11-05 20:00', 12, 1);

-- B2.6: insertar las reservas
INSERT INTO reservas (id, socio_id, clase_id, fecha_reserva) VALUES
(1, 1, 1, '2026-10-28'),
(2, 1, 3, '2026-10-28'),
(3, 1, 7, '2026-10-29'),
(4, 2, 1, '2026-10-29'),
(5, 2, 2, '2026-10-29'),
(6, 3, 2, '2026-10-30'),
(7, 3, 5, '2026-10-30'),
(8, 4, 1, '2026-10-30'),
(9, 4, 7, '2026-10-31'),
(10, 5, 3, '2026-10-31'),
(11, 5, 5, '2026-10-31'),
(12, 6, 4, '2026-11-01'),
(13, 7, 5, '2026-11-01'),
(14, 7, 7, '2026-11-01');

-- B2.7: insertar las especialidades
INSERT INTO especialidades (id, nombre) VALUES
(1, 'Spinning'),
(2, 'Yoga'),
(3, 'Pilates'),
(4, 'Zumba'),
(5, 'Crossfit');

-- B2.8: relacionar los monitores con sus especialidades
INSERT INTO monitor_especialidades (id, monitor_id, especialidad_id) VALUES
(1, 1, 1),
(2, 1, 5),
(3, 2, 2),
(4, 3, 3),
(5, 3, 4);

-- B2.9: actualizar los contadores de los IDs automáticos
SELECT setval(pg_get_serial_sequence('planes', 'id'), (SELECT MAX(id) FROM planes));
SELECT setval(pg_get_serial_sequence('socios', 'id'), (SELECT MAX(id) FROM socios));
SELECT setval(pg_get_serial_sequence('tarjetas', 'id'), (SELECT MAX(id) FROM tarjetas));
SELECT setval(pg_get_serial_sequence('monitores', 'id'), (SELECT MAX(id) FROM monitores));
SELECT setval(pg_get_serial_sequence('clases', 'id'), (SELECT MAX(id) FROM clases));
SELECT setval(pg_get_serial_sequence('reservas', 'id'), (SELECT MAX(id) FROM reservas));
SELECT setval(pg_get_serial_sequence('especialidades', 'id'), (SELECT MAX(id) FROM especialidades));
SELECT setval(pg_get_serial_sequence('monitor_especialidades', 'id'), (SELECT MAX(id) FROM monitor_especialidades));


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