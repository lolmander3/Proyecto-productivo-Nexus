/* ---------------------------------------- DDL ---------------------------------------- */
/* ----------------------------- DATA DEFINITION LANGUAGE ------------------------------ */
/* -------------------------- LENGUAJE DE DEFINICIÓN DE DATOS -------------------------- */
/* 01. Mostrar BBDDs : .................... SHOW DATABASES                               */
/* 02. Usar BBDD : ........................ USE __                                       */
/* 03. Eliminar BBDD : .................... DROP DATABASE __                             */
/* 04. Mostrar Tablas : ................... SHOW TABLES __.                              */
/* 05. Mostar Columnas : .................. SHOW COLUMNS FROM __ . DESCRIBE __           */
/* 06. Agregar Columna : .................. ALTER TABLE __ ADD __ __                     */
/* 07. Renombrar Columna : ................ ALTER TABLE __ CHANGE __ __                  */
/* 08. Eliminar Columna : ................. ALTER TABLE __ DROP __                       */
/* 09. Agregar Valor x Defecto Columna : .. ALTER TABLE __ ALTER __ SET DEFAULT __       */
/* 10. Eliminar Valor x Defecto Columna : . ALTER TABLE __ ALTER __ DROP DEFAULT         */
/* 11. Mostrar Creación Tabla : ........... SHOW CREATE TABLE __                         */
/* 12. Eliminar Restricción : ............. ALTER TABLE __ DROP CONSTRAINT __            */
/* 13. Eliminar Índice : .................. ALTER TABLE __ DROP INDEX __                 */
/* 14. Eliminar Llave Primaria : .......... ALTER TABLE __ DROP PRIMARY KEY              */
/* 15. Limpiar Registros : ................ TRUNCATE __                                  */
/* 16. Eliminar Tabla : ................... DROP TABLE __                                */
/* 17. Crear Tabla : ...................... CREATE TABLE __ ( __ , __ )                  */
/* 18. Renombrar Tabla : .................. RENAME TABLE __ TO __                        */
/* 19. Crear Llave Primaria : ............. ALTER TABLE __ ADD PRIMARY KEY ( __ )        */
/* 20. Crear Índice Campo : ............... CREATE INDEX __ ON __ ( __ )                 */
/* 21. Crear Índice Multicampo : .......... CREATE INDEX _ ON _ ( __ , __ )              */
/* 22. Crear Índice Único : ............... CREATE UNIQUE INDEX __ ON __ ( __ )          */
/* 23. Crear Restricción : ................ ALTER TABLE __ ADD CONSTRAINT __             */
/*     FOREIGN KEY ( __ ) REFERENCES __ ( __ ) ON DELETE CASCADE ON UPDATE CASCADE       */
/* ---------------------------------------- DDL ---------------------------------------- */
-- 01. Mostrar BBDDs. ------------------------------------------------------------------ --
--     SHOW DATABASES : ---------------------------------------------------------------- --
SHOW databases;
-- 02. Usar BBDD. ---------------------------------------------------------------------- --
--     USE __ : ------------------------------------------------------------------------ --
Use database_nexus;
-- 03. Eliminar BBDD. ------------------------------------------------------------------ --
--     DROP DATABASE __ : -------------------------------------------------------------- --
-- drop database database_nexus; SE PONE EN COMENTARIO PARA NO ELIMINAR LA BASE DE DATOS. SI SE DESEA ELIMINAR, DESCOMENTAR ESTA LÍNEA.
-- 04. Mostrar Tablas. ----------------------------------------------------------------- --
--     SHOW TABLES __ : ---------------------------------------------------------------- --
SHOW TABLES;
-- 05. Mostar Columnas. ---------------------------------------------------------------- --
--     SHOW COLUMNS FROM __ . DESCRIBE __ : -------------------------------------------- --
-- ROL --
SHOW COLUMNS FROM ROL;
DESCRIBE ROL;
-- USUARIO_ROL --
SHOW COLUMNS FROM USUARIO_ROL;
DESCRIBE USUARIO_ROL;
-- USUARIOS --
SHOW COLUMNS FROM USUARIO;
DESCRIBE USUARIO;
-- CATEGORIA --
SHOW COLUMNS FROM CATEGORIA;
DESCRIBE CATEGORIA;
-- EMPRESA --
SHOW COLUMNS FROM EMPRESA;
DESCRIBE EMPRESA;
-- PRODUCTO --
SHOW COLUMNS FROM PRODUCTO;
DESCRIBE PRODUCTO;
-- RESENA --
SHOW COLUMNS FROM RESENA;
DESCRIBE RESENA;
-- RESENA_USUARIO --
SHOW COLUMNS FROM RESENA_USUARIO;
DESCRIBE RESENA_USUARIO;
-- EMPRESA_PRODUCTO --
SHOW COLUMNS FROM EMPRESA_PRODUCTOS;
DESCRIBE EMPRESA_PRODUCTOS;
-- EVENTO --
SHOW COLUMNS FROM EVENTOS;
DESCRIBE EVENTOS;
-- 06. Agregar Columna. ---------------------------------------------------------------- --
--     ALTER TABLE __ ADD __ __ : ------------------------------------------------------ --
ALTER TABLE ROL ADD DESCRIPCION VARCHAR(500) NOT NULL;
ALTER TABLE USUARIO ADD TELEFONO VARCHAR(20) NOT NULL;
-- 07. Renombrar Columna. ------------------------------------------------------------- --
--     ALTER TABLE __ CHANGE __ __ : --------------------------------------------------- --
ALTER TABLE ROL CHANGE DESCRIPCION DESCRIP VARCHAR(233) NOT NULL;
ALTER TABLE USUARIO CHANGE TELEFONO TEL VARCHAR(15) NOT NULL;
-- 08. Eliminar Columna. -------------------------------------------------------------- --
--     ALTER TABLE __ DROP __ : --------------------------------------------------------- --
ALTER TABLE ROL DROP DESCRIP;
ALTER TABLE USUARIO DROP TEL;
-- 09. Agregar Valor x Defecto Columna. ------------------------------------------------ --
--     ALTER TABLE __ ALTER __ SET DEFAULT __ : ----------------------------------------- --
ALTER TABLE ROL ALTER DESCRIP SET DEFAULT 'Sin descripción';
ALTER TABLE USUARIO ALTER APELLIDO SET DEFAULT 'Sin apellido';
-- 10. Eliminar Valor x Defecto Columna. ------------------------------------------------ --
--     ALTER TABLE __ ALTER __ DROP DEFAULT : ------------------------------------------- --
ALTER TABLE ROL ALTER DESCRIP DROP DEFAULT;
ALTER TABLE USUARIO ALTER APELLIDO DROP DEFAULT;
-- 11. Mostrar Creación Tabla. --------------------------------------------------------- --
--     SHOW CREATE TABLE __ : ----------------------------------------------------------- --
SHOW CREATE TABLE ROL;
SHOW CREATE TABLE USUARIO;
SHOW CREATE TABLE USUARIO_ROL;
SHOW CREATE TABLE CATEGORIA;
SHOW CREATE TABLE EMPRESA;
SHOW CREATE TABLE PRODUCTO;
SHOW CREATE TABLE PRODUCTO;
SHOW CREATE TABLE RESENA;
SHOW CREATE TABLE EMPRESA_PRODUCTOS;
SHOW CREATE TABLE RESENA_USUARIO;
SHOW CREATE TABLE EVENTOS;
-- 12. Eliminar Restricción. ----------------------------------------------------------- --
--     ALTER TABLE __ DROP CONSTRAINT __ : --------------------------------------------- --