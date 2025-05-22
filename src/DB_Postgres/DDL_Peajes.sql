--DDl para la creacion de la base de datos de peajes
--Este modelo de base de datos es para subir y cargar archivos para un landing de peajes
--DROPEO DE TABLAS  
DROP TABLE IF EXISTS archivos CASCADE;










--Creacion de tablas para la carga de archivos
CREATE TABLE IF NOT EXISTS archivos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR NOT NULL,
    descripcion VARCHAR NOT NULL,
    nombre_archivo VARCHAR NOT NULL,
    id_modulo INTEGER NOT NULL   --1= NOTICIAS, 2= GALERIA,
    
);
