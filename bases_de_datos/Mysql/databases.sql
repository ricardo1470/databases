-- crear variables
SET @nombre = "Ricardo";

SET @curso = "Base de Datos", @gestor = "Mysql";

-- ver variables
SELECT @nombre, @curso, @gestor;
-- las variables son de uso local, y solo se serviran en la secion donde fueron creadas.

--crear base de datos
CREATE  DATABASE libreria_cf;
--ver bases de datos en el servidor
SHOW DATABASES;
--borrar base de datos
DROP DATABASE libreria_cf;
--elegir base de datos
USE libreria_cf;
--crear tablas
CREATE TABLE autores(
    autor_id INT,
    nombre VARCHAR(25),
    apellido VARCHAR(25),
    genero CHAR(1),
    fecha_nacimiento DATE,
    pais_origen VARCHAR(40)
);

--ver tablas en la base de datos
SHOW TABLES;

--ver base de datos en la cual se esta trabajando
SELECT DATABASE();
--borrar tabla
DROP TABLE autores;
--obtener informacion de las tablas en la base de datos;
SHOW COLUMNS FROM autores;
DESC autores;
--crear tabla a partir de una tabla existente(
CREATE TABLE usuarios LIKE autores;

--insertar registros en una tabla
INSERT INTO autores (
    nombre,
    apellido,
    genero,
    fecha_nacimiento,
    pais_origen) VALUES (
        'Test autor',
        'Test apellido',
        'M',
        '2021-05-15',
        'Colombia'
    ),
    (
        'Test autor2',
        'Test apellido2',
        'M',
        '2021-05-15',
        'Colombia'
    ),
    (
        'Test autor3',
        'Test apellido3',
        'M',
        '2021-05-15',
        'Colombia'
    ),
    (
        'Test autor4',
        'Test apellido4',
        'M',
        '2021-05-15',
        'Colombia'
    ),
    (
        'Test autor5',
        'Test apellido5',
        'M',
        '2021-05-15',
        'Colombia'
    ),
    (
        'Test autor6',
        'Test apellido6',
        'M',
        '2021-05-15',
        'Colombia'
    ),
    (
        'Test autor7',
        'Test apellido7',
        'M',
        '2021-05-15',
        'Colombia'
    ),
    (
        'Test autor8',
        'Test apellido8',
        'M',
        '2021-05-15',
        'Colombia'
    ),
    (
        'Test autor9',
        'Test apellido9',
        'M',
        '2021-05-15',
        'Colombia'
    ),
    (
        'Test autor10',
        'Test apellido10',
        'M',
        '2021-05-15',
        'Colombia'
    );

    --ver contenido de una tabla
    SELECT * FROM autores;

    -- condicion al momento de crear O borrar una base de datos
    DROP DATABASE IF EXISTS libreria_cf;
    CREATE DATABASE IF NOT EXISTS libreria_cf;
    --condicion al crear una tabla en la base de datos.
    CREATE TABLE IF NOT EXISTS autores(
    autor_id INT,
    nombre VARCHAR(25),
    apellido VARCHAR(25),
    genero CHAR(1),
    fecha_nacimiento DATE,
    pais_origen VARCHAR(40)
);

--consultas en la base de datos sin iniciar secion.
mysql -u root -p libreria_cf -e "SELECT * FROM autores"

--crear tabla con valores unicos
CREATE TABLE IF NOT EXISTS autores(
    autor_id INT UNSIGNED  PRIMARY  KEY AUTO_INCREMENT,
    nombre VARCHAR(25) NOT NULL,
    apellido VARCHAR(25) NOT NULL,
    seudonimo VARCHAR(50) UNIQUE,
    genero ENUM('M', 'F'),
    fecha_nacimiento DATE NOT NULL,
    pais_origen VARCHAR(40) NOT  NULL,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO autores (
    nombre,
    apellido,
    seudonimo,
    fecha_nacimiento,
    genero,
    pais_origen)
    VALUES (
        'Stephen Edwin',
        'King',
        'Richar Bachman',
        '1947-09-27',
        'M',
        'USA'
    );

--crear tabla con valores unicos libros
CREATE TABLE IF NOT EXISTS libros (
    libro_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    autor_id INT UNSIGNED NOT NULL,
    titulo VARCHAR(50) NOT NULL,
    descripcion VARCHAR(250),
    paginas INTEGER UNSIGNED,
    fecha_publicacion DATE NOT NULL,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (autor_id) REFERENCES autores(autor_id)
);

DROP TABLE autores, libros;

--insertar autores en tabla

INSERT INTO autores(
    nombre,
    apellido,
    seudonimo,
    fecha_nacimiento,
    genero,
    pais_origen
) VALUES (
    'Stephen Edwin',
    'King',
    'Richard Bachman',
    '1947-09-27',
    'M',
    'USA'
),
(
    'Joanne',
    'Rowling',
    'J.K Rowling',
    '1947-09-27',
    'F',
    'Reini Unido'
);

--insertar libros en tabla

INSERT INTO libros(
    autor_id,
    titulo,
    fecha_publicacion
) VALUES (
    1,
    'Carrie',
    '1947-01-01'
),
(
    1,
    'El Misterio de Salemes Lot',
    '1975-01-01'
),
(
    1,
    'El Respaldo',
    '1977-01-01'
),
(
    2,
    'Harry Potter y la Piedra Filosofal',
    '1997-06-30'
),
(
    2,
    'Harry Potter y la Camara Secreta',
    '1998-07-2'
),
(
    2,
    'Harry Potter y el Prisionero de Azkaban',
    '1999-07-8'
),
(
    2,
    'Harry Potter y el Caliz de Fuego',
    '2000-03-20'
),
(
    2,
    'Harry Potter y la Orden del Fenix',
    '2003-06-21'
),
(
    2,
    'Harry Potter y el Misterio del Principe',
    '2005-06-16'
),
(
    2,
    'Harry Potter y las Reliquias de la Muerte',
    '2007-07-21'
);

-- una llave foranea es una colunna de una tabla que hace referencia a una llave primaria de otra tabla

--alterar tabla
ALTER TABLE libros ADD ventas INT UNSIGNED NOT NULL;

ALTER TABLE  libros ADD stock INT UNSIGNED NOT NULL DEFAULT 10;

-- eliminar columna de una tabla
ALTER TABLE libros DROP COLUMN stock;

--consultas mediante operadores logicos AND, OR y NOT
SELECT * FROM libros WHERE (autor_id = 1 AND titulo = 'Carrie') OR (autor_id =5);
SELECT * FROM libros WHERE titulo = 'Carrie' AND autor_id = 1 AND ventas = 10;
SELECT  * FROM libros WHERE titulo = 'Carrie' AND autor_id = 1;
SELECT * FROM libros WHERE titulo = 'Carrie' OR autor_id = 1 or ventas = 10;
SELECT * FROM autores WHERE seudonimo IS NOT NULL;

--registros a partir de un rango
SELECT titulo FROM libros WHERE fecha_publicacion BETWEEN '1995-01-01' AND '2015-01-31';

--registros a partir de lista
SELECT * FROM libros WHERE titulo IN ('El Misterio de Salemes Lot','Harry Potter y el Misterio del Principe', 'El Respaldo');

--buscar registros unicos
SELECT DISTINCT titulo FROM libros;

--buscar registros a partir de alias
SELECT  autor_id, titulo FROM libros;
SELECT  autor_id AS autor, titulo AS nombre FROM libros;
SELECT 9 * 8 As resultado;

--actualizar registros
--SET: permite establecer valores
UPDATE libros SET descripcion = 'nueva descripcion', ventas = 100;
SELECT * FROM libros;
UPDATE libros SET descripcion = 'test de cambio en la descripcion', ventas = 100 WHERE titulo = 'Carrie';
--por buena practica se debe apuntar a la llave primaria del elemento que se desea actualizar
UPDATE libros SET descripcion = 'test de cambio en la descripcion', ventas = 40 WHERE libro_id = 10;

--eliminar un registro
DELETE FROM libros WHERE autor_id = 1;
-- eliminar en cascada
-- Se puede eliminar en cascada habilitando esta opcion desde la creacion de la tabla
CREATE TABLE IF NOT EXISTS libros (
    libro_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    autor_id INT UNSIGNED NOT NULL,
    titulo VARCHAR(50) NOT NULL,
    descripcion VARCHAR(250),
    paginas INTEGER UNSIGNED,
    fecha_publicacion DATE NOT NULL,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (autor_id) REFERENCES autores(autor_id) ON DELETE CASCADE
);
-- o se puede eliminar en cascada desde un query, si no se habilito esta opcion cuando se creo la tabla
ALTER TABLE libros ADD FOREIGN KEY (autor_id) REFERENCES autores(autor_id) ON DELETE CASCADE;

-- otra forma de borrar una tabla
TRUNCATE TABLE libros;
-- la diferencia de truncate y delete es que truncate no puede combinarse con 'where', y al ejecutar el truncate elmininara todos los metadatos, a diferencia del delete que no resetea los metadatos

--funciones sobre strings
SELECT CONCAT(nombre, apellido) FROM autores;
SELECT CONCAT(nombre, " ",apellido) FROM autores;
SELECT CONCAT(nombre, apellido) AS nombre_completo FROM autores;
--numero de caracteres de un string
SELECT LENGTH("hola mundo");
SELECT * FROM  autores WHERE LENGTH(nombre) > 7;
--upper
SELECT UPPER(nombre) FROM autores;
--lower
SELECT LOWER(nombre) FROM autores;
--trim
SELECT TRIM("     cadena con espacios al inicio y al final         "); -- esta funcion elimina lso espacios
--sub string
SELECT LEFT ("esta es una cadena", 5) AS substring_L, RIGHT("esta es otra cadena de caracteres", 10) AS substring_R;
SELECT * FROM libros WHERE LEFT(titulo, 12) = 'Harry Potter';
SELECT * FROM libros WHERE RIGHT(titulo, 6) = 'anillo';
--funciones sobre numeros
SELECT RAND();
SELECT ROUND(RAND() * 100);
-- trunca numeros despues del decimal
SELECT TRUNCATE(1.1234565432, 4);
SELECT TRUNCATE(RAND(), 2);
--Potencia
SELECT POW(2, 16);
--FUNCIONES SOBRE FECHAS
SELECT NOW();
--FECHA A VARIABLE
SET @now = NOW();

-- LOS DATOS ALMACENADOS EN LA VARIABLE SE PUEDEN EXTRAR DIFERENTES DATOS DE ESA VARIABLE
SELECT SECOND(@now), MINUTE(@now), HOUR(@now), MONTH(@now), YEAR(@now);
-- DIA DE LA SEMANA, DIA DEL MES, DIA DEL AÑO
SELECT DAYOFWEEK(@now), DAYOFMONTH(@now), DAYOFYEAR(@now);
--CONVERTIR TIMESTAM A TIMEDATE
SELECT DATE(@now);
--SABER QUE LIBROS SE INGRESARON HOY
SELECT * FROM libros WHERE  DATE(fecha_creacion) = CURDATE();
SELECT CURDATE();
--OPERACION DE FECHAS
SELECT @now + INTERVAL 30 DAY;
--FUNCIONES SOBRE CONDICIONES (IF, IFNULL)
SELECT  IF(10 > 9, "EL SI ES MAYOR", "EL NUMERO NO ES MAYOR"); -- SE DEBEN INGRESAR TRES ARGUMENTOS, 1 = CONDICION, 2 = VALOR DE RETORNO SI LA CONDICION SE CUMPLE, 3 = VALOR DE RETORNO SI LA CONDICION NO SE CUMPLE
SELECT IFNULL(seudonimo, "EL AUTOR NO CUENTA CON SEUDONIMO") FROM autores;--SOLO RECIBE DOS ARGUMENTOS
--ESTRUCTURA DE FUNCTION
DELIMITER // --modifica el final de la lina ; por //
CREATE FUNCTION agregar_dias(fecha DATE, dias INT)
RETURNS DATE
BEGIN
    RETURN fecha + INTERVAL dias DAY;
END//

DELIMITER ;
--listar funciones
SELECT  name FROM mysql.proc WHERE db = database() AND type = 'FUNCTION';
--borrar FUNCTION
DROP FUNCTION agregar_dias;
--sentencias dentro de funciones
DELIMITER //
CREATE FUNCTION numero_pag()
RETURNS INT
BEGIN
    SET @paginas = (SELECT (ROUND(RAND() * 100) * 4));
    RETURNS @paginas;
END //

DELIMITER ;

UPDATE libros SET paginas = numero_pag();
--mostrar tabla en forma de cartas
SELECT * FROM  libros\G;
--busqueda mediante strings, con string al inicio
SELECT * FROM libros WHERE titulo LIKE 'Harry Potter%';
--con string al final
SELECT * FROM libros WHERE titulo LIKE '%anillo';
--sin conocer el lugar donde este el string
SELECT * FROM libros WHERE titulo LIKE '%la%';
--obtener string con 5 caracteres y tercer letra b
SELECT * FROM libros WHERE titulo LIKE '__b___';
--obteenr libros que el titutlo tenga la letra a en la segunda posicion
SELECT * FROM libros WHERE titulo LIKE '_a%';
--obteenr libros que el titutlo tenga la letra a en la segunda posicion y en la quinta posicion la letra O
SELECT * FROM libros WHERE titulo LIKE '_a__o%';
--buscar por alguna letras inicial
SELECT autor_id, titulo FROM libros WHERE titulo LIKE 'H%' OR titulo 'L%';
SELECT autor_id, titulo FROM libros WHERE LEFT(titulo, 1) = 'H' OR LEFT(titulo, 1) = 'L';
--expresiones regulares
SELECT titulo FROM libros WHERE titulo REGEXP '^[HLAVCTZ]';
--ordenar registros
SELECT  titulo FROM libros ORDER BY titulo;
--orden de forma ascendente
SELECT  titulo FROM libros ORDER BY titulo ASC;
--orden de forma descendente
SELECT  titulo FROM libros ORDER BY titulo DESC;
--orden por mas de un parametro
SELECT libro_id, titulo FROM libros ORDER BY libro_id AND titulo ASC;
--limitar registros, primeros 10 reistros de la tabla
SELECT titulo FROM libros LIMIT 10;
SELECT titulo FROM libros WHERE autor_id = 2 LIMIT 10;
--paginacion de resultados
SELECT libro_id, titulo FROM libros LIMIT 0, 5;
SELECT libro_id, titulo FROM libros LIMIT 5, 5;
SELECT libro_id, titulo FROM libros LIMIT 10, 5;
SELECT libro_id, titulo FROM libros LIMIT 15, 5;
--funciones de agregacion
--funcion1 count:
SELECT COUNT(*)FROM autores;
--valor maximo de una columna
SELECT MAX(ventas) FROM libros;
--valor minimo
SELECT MIN()(ventas) FROM libros;
--agregacion
SELECT SUM(ventas) FROM libros;
--avg: permite conocer el promedio
SELECT AVG(ventas) FROM libros;
--sgrupamiento
SELECT autor_id, SUM(ventas) FROM libros GROUP BY autor_id;
    --condiciones de agrupamiento(
SELECT autor_id, SUM(ventas) as total FROM libros GROUP BY autor_id HAVING SUM(ventas) > 100;
--tabla usuarios
CREATE TABLE usuarios(
    usuario_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(25) NOT NULL,
    apellidos VARCHAR(25),
    username VARCHAR(25) NOT NULL,
    email VARCHAR(50) NOT NULL,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO usuarios (nombre, apellidos, username, email) VALUES ('Ricardo', 'Camayo', 'ricardo1470', '1466@holbertonschool.com'), ('Karolina', 'Diaz', 'Karito', 'k-rito@gmail.com');

SELECT CONCAT(nombre, " ", apellidos) as nombre_completo FROM usuarios;
--union de resultados
SELECT CONCAT(nombre, " ", apellido) FROM autores UNION SELECT CONCAT(nombre, " ", apellidos) FROM usuarios;
--sub-consultas
SELECT AVG(ventas) FROM libros;
SELECT autor_id FROM libros GROUP BY autor_id HAVING SUM(ventas) > 94.0000;
--primera sub consulta retorna promedio(esta al final del query)
--segunda sub consulta retorna lista de id's(esta en medio del query)
--tercer sub consulta retorna lista de nombres(esta al inicio del query)
SELECT CONCAT(nombre, " ", apellido) AS nombre_completo FROM autores WHERE autor_id IN(SELECT autor_id FROM libros GROUP BY autor_id HAVING SUM(ventas) > (SELECT AVG(ventas) FROM  libros));
--validar consulta
SELECT IF(EXISTS(SELECT libro_id FROM libros WHERE titulo = 'la piedra filosofal'), 'disponible', 'no disponible') AS mensaje;
--inser JOIN
SELECT libros.titulo, CONCAT(autores.nombre, " ", autores.apellido) AS nombre_autor, libros.fecha_creacion FROM libros INNER JOIN autores ON libros.autor_id = autores.autor_id;
--sub clausula USING
SELECT libros.titulo, CONCAT(autores.nombre, " ", autores.apellido) AS nombre_autor, libros.fecha_creacion FROM libros INNER JOIN autores USING(autor_id);
SELECT libros.titulo, CONCAT(autores.nombre, " ", autores.apellido) AS nombre_autor, libros.fecha_creacion FROM libros INNER JOIN autores ON libros.autor_id = autores.autor_id AND autores.seudonimo IS NOT NULL;
--left join
-- usuarios => libros, es una relacion muchos a muchos.
-- cuanod se tiene una relacion muchos a muchos se debe creat una tabla para esa relacion
CREATE TABLE libros_usuarios(
    libro_id INT UNSIGNED NOT NULL,
    usuario_id INT UNSIGNED NOT NULL;
    FOREIGN KEY (libro_id) REFERENCES libros(libro_id),
    FOREIGN key (usuario_id) REFERENCES usuarios(usuario_id),
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP
);

SELECT CONCAT(nombre, " ", apellido), libros_usuarios.libro_id FROM usuarios LEFT JOIN libros_usuarios ON usuarios.usuario.id = libros_usuarios.usuarios_id;
--right JOIN
SELECT CONCAT(nombre, " ", apellido), libros_usuarios.libro_id FROM libros_usuarios RIGHT JOIN usuarios ON usuarios.usuario.id = libros_usuarios.usuarios_id;
--multiples joins
--usuario, libros_usuario, autor
SELECT DISTINCT CONCAT(usuarios.nombre, " ", usuarios.apellidos) FROM usuarios AS nombre_usuarios INNER JOIN libros_usuarios ON usuario.usuario_id = libros_usuarios.usuarios_id INNER JOIN libros ON libros_usuarios.libro_id = libros.libro_id INNER JOIN autores ON libros.autores_id = autores.autor_id AND autores.seudonimo IS NOT NULL;
--productos cartesianos
SELECT usuarios.username, libros.titulo FROM  usuarios CROSS JOIN libros;
--vistas
CREATE VIEW prestamos_usuarios_vw AS SELECT usuario.usuario_id usuarios.nombre, usuarios.email, usuarios.username COUNT(usuarios.usuario_id) AS total_prestamos FROM usuarios INNER JOIN  libros_usuarios ON usuarios.usuario_id = libros_usuarios.usuarios_id GROUP BY usuarios.usuario_id;
--ver el contenido de la vista
SELECT * FROM prestamos_usuarios_vw;
--eliminar vista
DROP VIEW prestamos_usuatios_vw;
--editar vista
CREATE VIEW prestamos_usuarios_vw AS SELECT usuario.usuario_id usuarios.nombre, usuarios.email, usuarios.username COUNT(usuarios.usuario_id) AS total_prestamos FROM usuarios INNER JOIN libros_usuarios ON usuarios.usuario_id = libros_usuarios.usuarios_id AND libros_usuarios >= CURRENT_DATE() - INTERVAL 5 DAY GROUP BY usuarios.usuario_id;
CREATE OR REPLACE VIEW prestamos_usuarios_vw AS SELECT usuario.usuario_id usuarios.nombre, usuarios.email, usuarios.username COUNT(usuarios.usuario_id) AS total_prestamos FROM usuarios INNER JOIN libros_usuarios ON usuarios.usuario_id = libros_usuarios.usuarios_id AND libros_usuarios >= CURRENT_DATE() - INTERVAL 5 DAY GROUP BY usuarios.usuario_id;
--crear procedimientos
DELIMITER //
CREATE PROCEDURE prestamo(usuario_id INT, libro_id INT)
BEGIN
INSERT INTO libros_usuarios(libro_id, usuario_id) VALUES (libros_id, usuarios_id);
UPDATE libros SET stock = stock -1 WHERE libros.libro_id = libro_id;
END//
DELIMITER ;
--ver los PROCEDURE
SELECT name FROM mysql.proc WHERE db = database() AND type = 'PROCEDURE'
CALL  prestamo (3, 20);
SELECT * FROM libros_usuarios;
SELECT * FROM libros WHERE libro_id 9\G;
--borrar PROCEDURE
SELECT name FROM mysql.proc WHERE db = database() AND type = 'PROCEDURE';
--borrar un PROCEDURE
DROP PROCEDURE prestamo;





