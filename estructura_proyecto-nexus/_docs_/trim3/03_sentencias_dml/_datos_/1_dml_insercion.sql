/* ************************************************************************************* */
/* ---------------------------------------- DML ---------------------------------------- */
/* ---------------------------- DATA MANIPULATION LANGUAGE ----------------------------- */
/* ------------------------- LENGUAJE DE MANIPULACIÓN DE DATOS ------------------------- */
/* ------------------------------------- UNA TABLA ------------------------------------- */
/* ------------------------------------------------------------------------------------- */
/* ************************************************************************************* */
/* ------------------------------------------------------------------------------------- */
/* 1. CONSULTAS DE ACCIÓN [Inicio] : . INSERT INTO, UPDATE, DELETE                       */
/* 1.1. Crear o Registrar : .......... INSERT INTO __ VALUES ( __ , __ )                 */
/* 1.1.1. Datos Correctos : .......... INSERT INTO __ VALUES ( __ , __ )                 */
/* ------------------------------------------------------------------------------------- */
/* BIBLIOGRAFÍA                                                                          */
/* ------------------------------------------------------------------------------------- */
/* ************************************************************************************* */

Use Nexus;

-- -----------------------------------------------------
-- Tabla ROL
-- -----------------------------------------------------
SET FOREIGN_KEY_CHECKS=0;
TRUNCATE TABLE ROL;
INSERT INTO ROL (idROL, NOM_ROL) VALUES 
(1, 'Administrador'),
(2, 'Usuario'),
(3, 'Emprendedor');

-- -----------------------------------------------------
-- Tabla USUARIO 
-- -----------------------------------------------------
insert into USUARIO (idUSUARIO,NOM_USUARIO, CORREO_USUARIO, CONTRASENA, APELLIDO) 
values 
(1,'admin','admin@gmail.com',sha1('password'),'istrador'),
(2,'admin2','admin2@gmail.com',sha1('password'),'istrador2'),
(3,'usuario','usuario@gmail.com',sha1('password'),'usador'),
(4,'empresario','empresario@gmail.com',sha1('password'),'remires'),
(5,'usuario2','usuario2@gmail.com',sha1('password'),'usador2'),
(6,'usuario3','usuario3@gmail.com',sha1('password'),'usador3'),
(7,'usuario4','usuario4@gmail.com',sha1('password'),'usador4'),
(8,'empresario2','empresario2@gmail.com',sha1('password'),'remires'),
(9,'empresario3','empresario3@gmail.com',sha1('password'),'remires'),
(10,'empresario4','empresario4@gmail.com',sha1('password'),'remires');
-- -----------------------------------------------------
-- Tabla CATEGORIA
-- -----------------------------------------------------
insert into CATEGORIA (idCATEGORIA, NOM_CATEGORIA, DESC_CATEGORIA) VALUES  
(1,'Tecnología','Productos relacionados con la tecnología, como computadoras, teléfonos inteligentes, etc.'),
(2,'Alimentos','Productos alimenticios y bebidas.'),
(3,'Moda','Ropa, calzado y accesorios de moda.'),
(4,'Deportes','Equipamiento deportivo y ropa relacionada con deportes.'),
(5,'Salud y Belleza','Productos relacionados con la salud y la belleza, como cosméticos, cuidado personal, etc.'),
(6,'Automotriz','Productos relacionados con automóviles, como repuestos, accesorios, etc.'),
(7,'Libros','Libros de diversos géneros y categorías.');
------------------------------------------------------
-- Tabla EMPRESA
-------------------------------------------------------
insert into EMPRESA (idEMPRESA, idUSUARIO, CORREO_EMPRESA, LOGO, NOMBRE_EMPRESA, DESCRIPCION, DIRECCION, FECHA_REGISTRO) values 
(1,4,'empresario@gmail.com','logo.jpg','Empresa J.J.','Descripción de la empresa','calle falsa s d39 #87','2025-01-01'),
(2,8,'empresario2@gmail.com','logo2.jpg','Empresa A.B.','Descripción de la empresa','calle verdadera h d40 #88','2025-01-02'),
(3,9,'empresario3@gmail.com','logo3.jpg','Empresa C.D.','Descripción de la empresa','calle principal d d41 #89','2025-01-03'),
(4,10,'empresario4@gmail.com','logo4.jpg','Empresa E.F.','Descripción de la empresa','calle secundaria r d42 #90','2025-01-04');
------------------------------------------------------
-- Tabla PRODUCTO
-------------------------------------------------------
SET FOREIGN_KEY_CHECKS=0;
TRUNCATE TABLE PRODUCTO;
INSERT INTO PRODUCTO (idCATEGORIA, idPRODUCTO, NOM_PRODUCTO, PRECIO, DIA_PUBLICACION, STOCK, ESTADO_ITEM, IMAGEN_PRODUCTO, TIPO_ITEM) VALUES  
(1, 1, 'Laptop', 700000, '2025-01-01', 50, 'DISPONIBLE','laptop_pro.jpg','Producto'),
(2, 2, 'Sofá', 500000, '2025-01-02', 30,'AGOTADO','Sofa_cafe.png','Producto'),
(3, 3, 'Vestido', 80000, '2025-01-03', 100,'DISPONIBLE','Vestido_tirantes_rojo.jpg','Producto'),
(4, 4, 'Balón de fútbol', 300, '2025-01-04', 200,'AGOTADO','Balon_Verde_png','Producto'),
(5, 5, 'Chocolate', 1000, '2025-01-05', 500,'DISPONIBLE','Chocolate_png','Producto'),
(6, 6, 'Peluqueria', 25000, '2025-01-06', 75,'DISPONIBLE','Peluqueria_P.png','Servicio'),
(7, 7, 'Servicio mecanico', 200000, '2025-01-07', 25,'INACTIVO','mecanica_M.jpg','Servicio'),
(8, 8, 'Muñeca', 1500, '2025-01-08', 150,'DISPONIBLE','Muñeca_Barbie.png','Producto'),
(9, 9, 'Libro de ficción', 200, '2025-01-09', 300,'DISPONIBLE','Libro_principito.png','Producto'),
(10, 10, 'Videojuego', 6000, '2025-01-10', 80,'DISPONIBLE','videojuego_V.png','Producto'),
(11, 11, 'Servicio de limpieza', 100000, '2025-01-11', 10,'DISPONIBLE','Servicio_empresa.png','Servicio'),
(12, 12, 'Almendras', 1000, '2025-01-12', 60,'DISPONIBLE','Almendras_A.jpg','Producto');
SET FOREIGN_KEY_CHECKS=1;
-- -----------------------------------------------------
-- Tabla USUARIO_ROL
-- -----------------------------------------------------
-- Cambiamos los 4 por 3 para que apunten a 'Emprendedor'

-- 1. Limpiamos la tabla para que no haya duplicados
-- DELETE FROM USUARIO_ROL
-- 2. Insertamos SOLO los usuarios que existen (idUSUARIO del 1 al 10)
INSERT INTO USUARIO_ROL (idUSUARIO_ROL, idUSUARIO, idROL) VALUES  
(1, 1, 1),   -- admin → Administrador
(2, 2, 2),   -- admin2 → Usuario (si quieres)
(3, 3, 2),   -- usuario → Usuario
(4, 4, 3),   -- empresario → Emprendedor
(5, 5, 2),   -- usuario2 → Usuario
(6, 6, 2),   -- usuario3 → Usuario
(7, 7, 2),   -- usuario4 → Usuario
(8, 8, 3),   -- empresario2 → Emprendedor
(9, 9, 3),   -- empresario3 → Emprendedor
(10, 10, 3); -- empresario4 → Emprendedor
------------------------------------------------------
-- Tabla RESENA
-------------------------------------------------------
INSERT INTO RESENA (idPRODUCTO, COMENTARIO, CALIFICACION) VALUES 
(1, 'Excelente producto', 5),
(2, 'Muy cómodo', 4),
(3, 'El vestido es bonito pero la talla no es correcta', 3),
(4, 'Perfecto para jugar al fútbol', 5),
(5, 'Delicioso chocolate', 4),
(6, 'No me gustó la crema facial', 2),
(7, 'Los neumáticos son de buena calidad', 4),
(8, 'La muñeca es bonita pero se rompió fácilmente', 3),
(9, 'El libro de ficción es muy entretenido', 5),
(10, 'El videojuego es divertido pero tiene algunos errores', 4),
(11, 'El servicio de limpieza fue excelente', 5),
(12, 'El producto diverso es útil pero un poco caro', 3),
(1, 'Buen producto pero un poco caro', 4),
(2, 'Muy cómodo y de buena calidad', 5),
(3, 'El vestido es bonito pero la talla no es correcta y el material es de baja calidad', 2),
(4, 'Perfecto para jugar al fútbol pero se desinfla fácilmente', 4),
(5, 'Delicioso chocolate pero un poco dulce para mi gusto', 3),
(6, 'No me gustó la crema facial y me causó irritación en la piel', 1),
(7, 'Los neumáticos son de excelente calidad y duraderos', 5),
(8, 'La muñeca es bonita y de buena calidad pero se rompió fácilmente', 4),
(9, 'El libro de ficción es entretenido pero tiene algunos errores gramaticales', 4),
(10, 'El videojuego es divertido pero tiene algunos errores que afectan la jugabilidad', 3),
(11, 'El servicio de limpieza fue bueno pero llegó un poco tarde', 4),
(12, 'El producto diverso es útil pero un poco caro y no cumple todas mis expectativas', 2);
-- Reseña usuario: Relaciona usuarios con sus reseñas
INSERT INTO RESENA_USUARIO (idRESENA, idUSUARIO) VALUES 
(1, 5), (2, 7), (3, 8), (4, 9), (5, 10), (6, 5), (7, 7), (8, 8), (9, 9), (10, 10), 
(11, 5), (12, 7), (13, 8), (14, 9), (15, 10), (16, 5), (17, 7), (18, 8), (19, 9), (20, 10), 
(21, 5), (22, 7), (23, 8), (24, 9);
-- -----------------------------------------------------
-- Tabla EMPRESA_PRODUCTO
-- -----------------------------------------------------
insert into EMPRESA_PRODUCTOS (idEMPRESA, idPRODUCTO) values 
(1, 1), -- Empresa J.J. - Laptop
(1, 2), -- Empresa J.J. - Sofá
(2, 3), -- Empresa A.B. - Vestido
(2, 4), -- Empresa A.B. - Balón de fútbol
(3, 5), -- Empresa C.D. - Chocolate
(3, 6), -- Empresa C.D. - Crema facial
(4, 7), -- Empresa E.F. - Neumáticos
(4, 8), -- Empresa E.F. - Muñeca
(1, 9), -- Empresa J.J. - Libro de ficción
(1, 10), -- Empresa J.J. - Videojuego
(2, 11), -- Empresa A.B. - Servicio de limpieza
(2, 12); -- Empresa A.B. - Producto diverso

-- Tabla Evento
-- -----------------------------------------------------
INSERT INTO EVENTOS (TITULO, DESCRIPCION, FECHA_EVENTO, LUGAR, ESTADO, idUSUARIO, idEMPRESA) VALUES 
('Compra Laptop', 'El usuario compró el producto Laptop', '2025-01-01', 'Online', 'FINALIZADO', 5, 1),
('Compra Sofá', 'El usuario compró el producto Sofá', '2025-01-02', 'Online', 'FINALIZADO', 7, 2),
('Compra Vestido', 'El usuario compró el producto Vestido', '2025-01-03', 'Online', 'FINALIZADO', 8, 3),
('Compra Balón', 'El usuario compró el producto Balón de fútbol', '2025-01-04', 'Online', 'FINALIZADO', 9, 4),
('Compra Chocolate', 'El usuario compró el producto Chocolate', '2025-01-05', 'Online', 'FINALIZADO', 10, 1),
('Compra Crema', 'El usuario compró el producto Crema facial', '2025-01-06', 'Online', 'FINALIZADO', 5, 2),  -- Cambiado 11→5
('Compra Neumáticos', 'El usuario compró el producto Neumáticos', '2025-01-07', 'Online', 'FINALIZADO', 7, 3),  -- Cambiado 12→7
('Compra Muñeca', 'El usuario compró el producto Muñeca', '2025-01-08', 'Online', 'FINALIZADO', 8, 4),
('Compra Libro', 'El usuario compró el producto Libro de ficción', '2025-01-09', 'Online', 'FINALIZADO', 9, 1),
('Compra Videojuego', 'El usuario compró el producto Videojuego', '2025-01-10', 'Online', 'FINALIZADO', 10, 2),
('Compra Servicio', 'El usuario compró el servicio de limpieza', '2025-01-11', 'Online', 'FINALIZADO', 5, 3),  -- Cambiado 9→5
('Compra Producto', 'El usuario compró el producto diverso', '2025-01-12', 'Online', 'FINALIZADO', 7, 4),  -- Cambiado 10→7
('Sorteo', 'El usuario participó en un sorteo', '2025-01-13', 'Online', 'ACTIVO', 8, 1),
('Feriado', 'El usuario celebró un feriado', '2025-01-14', 'Online', 'ACTIVO', 9, 2),
('Evento Especial', 'El usuario asistió a un evento especial', '2025-01-15', 'Online', 'ACTIVO', 10, 3),
('Descuento', 'Aproveche en descuentos en nuestra tienda', '2025-01-16', 'Online', 'ACTIVO', 5, 4);  -- Cambiado 9→5

-- 1. LIMPIEZA (De hijos a padres)
DELETE FROM REPORTES WHERE idREPORTES > 0;
DELETE FROM TIP_REPORTE WHERE idTIP_REPORTE > 0;


INSERT INTO TIP_REPORTE (idTIP_REPORTE, NOM_REPORTE, DESCRICION) VALUES  
(1, 'usuario toxico', 'Comportamiento agresivo'), 
(2, 'usuario acosador', 'Hostigamiento a otros'), 
(3, 'usuario spammer', 'Publicidad no deseada');


INSERT INTO REPORTES (idREPORTES, idTIP_REPORTE, idPRODUCTO, idUSUARIO, RAZON_REPORTE, REGISTRO_REPORTE) VALUES  
(1, 1, 1, 5, 'El usuario es tóxico', '2025-01-17 10:00:00'), 
(2, 2, 2, 7, 'Acoso constante', '2025-01-18 11:00:00');
-- -------------------------------------------------------
-- Fin de las inserciones
-- -------------------------------------------------------