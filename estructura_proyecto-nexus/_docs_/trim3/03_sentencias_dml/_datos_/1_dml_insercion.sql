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

Use database_nexus;
SET FOREIGN_KEY_CHECKS=0;
-- -----------------------------------------------------
-- Tabla ROL
-- -----------------------------------------------------
insert into ROL (idROL, NOM_ROL) values 
(1,'Administrador'),
(2,'moderador'),
(3,'usuario'),
(4,'empresario');
-- -----------------------------------------------------
-- Tabla USUARIO 
-- -----------------------------------------------------
insert into USUARIO (NOM_USUARIO, CORREO_USUARIO, CONTRASENA, APELLIDO) 
values 
('admin','admin@gmail.com','password','istrador'),
('admin2','admin2@gmail.com','password','istrador2'),
('moderador','moderador@gmail.com','password','moderado'),
('moderador2','moderador2@gmail.com','password','moderado2'),
('usuario','usuario@gmail.com','password','usador'),
('empresario','empresario@gmail.com','password','remires'),
('usuario2','usuario2@gmail.com','password','usador2'),
('usuario3','usuario3@gmail.com','password','usador3'),
('usuario4','usuario4@gmail.com','password','usador4'),
('empresario2','empresario2@gmail.com','password','remires'),
('empresario3','empresario3@gmail.com','password','remires'),
('empresario4','empresario4@gmail.com','password','remires');
-- -----------------------------------------------------
-- Tabla CATEGORIA
-- -----------------------------------------------------
insert into CATEGORIA (NOM_CATEGORIA, DESC_CATEGORIA) values 
('Tecnología','Productos relacionados con la tecnología, como computadoras, teléfonos inteligentes, etc.'),
('Hogar','Productos para el hogar, como muebles, electrodomésticos, etc.'),
('Moda','Ropa, calzado y accesorios de moda.'),
('Deportes','Equipamiento deportivo y ropa relacionada con deportes.'),
('Alimentos','Productos alimenticios y bebidas.'),
('Salud y Belleza','Productos relacionados con la salud y la belleza, como cosméticos, cuidado personal, etc.'),
('Automotriz','Productos relacionados con automóviles, como repuestos, accesorios, etc.'),
('Juguetes','Juguetes para niños de todas las edades.'),
('Libros','Libros de diversos géneros y categorías.'),
('Música y Entretenimiento','Productos relacionados con la música, películas, videojuegos, etc.'),
('Servicios','Servicios diversos, como servicios de limpieza, reparación, etc.'),
('Otros','Categoría para productos que no encajan en las categorías anteriores.'),
('reporte de usuario','reportes de usuarios que han sido bloqueados por incumplir las normas de la comunidad'),
('reporte de producto','reportes de productos que han sido bloqueados por incumplir las normas de la comunidad'),
('reporte de empresa','reportes de empresas que han sido bloqueados por incumplir las normas de la comunidad'),
('reporte de RESENA','reportes de RESENAs que han sido bloqueados por incumplir las normas de la comunidad'),
('reporte de comentario','reportes de comentarios que han sido bloqueados por incumplir las normas de la comunidad'),
('reporte de respuesta','reportes de respuestas que han sido bloqueados por incumplir las normas de la comunidad');
------------------------------------------------------
-- Tabla EMPRESA
-------------------------------------------------------
insert into EMPRESA (idUSUARIO, CORREO_EMPRESA, LOGO, NOMBRE_EMPRESA, DESCRIPCION, DIRECCION, FECHA_REGISTRO) values 
(6,'empresario@gmail.com','logo.jpg','Empresa J.J.','Descripción de la empresa','calle falsa s d39 #87','2025-01-01'),
(10,'empresario2@gmail.com','logo2.jpg','Empresa A.B.','Descripción de la empresa','calle verdadera h d40 #88','2025-01-02'),
(11,'empresario3@gmail.com','logo3.jpg','Empresa C.D.','Descripción de la empresa','calle principal d d41 #89','2025-01-03'),
(12,'empresario4@gmail.com','logo4.jpg','Empresa E.F.','Descripción de la empresa','calle secundaria r d42 #90','2025-01-04');
------------------------------------------------------
-- Tabla PRODUCTO
-------------------------------------------------------
INSERT INTO PRODUCTO (idCATEGORIA, idRESEÑA, NOM_PRODUCTO, PRESIO, DIA_PUBLICACION, STOCK) VALUES 
(1, 1, 'Laptop', 1000000, '2025-01-01', 50),
(2, 2, 'Sofá', 500000, '2025-01-02', 30),
(3, 3, 'Vestido', 80000, '2025-01-03', 100),
(4, 4, 'Balón de fútbol', 300, '2025-01-04', 200),
(5, 5, 'Chocolate', 1000, '2025-01-05', 500),
(6, 6, 'Crema facial', 25000, '2025-01-06', 75),
(7, 7, 'Neumáticos', 200000, '2025-01-07', 25),
(8, 8, 'Muñeca', 1500, '2025-01-08', 150),
(9, 9, 'Libro de ficción', 200, '2025-01-09', 300),
(10, 10, 'Videojuego', 6000, '2025-01-10', 80),
(11, 11, 'Servicio de limpieza', 100000, '2025-01-11', 10),
(12, 12, 'Producto diverso', 50000, '2025-01-12', 60);
-- -----------------------------------------------------
-- Tabla USUARIO_ROL
-- -----------------------------------------------------
INSERT INTO USUARIO_ROL (idUSUARIO_ROL, idUSUARIO, idROL) VALUES 
(1, 1, 1), -- admin
(2, 2, 1), -- admin2
(3, 3, 2), -- moderador
(4, 4, 2), -- moderador2
(5, 5, 3), -- usuario
(6, 6, 4), -- empresario
(7, 7, 3), -- usuario2
(8, 8, 3), -- usuario3
(9, 9, 3), -- usuario4
(10, 10, 4), -- empresario2
(11, 11, 4), -- empresario3
(12, 12, 4); -- empresario4
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
(1, 5), (2, 7), (3, 8), (4, 9), (5, 10), (6, 11), (7, 12), (8, 5), (9, 7), (10, 8), (11, 9), (12, 10),
(13, 5), (14, 7), (15, 8), (16, 9), (17, 10), (18, 11), (19, 12), (20, 5), (21, 7), (22, 8), (23, 9), (24, 10);
-- -----------------------------------------------------
-- Tabla EMPRESA_PRODUCTO
-- -----------------------------------------------------
insert into EMPRESA_PRODUCTOS (idEMPRESA, idPRODUCTOS) values 
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
('Compra Crema', 'El usuario compró el producto Crema facial', '2025-01-06', 'Online', 'FINALIZADO', 11, 2),
('Compra Neumáticos', 'El usuario compró el producto Neumáticos', '2025-01-07', 'Online', 'FINALIZADO', 12, 3),
('Compra Muñeca', 'El usuario compró el producto Muñeca', '2025-01-08', 'Online', 'FINALIZADO', 5, 4),
('Compra Libro', 'El usuario compró el producto Libro de ficción', '2025-01-09', 'Online', 'FINALIZADO', 7, 1),
('Compra Videojuego', 'El usuario compró el producto Videojuego', '2025-01-10', 'Online', 'FINALIZADO', 8, 2),
('Compra Servicio', 'El usuario compró el servicio de limpieza', '2025-01-11', 'Online', 'FINALIZADO', 9, 3),
('Compra Producto', 'El usuario compró el producto diverso', '2025-01-12', 'Online', 'FINALIZADO', 10, 4),
('Sorteo', 'El usuario participó en un sorteo', '2025-01-13', 'Online', 'ACTIVO', 5, 1),
('Feriado', 'El usuario celebró un feriado', '2025-01-14', 'Online', 'ACTIVO', 7, 2),
('Evento Especial', 'El usuario asistió a un evento especial', '2025-01-15', 'Online', 'ACTIVO', 8, 3),
('Descuento', 'Aproveche en descuentos en nuestra tienda', '2025-01-16', 'Online', 'ACTIVO', 9, 4);

INSERT INTO TIP_REPORTE (NOM_REPORTE) VALUES 
('usuario toxico'),('usuario acosador'),('usuario spammer'),
('producto falso'),('producto peligroso'),('producto de baja calidad'),
('empresa fraudulenta'),('empresa con malas prácticas'),('empresa que incumple normas'),
('comentario inapropiado'),('comentario ofensivo'),('comentario spam');
-- -------------------------------------------------------
-- REPORTES
-- -------------------------------------------------------
INSERT INTO REPORTES (idTIP_REPORTE, idPRODUCTO, RAZON_REPORTE, REGISTRO_REPORTE) VALUES 
(1, 1, 'El usuario es tóxico y ha acosado a otros usuarios', '2025-01-17 10:00:00'),
(2, 2, 'El usuario es un acosador y ha acosado a otros usuarios', '2025-01-18 11:00:00'),
(3, 3, 'El usuario es un spammer y ha enviado mensajes no deseados', '2025-01-19 12:00:00'),
(4, 4, 'El producto es falso y no cumple con las especificaciones', '2025-01-20 13:00:00'),
(5, 5, 'El producto es peligroso y representa un riesgo para la salud', '2025-01-21 14:00:00'),
(6, 6, 'El producto es de baja calidad y no cumple con las expectativas', '2025-01-22 15:00:00'),
(7, 7, 'La empresa es fraudulenta y ha engañado a los clientes', '2025-01-23 16:00:00'),
(8, 8, 'La empresa tiene malas prácticas y no cumple con las normas de la comunidad', '2025-01-24 17:00:00'),
(9, 9, 'La empresa incumple normas y ha sido reportada por varios usuarios', '2025-01-25 18:00:00'),
(10, 10, 'El comentario es inapropiado y viola las normas de la comunidad', '2025-01-26 19:00:00'),
(11, 11, 'El comentario es ofensivo y ha sido reportado por varios usuarios', '2025-01-27 20:00:00'),
(12, 12, 'El comentario es spam y no aporta valor a la conversación', '2025-01-28 21:00:00');

-- -------------------------------------------------------
-- Fin de las inserciones
-- ------------------------------------------------------
SET FOREIGN_KEY_CHECKS=1;