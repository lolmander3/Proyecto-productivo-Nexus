/* ************************************************************************************* */
/* ---------------------------------------- DML ---------------------------------------- */
/* ---------------------------- DATA MANIPULATION LANGUAGE ----------------------------- */
/* ------------------------- LENGUAJE DE MANIPULACIÓN DE DATOS ------------------------- */
/* ------------------------------------- UNA TABLA ------------------------------------- */
/* ------------------------- ADAPTADO PARA BASE DE DATOS NEXUS -------------------------- */
/* ************************************************************************************* */

/* ************************************************************************************* */
/* -------------------------- 1. CONSULTAS DE ACCIÓN [Inicio] -------------------------- */
/* ---------------------------- INSERT INTO, UPDATE, DELETE ---------------------------- */
/* ************************************************************************************* */

-- ------------------------------------------------------------------------------------- --
-- 1.1. Crear o Registrar. ------------------------------------------------------------- --
--      INSERT INTO __ VALUES ( __ , __ ) : -------------------------------------------- --
-- ------------------------------------------------------------------------------------- --

-- ------------------------------------------------------------------------------------- --
-- 1.1.1. Datos Correctos -------------------------------------------------------------- --
--        Ver Archivo '1_dml_insercion.sql' : ------------------------------------------ --
-- ------------------------------------------------------------------------------------- --

-- ------------------------------------------------------------------------------------- --
-- 1.1.2. Datos Incorrectos (Ejemplos de inserciones válidas para Nexus) --------------- --
--        INSERT INTO __ VALUES ( __ , __ ) : ------------------------------------------ --
-- ------------------------------------------------------------------------------------- --

-- Inserción de un nuevo usuario
INSERT INTO USUARIO VALUES 
(NULL, 'juan.perez', 'juan.perez@gmail.com', SHA1('password123'), 'Perez', DEFAULT);

-- Inserción de roles
INSERT INTO ROL VALUES 
(1, 'Administrador'),
(2, 'Cliente'),
(3, 'Empresa');

-- Inserción de categorías
INSERT INTO CATEGORIA VALUES 
(NULL, 'Electrónica', 'Productos electrónicos y gadgets'),
(NULL, 'Ropa', 'Prendas de vestir para toda la familia'),
(NULL, 'Hogar', 'Artículos para el hogar y decoración');

-- Inserción de empresa
INSERT INTO EMPRESA VALUES 
(1, NULL, 'contacto@techcorp.com', 'logo_techcorp.png', 'TechCorp S.A.S.', 
 'Empresa líder en tecnología', 'Calle 123 #45-67, Bogotá', NOW());

-- Inserción de productos
INSERT INTO PRODUCTO VALUES 
(NULL, 1, 'Smartphone X100', 1500000, DEFAULT, 50, 'DISPONIBLE', 'smartphone.jpg', 'Producto');

-- Inserción de reseña
INSERT INTO RESENA VALUES 
(NULL, 1, 'Excelente producto, muy recomendado', 5, DEFAULT);

-- Inserción de eventos
INSERT INTO EVENTOS VALUES 
(NULL, 'Lanzamiento Producto 2025', 'Evento de lanzamiento de nuevos productos', 
 '2025-05-20', '18:00:00', 'Centro de Convenciones', 'ACTIVO', DEFAULT, 1, 1);

-- Inserción de reportes
INSERT INTO TIP_REPORTE VALUES 
(1, 'Producto Defectuoso', 'Reporte de producto que no funciona correctamente'),
(2, 'Publicidad Engañosa', 'Reporte de descripción de producto falsa');

INSERT INTO REPORTES VALUES 
(1, 1, 1, 'El producto llegó dañado', NOW(), 1);

-- ------------------------------------------------------------------------------------- --
-- 1.2. Actualizar. -------------------------------------------------------------------- --
--      UPDATE __ SET __ = __ WHERE __ = __ : ------------------------------------------ --
-- ------------------------------------------------------------------------------------- --

-- Actualizar correo de un usuario
UPDATE USUARIO SET 
CORREO_USUARIO = 'juan.perez.nuevo@gmail.com'
WHERE idUSUARIO = 1;

-- Actualizar stock de un producto
UPDATE PRODUCTO SET 
STOCK = 45,
ESTADO_ITEM = 'AGOTADO'
WHERE idPRODUCTO = 1;

-- Actualizar descripción de categoría
UPDATE CATEGORIA SET 
DESC_CATEGORIA = 'Productos electrónicos, gadgets y accesorios tecnológicos'
WHERE idCATEGORIA = 1;

-- ------------------------------------------------------------------------------------- --
-- 1.3. Eliminar. ---------------------------------------------------------------------- --
--      DELETE FROM __ WHERE __ = __ : ------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --

-- Eliminar una reseña específica (las eliminaciones en cascada están configuradas)
DELETE FROM RESENA 
WHERE idRESENA = 1;

-- Eliminar un reporte
DELETE FROM REPORTES 
WHERE idREPORTES = 1;

/* ************************************************************************************* */
/* ----------------------------- 2. CONSULTAS DE SELECCIÓN ----------------------------- */
/* --------------------------------------- SELECT -------------------------------------- */
/* ************************************************************************************* */

-- ------------------------------------------------------------------------------------- --
-- 2.1. Generales. --------------------------------------------------------------------- --
--      SELECT * FROM __ : ------------------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT * FROM USUARIO;
SELECT * FROM ROL;
SELECT * FROM CATEGORIA;
SELECT * FROM EMPRESA;
SELECT * FROM PRODUCTO;
SELECT * FROM RESENA;
SELECT * FROM EMPRESA_PRODUCTOS;
SELECT * FROM USUARIO_ROL;
SELECT * FROM EVENTOS;
SELECT * FROM RESENA_USUARIO;
SELECT * FROM TIP_REPORTE;
SELECT * FROM REPORTES;

-- ------------------------------------------------------------------------------------- --
-- 2.2. Específicas. ------------------------------------------------------------------- --
--      SELECT __ , __ FROM __ : ------------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT idUSUARIO, NOM_USUARIO, CORREO_USUARIO FROM USUARIO;

-- ------------------------------------------------------------------------------------- --
-- 2.3. Con Criterios. ----------------------------------------------------------------- --
--      SELECT __ , __ FROM __ WHERE __ = __ : ----------------------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT idPRODUCTO, NOM_PRODUCTO, PRECIO, STOCK FROM PRODUCTO
WHERE idCATEGORIA = 1;

-- ------------------------------------------------------------------------------------- --
-- 2.4. Con Operadores Lógicos. -------------------------------------------------------- --
--      OR, AND, NOT : ----------------------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --

-- ------------------------------------------------------------------------------------- --
-- 2.4.1. O [OR] . --------------------------------------------------------------------- --
--        SELECT __ , __ FROM __ WHERE __ = __ OR __ = __ : ---------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT idPRODUCTO, NOM_PRODUCTO, PRECIO, idCATEGORIA FROM PRODUCTO 
WHERE idCATEGORIA = 1 OR idCATEGORIA = 2;

-- ------------------------------------------------------------------------------------- --
-- 2.4.2. Y [AND] . -------------------------------------------------------------------- --
--        SELECT __ , __ FROM __ WHERE __ = __ AND __ = __ : --------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT idEVENTOS, TITULO, LUGAR, ESTADO FROM EVENTOS 
WHERE LUGAR = 'Centro de Convenciones' AND ESTADO = 'ACTIVO';

-- ------------------------------------------------------------------------------------- --
-- 2.4.3. NO [NOT] . ------------------------------------------------------------------- --
--        SELECT __ , __ FROM __ WHERE __ = __ AND __ = __ : --------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT idEVENTOS, TITULO, LUGAR, ESTADO FROM EVENTOS 
WHERE LUGAR NOT IN ('Centro de Convenciones');

-- ------------------------------------------------------------------------------------- --
-- 2.5. Con Operadores de Comparación. ------------------------------------------------- --
--      <>, <, <=, >, >= : ------------------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --

-- ------------------------------------------------------------------------------------- --
-- 2.5.1. Diferente [<>] . ------------------------------------------------------------- --
--        SELECT __ , __ FROM __ WHERE __ <> __ : -------------------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT * FROM PRODUCTO WHERE PRECIO <> 1500000;

-- ------------------------------------------------------------------------------------- --
-- 2.5.2. Menor que [<] . -------------------------------------------------------------- --
--        SELECT __ , __ FROM __ WHERE __ < __ : --------------------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT * FROM PRODUCTO WHERE PRECIO < 1500000;

-- ------------------------------------------------------------------------------------- --
-- 2.5.3. Mayor que [>] . -------------------------------------------------------------- --
--        SELECT __ , __ FROM __ WHERE __ > __ : --------------------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT * FROM PRODUCTO WHERE PRECIO > 1500000;

-- ------------------------------------------------------------------------------------- --
-- 2.5.4. Menor o igual que [<=] . ----------------------------------------------------- --
--        SELECT __ , __ FROM __ WHERE __ > __ : --------------------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT * FROM PRODUCTO WHERE PRECIO <= 1500000;

-- ------------------------------------------------------------------------------------- --
-- 2.5.5. Mayor o igual que [>=] . ----------------------------------------------------- --
--        SELECT __ , __ FROM __ WHERE __ > __ : --------------------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT * FROM PRODUCTO WHERE PRECIO >= 1500000;

-- ------------------------------------------------------------------------------------- --
-- 2.6. Con otros Operadores. ---------------------------------------------------------- --
--      LIKE, BETWEEN, IN -------------------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --

-- ------------------------------------------------------------------------------------- --
-- 2.6.1. Comodín [LIKE '_%'] . -------------------------------------------------------- --
--        SELECT __ , __ FROM __ WHERE __ LIKE '_%' : ---------------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT * FROM PRODUCTO WHERE NOM_PRODUCTO LIKE 'S%';

SELECT * FROM PRODUCTO WHERE NOM_PRODUCTO LIKE '_m%';

-- ------------------------------------------------------------------------------------- --
-- 2.6.2. Entre [BETWEEN] . ------------------------------------------------------------ --
--        SELECT __ , __ FROM __ WHERE __ BETWEEN __ AND __ : -------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT * FROM EVENTOS 
WHERE FECHA_EVENTO BETWEEN '2025-05-01' AND '2025-05-31';

-- Misma consulta sin BETWEEN
SELECT * FROM EVENTOS 
WHERE FECHA_EVENTO >= '2025-05-01' AND FECHA_EVENTO <= '2025-05-31';

-- ------------------------------------------------------------------------------------- --
-- 2.6.3. Lista [IN ( __ )] . ---------------------------------------------------------- --
--        SELECT __ , __ FROM __ WHERE __ IN( __ , __ ) : ------------------------------ --
-- ------------------------------------------------------------------------------------- --
SELECT * FROM PRODUCTO 
WHERE idCATEGORIA IN (1, 2);

-- ------------------------------------------------------------------------------------- --
-- 2.7. Ordenadas. --------------------------------------------------------------------- --
--      ORDER BY, ASC, DESC : ---------------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --

-- ------------------------------------------------------------------------------------- --
-- 2.7.1. Ascendente [ASC] . ----------------------------------------------------------- --
--        SELECT __ , __ FROM __ WHERE __ = __ ORDER BY __ ASC; : ---------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT * FROM PRODUCTO 
WHERE idCATEGORIA = 1 
ORDER BY PRECIO ASC;

SELECT * FROM PRODUCTO
WHERE idCATEGORIA = 1 OR idCATEGORIA = 2 
ORDER BY idCATEGORIA ASC;

SELECT * FROM PRODUCTO
WHERE idCATEGORIA = 1 OR idCATEGORIA = 2 
ORDER BY PRECIO ASC;

-- ------------------------------------------------------------------------------------- --
-- 2.7.2. Descendente [DESC] . --------------------------------------------------------- --
--        SELECT __ , __ FROM __ WHERE __ = __ ORDER BY __ DESC; : ---------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT * FROM PRODUCTO 
WHERE idCATEGORIA = 1 
ORDER BY PRECIO DESC;

SELECT * FROM PRODUCTO
WHERE idCATEGORIA = 1 OR idCATEGORIA = 2 
ORDER BY idCATEGORIA DESC;

SELECT * FROM PRODUCTO
WHERE idCATEGORIA = 1 OR idCATEGORIA = 2 
ORDER BY PRECIO DESC;

-- ------------------------------------------------------------------------------------- --
-- 2.7.3. Combinadas . ----------------------------------------------------------------- --
--        SELECT __ , __ FROM __ WHERE __ = __ ORDER BY __ ASC, __ DESC; : ------------- --
-- ------------------------------------------------------------------------------------- --
SELECT * FROM PRODUCTO 
WHERE idCATEGORIA = 1 OR idCATEGORIA = 2 
ORDER BY idCATEGORIA ASC, PRECIO DESC;

-- ------------------------------------------------------------------------------------- --
-- 2.8. Calculadas con Funciones. ------------------------------------------------------ --
--      GROUP BY : --------------------------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --

-- ------------------------------------------------------------------------------------- --
-- 2.8.1. Suma [SUM()] . --------------------------------------------------------------- --
--        SELECT __ , SUM( __ ) FROM __ GROUP BY __ : ---------------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT SUM(STOCK) FROM PRODUCTO;

SELECT idCATEGORIA, SUM(STOCK) FROM PRODUCTO 
WHERE idCATEGORIA = 1;

SELECT idCATEGORIA, SUM(STOCK) FROM PRODUCTO 
GROUP BY idCATEGORIA;

-- ------------------------------------------------------------------------------------- --
-- 2.8.2. Promedio [AVG()] . ----------------------------------------------------------- --
--        SELECT __ , AVG( __ ) FROM __ GROUP BY __ : ---------------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT idCATEGORIA, AVG(PRECIO) FROM PRODUCTO 
WHERE idCATEGORIA = 1;

SELECT idCATEGORIA, AVG(PRECIO) FROM PRODUCTO 
GROUP BY idCATEGORIA;

-- ------------------------------------------------------------------------------------- --
-- 2.8.3. Máximo [MAX()] . ------------------------------------------------------------- --
--        SELECT __ , MAX( __ ) FROM __ GROUP BY __ : ---------------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT idCATEGORIA, MAX(PRECIO) FROM PRODUCTO 
WHERE idCATEGORIA = 1;

SELECT idCATEGORIA, MAX(PRECIO) FROM PRODUCTO 
GROUP BY idCATEGORIA;

-- ------------------------------------------------------------------------------------- --
-- 2.8.4. Mínimo [MIN()] . ------------------------------------------------------------- --
--        SELECT __ , MIN( __ ) FROM __ GROUP BY __ : ---------------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT idCATEGORIA, MIN(PRECIO) FROM PRODUCTO 
WHERE idCATEGORIA = 1;

SELECT idCATEGORIA, MIN(PRECIO) FROM PRODUCTO 
GROUP BY idCATEGORIA;

-- ------------------------------------------------------------------------------------- --
-- 2.8.5. Conteo [COUNT()] . ----------------------------------------------------------- --
--        SELECT __ , COUNT( __ ) FROM __ GROUP BY __ : -------------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT ESTADO, COUNT(idEVENTOS) FROM EVENTOS 
WHERE ESTADO = 'ACTIVO';

SELECT ESTADO, COUNT(idEVENTOS) FROM EVENTOS 
GROUP BY ESTADO;

-- ------------------------------------------------------------------------------------- --
-- 2.9. Calculadas con Alias. ---------------------------------------------------------- --
--      SELECT __ , FUN( __ ) AS __ : -------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT SUM(STOCK) AS stock_total FROM PRODUCTO;

SELECT idCATEGORIA, SUM(STOCK) AS stock_total
FROM PRODUCTO 
GROUP BY idCATEGORIA
ORDER BY stock_total ASC;

SELECT idCATEGORIA, AVG(PRECIO) AS precio_promedio
FROM PRODUCTO 
GROUP BY idCATEGORIA
ORDER BY precio_promedio DESC;

SELECT idCATEGORIA, MAX(PRECIO) AS precio_maximo
FROM PRODUCTO 
GROUP BY idCATEGORIA
ORDER BY precio_maximo DESC;

SELECT idCATEGORIA, MIN(PRECIO) AS precio_minimo
FROM PRODUCTO 
GROUP BY idCATEGORIA
ORDER BY precio_minimo ASC;

SELECT ESTADO, COUNT(idEVENTOS) AS cantidad_eventos
FROM EVENTOS 
GROUP BY ESTADO
ORDER BY cantidad_eventos DESC;

-- ------------------------------------------------------------------------------------- --
-- 2.10. Calculadas Condicionantes (HAVING). ------------------------------------------- --
--      SELECT __ , FUN( __ ) AS __ FROM __ GROUP BY __ HAVING __ = __ OR __ = __ : ---- --
-- ------------------------------------------------------------------------------------- --
SELECT ESTADO, COUNT(idEVENTOS) AS cantidad_eventos
FROM EVENTOS 
GROUP BY ESTADO 
HAVING ESTADO = 'ACTIVO' OR ESTADO = 'FINALIZADO'
ORDER BY cantidad_eventos DESC;

SELECT idCATEGORIA, AVG(PRECIO) AS precio_promedio
FROM PRODUCTO 
GROUP BY idCATEGORIA 
HAVING AVG(PRECIO) > 1000000
ORDER BY precio_promedio DESC;

-- ------------------------------------------------------------------------------------- --
-- 2.11. Calculadas con Operadores. ---------------------------------------------------- --
--        SELECT __ , __ , __*0.19 AS __ FROM __ : ------------------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT NOM_PRODUCTO, PRECIO, PRECIO * 0.19 AS iva_producto 
FROM PRODUCTO;

SELECT NOM_PRODUCTO, PRECIO, ROUND(PRECIO * 0.19, 2) AS iva_producto 
FROM PRODUCTO;

-- ------------------------------------------------------------------------------------- --
-- 2.12. Calculadas con Fechas. -------------------------------------------------------- --
--       NOW(), DATE_FORMAT(), TIMESTAMPDIFF() : --------------------------------------- --
-- ------------------------------------------------------------------------------------- --

-- ------------------------------------------------------------------------------------- --
-- 2.12.1. Fecha Actual. --------------------------------------------------------------- --
--         SELECT __ , __ , NOW() AS __ FROM __ : -------------------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT NOM_PRODUCTO, PRECIO, NOW() FROM PRODUCTO;

SELECT NOM_PRODUCTO, PRECIO, NOW() AS fecha_actual FROM PRODUCTO;

-- ------------------------------------------------------------------------------------- --
-- 2.12.2. Formato de Fecha. ----------------------------------------------------------- --
--         SELECT __ , __ , DATE_FORMAT(NOW(), '%Y-%m-%d') AS __ FROM __ : ------------- --
-- ------------------------------------------------------------------------------------- --
SELECT NOM_PRODUCTO, PRECIO, 
DATE_FORMAT(NOW(), '%Y-%m-%d') AS fecha_actual 
FROM PRODUCTO;

-- ------------------------------------------------------------------------------------- --
-- 2.12.3. Diferencia Fechas. ---------------------------------------------------------- --
--         SELECT __ , fecha , --------------------------------------------------------- --
--         DATE_FORMAT(NOW(), '%Y-%m-%d') AS __ , -------------------------------------- --
--         TIMESTAMPDIFF(DAY, __ , NOW()) AS __ , -------------------------------------- --
--         FROM __ : ------------------------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT idEVENTOS, TITULO, FECHA_EVENTO,
DATE_FORMAT(NOW(), '%Y-%m-%d') AS fecha_actual,
TIMESTAMPDIFF(YEAR, FECHA_EVENTO, NOW()) AS años_transcurridos,
TIMESTAMPDIFF(MONTH, FECHA_EVENTO, NOW()) AS meses_transcurridos, 
TIMESTAMPDIFF(DAY, FECHA_EVENTO, NOW()) AS dias_transcurridos
FROM EVENTOS;

-- ------------------------------------------------------------------------------------- --
-- 2.13. Consultas Adicionales para Nexus --------------------------------------------- --
-- ------------------------------------------------------------------------------------- --

-- Productos con nombre de categoría (JOIN implícito)
SELECT p.NOM_PRODUCTO, p.PRECIO, c.NOM_CATEGORIA 
FROM PRODUCTO p, CATEGORIA c 
WHERE p.idCATEGORIA = c.idCATEGORIA;

-- Reseñas de productos con nombre de usuario (requiere unir varias tablas)
SELECT r.COMENTARIO, r.CALIFICACION, p.NOM_PRODUCTO, u.NOM_USUARIO
FROM RESENA r
JOIN PRODUCTO p ON r.idPRODUCTO = p.idPRODUCTO
JOIN RESENA_USUARIO ru ON r.idRESENA = ru.idRESENA
JOIN USUARIO u ON ru.idUSUARIO = u.idUSUARIO;

-- Eventos activos próximos
SELECT TITULO, FECHA_EVENTO, LUGAR 
FROM EVENTOS 
WHERE ESTADO = 'ACTIVO' AND FECHA_EVENTO >= CURDATE()
ORDER BY FECHA_EVENTO ASC;

/* ************************************************************************************* */
/* -------------------------- 3. CONSULTAS DE ACCIÓN [Final] --------------------------- */
/* ---------------------------- INSERT INTO, UPDATE, DELETE ---------------------------- */
/* ************************************************************************************* */

-- Inserción completa de un nuevo usuario con rol
INSERT INTO USUARIO VALUES 
(NULL, 'maria.gomez', 'maria.gomez@hotmail.com', SHA1('securepass'), 'Gomez', DEFAULT);

-- Asignar rol al usuario recién creado (asumiendo idUSUARIO = 2)
INSERT INTO USUARIO_ROL VALUES 
(1, 2, 2); -- idUSUARIO_ROL, idUSUARIO=2, idROL=2 (Cliente)

-- Inserción de evento con fecha formateada
INSERT INTO EVENTOS VALUES 
(NULL, 'Webinar Tecnología 2025', 'Evento virtual sobre nuevas tecnologías', 
'2025-06-15', '10:00:00', 'Plataforma Virtual', 'ACTIVO', DEFAULT, 1, 1);

-- Inserción de producto con valores calculados (IVA implícito en precio)
INSERT INTO PRODUCTO VALUES 
(NULL, 2, 'Camiseta Deportiva', 80000, DEFAULT, 100, 'DISPONIBLE', 'camiseta.jpg', 'Producto');

