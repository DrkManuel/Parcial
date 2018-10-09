-- PRIMER PUNTO
CREATE TABLESPACE MID_TERM DATAFILE 'mid_term.dbf' SIZE 50M;

-- SEGUNDO PUNTO
CREATE USER user1
  IDENTIFIED BY user1
  DEFAULT TABLESPACE MID_TERM
  QUOTA 20M ON MID_TERM;
  
-- TERCER PUNTO
GRANT DBA TO user1;

-- CUARTO PUNTO
CREATE SEQUENCE COMUNAS_SEQ START WITH 50 INCREMENT BY 3;
CREATE SEQUENCE COLEGIOS_SEQ START WITH 100 INCREMENT BY 1;

-- QUINTO PUNTO
CREATE TABLE COMUNAS (
	ID INTEGER PRIMARY KEY,
	NOMBRE VARCHAR2(255)
);

INSERT INTO COMUNAS VALUES (1,	'POPULAR');
INSERT INTO COMUNAS VALUES (10,	'LA CANDELARIA');
INSERT INTO COMUNAS VALUES (11,	'LAURELES ESTADIO');
INSERT INTO COMUNAS VALUES (12,	'LA AMERICA');
INSERT INTO COMUNAS VALUES (13,	'SAN JAVIER');
INSERT INTO COMUNAS VALUES (14,	'POBLADO');
INSERT INTO COMUNAS VALUES (15,	'GUAYABAL');
INSERT INTO COMUNAS VALUES (16,	'BEL�N');
INSERT INTO COMUNAS VALUES (2,	'SANTA CRUZ');
INSERT INTO COMUNAS VALUES (3,	'MANRIQUE');
INSERT INTO COMUNAS VALUES (4,	'ARANJUEZ');
INSERT INTO COMUNAS VALUES (5,	'CASTILLA');
INSERT INTO COMUNAS VALUES (50,	'PALMITAS');
INSERT INTO COMUNAS VALUES (6,	'DOCE DE OCTUBRE');
INSERT INTO COMUNAS VALUES (60,	'SAN CRISTOBAL');
INSERT INTO COMUNAS VALUES (7,	'ROBLEDO');
INSERT INTO COMUNAS VALUES (70,	'ALTAVISTA');
INSERT INTO COMUNAS VALUES (8,	'VILLA HERMOSA');
INSERT INTO COMUNAS VALUES (80,	'SAN ANTONIO DE PRADO');
INSERT INTO COMUNAS VALUES (9,	'BUENOS AIRES');
INSERT INTO COMUNAS VALUES (90,	'SANTA ELENA');

create table colegios (
  ID INTEGER PRIMARY KEY,
	consecutivo_dane VARCHAR2(255),
	nombre_sede VARCHAR2(255),
	tipo_sede VARCHAR2(255),
	comuna_id INTEGER,
	prestacion_servicio VARCHAR2(255),
	zona VARCHAR2(255),
	barrio VARCHAR2(255),
	sector VARCHAR2(255),
	direccion_sede VARCHAR2(255),
	telefono_sede VARCHAR2(255),
	rector VARCHAR2(255),
	contador_prejardin_jardin INTEGER,
	contador_transicion INTEGER,
	contador_primaria INTEGER,
	contador_secundaria INTEGER,
	contador_media INTEGER,
	contador_adultos INTEGER,
	jornada_completa VARCHAR(8),
	jornada_manana VARCHAR(8),
	jornada_tarde VARCHAR(8),
	jornada_nocturna VARCHAR(8),
	jornada_fin_de_semana VARCHAR(8),
	jornada_unica VARCHAR(8),
	clasificacion_icfes VARCHAR(8)
);

ALTER TABLE COLEGIOS ADD CONSTRAINT COMUNA_FK FOREIGN KEY (comuna_id) REFERENCES COMUNAS(ID);

-- PUNTO SEIS
-- IMPORTAR LOS DATOS

-- PUNTO 7
--7.1: Traiga el nombre del barrio y el n�mero de colegios ubicados en cada barrio de aquellas instituciones ubicadas en la comuna de buenos aires ordenado por el n�mero de colegios de mayor a menor.
--	 Columnas: barrio, numero_colegios
SELECT BARRIO, COUNT(COLEGIOS.ID) AS NUM_COLEGIOS
  FROM COLEGIOS INNER JOIN COMUNAS ON comunas.ID = colegios.comuna_id WHERE COMUNAS.NOMBRE = 'BUENOS AIRES' GROUP BY BARRIO ORDER BY NUM_COLEGIOS DESC;
  
--7.2: Traiga los registros junto con el nombre de su comuna, para cada registro deber� calcularse el total de los estudiantes seg�n los contadores. Tambi�n deber� traer el total de estudiantes agrupados por comuna.
--	 Columnas: ID, NOMBRE_SEDE, COMUNA_ID, NOMBRE_COMUNA, TOTAL_GENERAL, TOTAL_POR COMUNA

--7.3: Traiga los colegios que dicten clases a estudiantes de prejardin-jardin y que en la prestaci�n de su servicio sean no oficiales para las comunas ARANJUEZ, CASTILLA y DOCE DE OCTUBRE. Deber� incluir el contador de estudiantes de secundaria y deber� calcular el promedio de estudiantes de secundaria agrupados por comuna redondeado a 2 decimales.
--	 Columnas: ID, NOMBRE_SEDE, COMUNA_ID, NOMBRE_COMUNA, CONTADOR_SECUNDARIA, PROMEDIO_SECUNDARIA_COMUNA

--7.4 Traiga el nombre de los rectores y el n�mero de colegios encargados para cada rector de aquellos rectores que est�n encargados de m�s de 2 colegios. 
--	Los registros deber�n estar ordenados alfab�ticamente
--	Nota: NO se deber�n incluir aquellos registros que tengan un correo electr�nico registrado y tampoco aquellos que registran como nombre "s/d"
--	Columnas: rector, numero_colegios

--7.5 Muestre el nombre del colegio, el barrio, la direcci�n de aquellos colegios que est�n ubicados en la zona rural y tengan alg�n tipo de clasificaci�n en el ICFES. Adem�s deber� traer aquellos colegios que ense�an a m�s de 200 estudiantes adultos
--	Columnas: barrio, numero_colegios

  
