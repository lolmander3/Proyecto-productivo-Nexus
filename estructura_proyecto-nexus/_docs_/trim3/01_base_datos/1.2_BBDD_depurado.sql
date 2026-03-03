/* ************************************************************************************* */
/* ---------------------------------------- DML ---------------------------------------- */
/* ---------------------------- DATA MANIPULATION LANGUAGE ----------------------------- */
/* ------------------------- LENGUAJE DE MANIPULACIÓN DE DATOS ------------------------- */
/* ------------------------------------- UNA TABLA ------------------------------------- */
/* ************************************************************************************* */
CREATE SCHEMA IF NOT EXISTS  biblioteca  DEFAULT CHARACTER SET utf8 ;
USE  biblioteca  ;

-- Table EDITORIALES

CREATE TABLE IF NOT EXISTS EDITORIALES  (
  editoriales_id  INT NOT NULL AUTO_INCREMENT,
  nombre  VARCHAR(45) NOT NULL,
  direccion VARCHAR(45) NOT NULL,
  telefono  VARCHAR(45) NOT NULL,
  PRIMARY KEY (editoriales_id))
ENGINE = InnoDB;

-- Table LIBRO

CREATE TABLE IF NOT EXISTS LIBRO  (
  libro_id  INT NOT NULL AUTO_INCREMENT,
  editorial_id  INT NOT NULL,
  idioma  VARCHAR(45) NOT NULL,
  titulo  VARCHAR(45) NOT NULL,
  formato VARCHAR(45) NOT NULL,
  categoria VARCHAR(45) NOT NULL,
  PRIMARY KEY (libro_id),
  CONSTRAINT fk_libro_editorial
    FOREIGN KEY (editorial_id)
    REFERENCES EDITORIALES  ( editoriales_id )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

-- Table TEMA

CREATE TABLE IF NOT EXISTS TEMA (
  tema_id INT NOT NULL AUTO_INCREMENT,
  nombre  VARCHAR(45) NOT NULL,
  PRIMARY KEY (tema_id ))
ENGINE = InnoDB;

-- Table AUTOR

CREATE TABLE IF NOT EXISTS AUTOR  (
  autor_id  INT NOT NULL AUTO_INCREMENT,
  nombreAutor VARCHAR(45) NOT NULL,
  PRIMARY KEY (autor_id))
ENGINE = InnoDB;

-- Table EJEMPLAR

CREATE TABLE IF NOT EXISTS EJEMPLAR (
  ejemplar_id INT NOT NULL AUTO_INCREMENT,
  libro_id  INT NOT NULL,
  ubicacion VARCHAR(45) NOT NULL,
  nombreOrden VARCHAR(45) NOT NULL,
  edicion VARCHAR(45) NOT NULL,
  PRIMARY KEY (ejemplar_id ),
  CONSTRAINT libro_ejemplar_libro
    FOREIGN KEY (libro_id)
    REFERENCES LIBRO  ( libro_id )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

-- Table SOCIO

CREATE TABLE IF NOT EXISTS SOCIO  (
  socio_id  INT NOT NULL AUTO_INCREMENT,
  nombre  VARCHAR(45) NOT NULL,
  telefono  VARCHAR(45) NOT NULL,
  direccion VARCHAR(45) NOT NULL,
  categoria VARCHAR(45) NOT NULL,
  PRIMARY KEY (socio_id))
ENGINE = InnoDB;

-- Table PRESTAMO

CREATE TABLE IF NOT EXISTS PRESTAMO (
  prestamo_id INT NOT NULL AUTO_INCREMENT,
  ejemplar_id INT NOT NULL,
  socio_id  INT NOT NULL,
  fecha_prestamo  DATE NOT NULL,
  fecha_devolucion  DATE NOT NULL,
  fecha_nota  DATE NOT NULL,
  PRIMARY KEY (prestamo_id ),
  CONSTRAINT prestamo_ejemplar 
    FOREIGN KEY (ejemplar_id )
    REFERENCES EJEMPLAR (ejemplar_id )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT prestamo_socio
    FOREIGN KEY (socio_id)
    REFERENCES SOCIO  ( socio_id )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

-- Table LIBRO_AUTOR

CREATE TABLE IF NOT EXISTS LIBRO_AUTOR  (
  libro_id  INT NOT NULL,
  autor_id  INT NOT NULL,
  PRIMARY KEY (libro_id, autor_id),
  CONSTRAINT libro_autor_libro 
    FOREIGN KEY (libro_id)
    REFERENCES LIBRO  ( libro_id )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT libro_autor_autor 
    FOREIGN KEY (autor_id)
    REFERENCES AUTOR  ( autor_id )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

-- Table LIBRO_TEMA

CREATE TABLE IF NOT EXISTS LIBRO_TEMA (
  libro_id  INT NOT NULL,
  tema_id INT NOT NULL,
  PRIMARY KEY (libro_id, tema_id ),
  CONSTRAINT libro_tema_libro
    FOREIGN KEY (libro_id)
    REFERENCES LIBRO  ( libro_id )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT libro_tema_tema 
    FOREIGN KEY (tema_id )
    REFERENCES TEMA (tema_id )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

