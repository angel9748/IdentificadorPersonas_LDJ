
===COMANDOS DE SQL====

SELECT <----------Extrae informacion de la BD
UPDATE <----------Sube informacion de la BD.
DELETE <-----------Elimina informacion de la BD.
INSERT INTO <-----Inserta nueva informacion de la BD.
CREATE DATABASE <-------Crea una Base de Datos.
ALTER DATABSE <-----------Modifica una BD.
CREATE TABLE <-------------Crea una nueva tabla.
ALTER TABLE <---------------Modifica una Tabla.
DROP TABLE <---------------Elimina una table.
CREATE INDEX <-------------Crea un indice (llave de Busqueda).
DROP INDEX <--------------- Elimina un Indice.


SELECT * FROM Customers; <------------------Para seleccionar todas las columnas
SELECT DISTINCT <--------------- Se usa solo para retornar valores distintos (diferentes).
WHERE <---------------- Se usa para filtrar registros.
SELECT COUNT (DISTINCT country) FROM customers;

====CREACION DE ESQUEMAS DESDE PSQL

---> CREATE SCHEMA nombre de la tabla (variable);
----SHOW search_path;

Paso 1.- Acceder s nuestro servidor base de Postgres

Server [ localhost]: localhost  <------------ Colocamos localhost, quien lleva ese nombre del servidor local.
Database [postgres]: postgres  <----------- Se coloca el nombre de la Base de Datos creada.
Username [postgres]: postgres <----------- Se coloca el nombre del Usuario.
Contraseña para el Usuario postgres <---------- Se coloca la contraseña que se creo dentro del usuario de la BD.

Paso 2.- Para crear un Esquema se realiza lo siguiente:

postgres=# CREATE SCHEMA empresa;
CREATE SCHEMA

Paso 3.- Creamos la tabla o Tablas que se requieren.

Postgres=# CREATE TABLE nombre de la tabla.identificador de la tabla (nombre_id SERIAL PRIMARY KEY, nombre variable + tipo de Datos (50) NOT NULL);
----------------------------------------------------------------------------------------------------
Ejemplo: CREATE TABLE empresa.departamento(departamento_id SERIAL PRIMARY KEY, nombre_departamento VARCHAR (50) NOT NULL);
CREATE TABLE
----------------------------------------------------------------------------------------------------
paso 4.- Para crear un Indice

postgres=# CREATE INDEX idx_salario_usd ON empresa.empleados (salario_usd);
CREATE INDEX

Paso 5.- Para crear una Vista.
postgres=# CREATE VIEW empresa.vista_salario_primedio_departamento AS SELECT d.nombre_departamento, AVG(e.salario_usd) AS salario_promedio_usd FROM empresa.empleados e JOIN empresa.departamentos d ON e.departamento_id = d.departamento_id GROUP BY d.nombre_departamento;
CREATE VIEW

===OPTIMIZACION DE CONSULTAS===
EXPLAIN <------------Analisis Estatico = Estudia "Lee el codigo que se escribe dentro de la consulta"

EXPLAIN ANALYZE <----------------"Analiza datos en tiempo real"


====TIPOS DE INDICES===
B-Tree <--------indice predeterminado, para la igualdad y rangos.
Hash <---------Optimizado para la Igualdad.
GIN y GIST <--------- Busqueda de texto completo y datos geoespaciales.


------------------------------------------------------------------------------------------------------
EXPLAIN SELECT* FROM film WHERE rating = 'PG'; ---  Interpretación del Plan de Ejecución de Consultas Visualización del Plan de Ejecución

EXPLAIN ANALYZE SELECT* FROM film WHERE rating = 'PG'; --- Para obtener estadísticas del tiempo real

CREATE INDEX idx_film_rating ON film(rating); ---Sirve para hacer una busqueda mas sertera 

