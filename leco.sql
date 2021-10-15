-- CICLO 1: Tablas
CREATE TABLE Proyectos(
	codigo VARCHAR(40) NOT NULL,
	ubicacionId VARCHAR(6) NOT NULL,
	servicioId VARCHAR(5) NOT NULL,
	personaId VARCHAR(8) NOT NULL,
	nombre VARCHAR(11),
	fecha DATE NOT NULL,
	precio INT NOT NULL,
	inicio DATE NOT NULL,
	fin DATE,
	recursos INT NOT NULL,
	condiciones VARCHAR(50)
);
CREATE TABLE Participa(
	empleadoId VARCHAR(8) NOT NULL,
	proyectoId VARCHAR(15) NOT NULL,
	salario INT NOT NULL,
	tiempo INT NOT NULL
);

CREATE TABLE Servicios(
	codigo VARCHAR(5) NOT NULL,
	nombre VARCHAR(15) NOT NULL,
	tipo CHAR(1) NOT NULL,
	presupuesto INT NOT NULL
);
CREATE TABLE ServiciosEspecialidades(
	servicioId VARCHAR(5) NOT NULL,
	nombreEspecialidad VARCHAR(10) NOT NULL
);



CREATE TABLE Especialidades(
	nombre VARCHAR(10) NOT NULL,
	empleadoId VARCHAR(8) NOT NULL,
	profesional CHAR(1) NOT NULL,
	salario INT NOT NULL
);



CREATE TABLE Personas(
	codigo VARCHAR(8) NOT NULL,
	vinculacion DATE NOT NULL
);
CREATE TABLE Juridicas(
	codigo VARCHAR(8) NOT NULL,
	nit INT,
	razonSocial VARCHAR(20) NOT NULL
);
CREATE TABLE Empleados(
	codigo VARCHAR(8) NOT NULL,
	nombre VARCHAR(20) NOT NULL,
	proyectos VARCHAR(3) NOT NULL,
	especialidad VARCHAR(10) NOT NULL,
	vivienda VARCHAR(6) NOT NULL
);



CREATE TABLE Ubicaciones(
	codigo VARCHAR(6) NOT NULL,
	municipio VARCHAR(15) NOT NULL,
	departamento VARCHAR(10) NOT NULL
);

--CICLO1: XTablas
DROP TABLE Proyectos CASCADE CONSTRAINTS;
DROP TABLE Participa CASCADE CONSTRAINTS;

DROP TABLE Servicios CASCADE CONSTRAINTS;
DROP TABLE ServiciosEspecialidades CASCADE CONSTRAINTS;

DROP TABLE Especialidades CASCADE CONSTRAINTS;

DROP TABLE Personas CASCADE CONSTRAINTS;
DROP TABLE Juridicas CASCADE CONSTRAINTS;
DROP TABLE Empleados CASCADE CONSTRAINTS;

DROP TABLE Ubicaciones CASCADE CONSTRAINTS;

--CICLO1: PoblarOK(1)
INSERT INTO Proyectos(codigo,ubicacionId,servicioId,personaId,nombre,fecha,precio,inicio,fin,recursos,condiciones) VALUES ('1234','D35','67345','100456','ALBERTO-2','20-08-2021',30000000,'15-09-2021','31-10-2021',50000,'50');
INSERT INTO Proyectos(codigo,ubicacionId,servicioId,personaId,nombre,fecha,precio,inicio,fin,recursos,condiciones) VALUES ('12345','D36','34TT','100457','CARLOS-2','10-09-2021',10000,'23-09-2021','25-10-2021',100000,NULL);
INSERT INTO Proyectos(codigo,ubicacionId,servicioId,personaId,nombre,fecha,precio,inicio,fin,precio,recursos,condiciones) VALUES ('123456','D37','34TC','100458','JUAN-2','1-09-2021',80000,'3-09-2021',NULL,100000,'50 cascos');

INSERT INTO Especialidades(nombre,empleadoId,profesional,salario) VALUES ('JULIAN-3','3452','F',3000000);
INSERT INTO Especialidades(nombre,empleadoId,profesional,salario) VALUES ('DANIEL-3','3453','T',4000000);
INSERT INTO Especialidades(nombre,empleadoId,profesional,salario) VALUES ('JUANA-3','3454','T',2000000);

INSERT INTO PERSONAS(codigo,vinculacion) VALUES ('4455','21-08-2019');
INSERT INTO PERSONAS(codigo,vinculacion) VALUES ('4456','15-08-2019');
INSERT INTO PERSONAS(codigo,vinculacion) VALUES ('4457','10-08-2019');

INSERT INTO Ubicaciones(codigo,municipio,departamento) VALUES ('5678','Tunja','Boyaca');
INSERT INTO Ubicaciones(codigo,municipio,departamento) VALUES ('5679','Bogota','Cund');
INSERT INTO Ubicaciones(codigo,municipio,departamento) VALUES ('5670','Neiva','Huila');

INSERT INTO Servicios(codigo,nombre,tipo,presupuesto) VALUES ('67345','DISEÑO','D',30000000);
INSERT INTO Servicios(codigo,nombre,tipo,presupuesto) VALUES ('67346','CONSTRUCCION','C',60000000);
INSERT INTO Servicios(codigo,nombre,tipo,presupuesto) VALUES ('67347','INTERVENTORIA','I',90000000);
--CICLO1: PoblarNoOK(2)
INSERT INTO Proyectos(codigo,ubicacionId,servicioId,personaId,nombre,inicio,fin,precio,recursos) VALUES ('1234','D35','34TY','100456','ALBERTO-2',30092021,'31-10-2021',2000,50000);

INSERT INTO Proyectos(codigo,ubicacionId,servicioId,personaId,nombre,inicio,fin,precio,recursos) VALUES (NULL,'D36','34TT','100457','CARLOS-2','23-09-2021','25-10-2021',10000,100000);

INSERT INTO PERSONAS(codigo,vinculacion) VALUES ('4455','2019-08-21');

INSERT INTO Juridicas(codigo,nit,razonSocial) VALUES ('123456789',123487,'razonSocial');

--CICLO1: PoblarNoOK(3)
INSERT INTO Proyectos(codigo,ubicacionId,servicioId,personaId,nombre,inicio,fin,precio,recursos) VALUES ('1234','D35','34TY','100456','ALBERTO','30-09-2021','31-10-2021',2000,50000);

INSERT INTO Proyectos(codigo,ubicacionId,servicioId,personaId,nombre,inicio,fin,precio,recursos) VALUES ('1234','D35','34TY','100456','ALBERTO-2','30-09-2021','31-10-2021',2000,-50000);

INSERT INTO Proyectos(codigo,ubicacionId,servicioId,personaId,nombre,inicio,fin,precio,recursos) VALUES ('12345','D36','34TT','100457','CARLOS-2','27-09-2021','25-10-2021',10000,100000);

INSERT INTO Servicios(codigo,nombre,tipo,presupuesto) VALUES ('67345','DISEÑO','H',30000000);

INSERT INTO Servicios(codigo,nombre,tipo,presupuesto) VALUES ('67345','INTERVENTORIA','I',45390876);
--CICLO 1: XPoblar(Eliminar los datos)
DELETE FROM Proyectos;
DELETE FROM Participa;

DELETE FROM Servicios;
DELETE FROM ServiciosEspecialidades;

DELETE FROM Especialidades;

DELETE FROM Personas;
DELETE FROM Juridicas;
DELETE FROM Empleados;

DELETE FROM Ubicaciones;
--CICLO 1: Atributos
ALTER TABLE Servicios ADD CONSTRAINT CK_Servicios_tipo
	CHECK(tipo LIKE 'D' OR tipo LIKE 'C' OR tipo LIKE 'I');
	
ALTER TABLE Servicios ADD CONSTRAINT CK_Servicios_presupuesto
	CHECK(presupuesto >= 0 AND MOD(presupuesto,500) = 0);
	
ALTER TABLE Especialidades ADD CONSTRAINT CK_Especialidades_profesional
	CHECK(profesional LIKE 'T' OR profesional LIKE 'F');
	
ALTER TABLE Especialidades ADD CONSTRAINT CK_Especialidades_salario
	CHECK(salario >= 0 AND MOD(salario,500) = 0);
	
ALTER TABLE Participa ADD CONSTRAINT CK_Participa_salario
	CHECK(salario >= 0 AND MOD(salario,500) = 0);
	
ALTER TABLE Participa ADD CONSTRAINT CK_Participa_tiempo
	CHECK(tiempo >= 8 AND tiempo <= 192);
	
ALTER TABLE Proyectos ADD CONSTRAINT CK_Proyectos_precio
	CHECK(precio >= 0 AND MOD(precio,500) = 0 );
	
ALTER TABLE Proyectos ADD CONSTRAINT CK_Proyectos_recursos
	CHECK(recursos >= 0 AND MOD(recursos,500) = 0 );
ALTER TABLE Proyectos ADD CONSTRAINT CK_Proyectos_nombre
	CHECK(recursos LIKE '%-%');
--CICLO1: Primarias
ALTER TABLE Proyectos ADD CONSTRAINT PK_Proyectos
	PRIMARY KEY (codigo);
ALTER TABLE Participa ADD CONSTRAINT PK_Participa
	PRIMARY KEY (empleadoId, proyectoId);
	
ALTER TABLE Servicios ADD CONSTRAINT PK_Servicios
	PRIMARY KEY (codigo);
ALTER TABLE ServiciosEspecialidades ADD CONSTRAINT PK_ServiciosEspecialidades
	PRIMARY KEY (servicioId, nombreEspecialidad);
	
ALTER TABLE Especialidades ADD CONSTRAINT PK_Especialidades
	PRIMARY KEY (nombre);
	
ALTER TABLE Personas ADD CONSTRAINT PK_Personas
	PRIMARY KEY (codigo);
ALTER TABLE Juridicas ADD CONSTRAINT PK_Juridicas
	PRIMARY KEY (codigo);
ALTER TABLE Empleados ADD CONSTRAINT PK_Empleados
	PRIMARY KEY (codigo);
	

ALTER TABLE Ubicaciones ADD CONSTRAINT PK_Ubicaciones
	PRIMARY KEY (codigo);
	
--CICLO1: UNICAS
ALTER TABLE Proyectos ADD CONSTRAINT UK_Proyectos
	UNIQUE (nombre);
ALTER TABLE Juridicas ADD CONSTRAINT UK_Juridicas
	UNIQUE(nit);
--CICLO1: FORANEAS
ALTER TABLE Proyectos ADD CONSTRAINT FK_Proyectos_Ubicaciones
	FOREIGN KEY (ubicacionId) REFERENCES Ubicaciones(codigo);
ALTER TABLE Proyectos ADD CONSTRAINT FK_Proyectos_Servicios
	FOREIGN KEY (servicioId) REFERENCES Servicios(codigo);
ALTER TABLE Proyectos ADD CONSTRAINT FK_Proyectos_Personas
	FOREIGN KEY (personaId) REFERENCES Personas(codigo);
ALTER TABLE Participa ADD CONSTRAINT FK_Participa_Empleados
	FOREIGN KEY (empleadoId) REFERENCES Empleados(codigo);
ALTER TABLE Participa ADD CONSTRAINT FK_Participa_Proyectos
	FOREIGN KEY (proyectoId) REFERENCES Proyectos(codigo);
	
ALTER TABLE ServiciosEspecialidades ADD CONSTRAINT FK_SE_Especialidades
	FOREIGN KEY (servicioId) REFERENCES Especialidades(nombre);
ALTER TABLE ServiciosEspecialidades ADD CONSTRAINT FK_ServiciosE_Especialidades
	FOREIGN KEY (nombreEspecialidad) REFERENCES Servicios(codigo);
	
ALTER TABLE Juridicas ADD CONSTRAINT FK_Juridicas_Personas
	FOREIGN KEY (codigo) REFERENCES Personas(codigo);
ALTER TABLE Empleados ADD CONSTRAINT FK_Empleados_Especialidades
	FOREIGN KEY (especialidad) REFERENCES Especialidades(nombre);
ALTER TABLE Empleados ADD CONSTRAINT FK_Empleados_Ubicaciones
	FOREIGN KEY (vivienda) REFERENCES Ubicaciones(codigo);
--CICLO 1: PoblarNoOK (2)
INSERT INTO Proyectos(codigo,ubicacionId,servicioId,personaId,nombre,inicio,fin,precio,recursos) VALUES ('1234','D35','34TY','100456','ALBERTO','30-09-2021','31-10-2021',2000,50000);

INSERT INTO Proyectos(codigo,ubicacionId,servicioId,personaId,nombre,inicio,fin,precio,recursos) VALUES ('1234','D35','34TY','100456','ALBERTO-2','30-09-2021','31-10-2021',2000,-50000);

INSERT INTO Proyectos(codigo,ubicacionId,servicioId,personaId,nombre,inicio,fin,precio,recursos) VALUES ('12345','D36','34TT','100457','CARLOS-2','27-09-2021','25-10-2021',10000,100000);

INSERT INTO Servicios(codigo,nombre,tipo,presupuesto) VALUES ('67345','DISEÑO','H',30000000);

INSERT INTO Servicios(codigo,nombre,tipo,presupuesto) VALUES ('67345','INTERVENTORIA','I',45390876);
--CICLO1:Consultar las especialidades más requeridas en el año actual
SELECT MAX(especialidades.nombre)
FROM especialidades
--CICLO1:Cuantos proyectos diferentes hay en total
SELECT COUNT(codigo)
FROM proyectos




--Ciclo1: CRUD: Mantener Proyecto

--Tuplas
ALTER TABLE Proyectos ADD CONSTRAINT CK_Proyectos_Inicio
	CHECK (inicio > fecha);
--TuplasOK
INSERT INTO Proyectos(codigo,ubicacionId,servicioId,personaId,nombre,fecha,precio,inicio,fin,recursos,condiciones) VALUES ('1234','D35','67345','100456','ALBERTO-2','20-08-2021',30000000,'15-09-2021','31-10-2021',50000,'50');
--TuplasNoOk
INSERT INTO Proyectos(codigo,ubicacionId,servicioId,personaId,nombre,fecha,precio,inicio,fin,recursos,condiciones) VALUES ('1234','D35','67345','100456','ALBERTO-2','20-08-2021',30000000,'15-07-2021','31-10-2021',50000,'50');
--DISPARADORES:INSERT
CREATE TRIGGER TG_ProyectosCod_BI
BEFORE INSERT ON Proyectos
FOR EACH ROW
DECLARE
caracter_servicio VARCHAR(1);
fecha_actual VARCHAR(30);
BEGIN
SELECT tipo INTO caracter_servicio FROM Servicios
    WHERE Servicios.codigo = :NEW.servicioId;
SELECT TO_CHAR
    (SYSDATE, 'YY-MM-DD HH24:MI:SS')
     INTO fecha_actual FROM DUAL;
:NEW.codigo := CONCAT(caracter_servicio,fecha_actual);
END;
--La fecha se asigna automaticamente
CREATE TRIGGER TG_ProyectosFecha
BEFORE INSERT ON Proyectos
FOR EACH ROW
DECLARE
fecha_actual DATE;
BEGIN
SELECT SYSDATE INTO fecha_actual FROM DUAL;
:NEW.fecha := fecha_actual;
END;
--El precio del proyecto no puede se menor del 90% ni mayor al 110% del presupuesto del servicio correspondiente.
CREATE TRIGGER TG_ProyectosPrecioBI
BEFORE INSERT ON Proyectos
FOR EACH ROW
DECLARE
presupuesto_servicio NUMBER;
BEGIN
SELECT presupuesto INTO presupuesto_servicio FROM Servicios
	WHERE Servicios.codigo = :NEW.servicioId;
IF :NEW.precio < presupuesto_servicio *0.9 OR :NEW.precio > presupuesto_servicio *1.1  THEN
	RAISE_APPLICATION_ERROR(-20003,'Precio no valido');
END IF;
END;
--Los recursos asigados se generan automáticamente y corresponden al 70% del precio del proyecto.
CREATE TRIGGER TG_ProyectosRecursos_AI
BEFORE INSERT ON Proyectos
FOR EACH ROW
BEGIN
:NEW.recursos := :NEW.precio * 0.7;
END;

--DISPARADORES:UPDATE
CREATE OR REPLACE TRIGGER TG_Proyectos_BU
BEFORE UPDATE ON Proyectos
FOR EACH ROW
DECLARE
fecha_actual DATE;
BEGIN
    :NEW.codigo := :OLD.codigo;
    :NEW.ubicacionId := :OLD.ubicacionId;
    :NEW.servicioId := :OLD.servicioId;
    :NEW.personaId := :OLD.personaId;
    :NEW.nombre := :OLD.nombre;
    :NEW.fecha := :OLD.fecha;
    :NEW.inicio := :OLD.inicio;
    :NEW.precio := :OLD.precio;
    :NEW.recursos := :OLD.recursos;
    SELECT SYSDATE INTO fecha_actual FROM dual;
    IF fecha_actual >= :OLD.fin THEN
        :NEW.fin := :OLD.fin;
        :NEW.condiciones := :OLD.condiciones;
    END IF;
END;
--Disparadores: DELETE
CREATE OR REPLACE TRIGGER TG_Proyectos_BD
BEFORE DELETE ON Proyectos
FOR EACH ROW
DECLARE
fecha_actual DATE;
BEGIN
SELECT SYSDATE INTO fecha_actual FROM DUAL;
IF (:OLD.inicio <= fecha_actual) THEN
	RAISE_APPLICATION_ERROR(-20002,'No se permite eliminar');
END IF;

END;

--DisparadoresOK
--1
INSERT INTO Servicios(codigo,nombre,tipo,presupuesto) VALUES ('67345','DISEÑO','D',30000000);
INSERT INTO Proyectos(codigo,ubicacionId,servicioId,personaId,nombre,fecha,precio,inicio,fin,recursos,condiciones) VALUES ('12345','D35','67345','100456','ALBERTO-2','20-08-2021',30000000,'15-09-2021','31-10-2021',50000,'50');
--2
INSERT INTO Proyectos(codigo,ubicacionId,servicioId,personaId,nombre,fecha,precio,inicio,fin,recursos,condiciones) VALUES ('12345','D35','67345','100456','ALBERTO-2','20-08-2021',30000000,'15-11-2021','31-12-2021',50000,'50');
--3
INSERT INTO Proyectos(codigo,ubicacionId,servicioId,personaId,nombre,fecha,precio,inicio,fin,recursos,condiciones) VALUES ('12345','D35','67345','100456','ALBERTO-2','20-08-2021',30000000,'15-11-2021','31-12-2021',50000,'50');
--4
INSERT INTO Proyectos(codigo,ubicacionId,servicioId,personaId,nombre,fecha,precio,inicio,fin,recursos,condiciones) VALUES ('12345','D35','67345','100456','ALBERTO-2','20-08-2021',30000000,'15-11-2021','31-12-2021',50000,'50');
--5 Hay que actualizar el codigo ya que este se genera automatico con la fecha actual
UPDATE Proyectos SET fin = TO_DATE('21-05-2022') WHERE codigo = 'D21-10-14 22:54:57';
--6 Hay que actualizar el codigo ya que este se genera automatico con la fecha actual
ALTER TABLE Proyectos DROP CONSTRAINT CK_Proyectos_Inicio;
INSERT INTO Proyectos(codigo,ubicacionId,servicioId,personaId,nombre,fecha,precio,inicio,fin,recursos,condiciones) VALUES ('12345','D35','67345','100456','ALBERTO-2','20-08-2021',30000000,'15-07-2021','31-12-2021',50000,'50');
DELETE FROM Proyectos WHERE codigo = 'D21-10-14 23:17:09';


--DisparadoresNoOk
--1 No se puede porque el codigo es automatizado
--2
	--Falla ya que la fecha se actualiza automaticamente por la fecha actual
INSERT INTO Proyectos(codigo,ubicacionId,servicioId,personaId,nombre,fecha,precio,inicio,fin,recursos,condiciones) VALUES ('12345','D35','67345','100456','ALBERTO-2','20-08-2021',30000000,'15-10-2021','31-11-2021',50000,'50');
--3 --Precio no valido menor que 90% y mayor 110%
INSERT INTO Proyectos(codigo,ubicacionId,servicioId,personaId,nombre,fecha,precio,inicio,fin,recursos,condiciones) VALUES ('12345','D35','67345','100456','ALBERTO-2','20-08-2021',26000000,'15-11-2021','31-12-2021',50000,'50');
INSERT INTO Proyectos(codigo,ubicacionId,servicioId,personaId,nombre,fecha,precio,inicio,fin,recursos,condiciones) VALUES ('12345','D35','67345','100456','ALBERTO-2','20-08-2021',34000000,'15-11-2021','31-12-2021',50000,'50');
--4 No se puede porque el codigo es automatizado
--5
INSERT INTO Proyectos(codigo,ubicacionId,servicioId,personaId,nombre,fecha,precio,inicio,fin,recursos,condiciones) VALUES ('12345','D35','67345','100456','ALBERTO-2','20-08-2021',30000000,'15-11-2021','10-09-2021',50000,'50');
UPDATE Proyectos SET fin = TO_DATE('21-05-2022') WHERE codigo = 'D21-10-14 23:06:58';
--6 Hay que actualizar el codigo ya que este se genera automatico con la fecha actual
DELETE FROM Proyectos WHERE codigo = 'D21-10-14 22:54:57';
--XDisparadores
DROP TRIGGER TG_ProyectosCod_BI;
DROP TRIGGER TG_ProyectosFecha;
DROP TRIGGER TG_ProyectosPrecioBI;
DROP TRIGGER TG_ProyectosRecursos_AI;
DROP TRIGGER TG_Proyectos_BU;
DROP TRIGGER TG_Proyectos_BD;

--Consultas




--Ciclo2: CRUD: Mantener especialidad

--Tuplas
ALTER TABLE especialidades ADD CONSTRAINT CK_SALARIO_MONEDA 
CHECK(moneda >= 0);

ALTER TABLE especialidades ADD CONSTRAINT CK_PROFESIONAL_NUM 
CHECK(profesional = 0 OR profesional = 1);

--TuplasOK
--1
insert into especialidades values ('Architect', 0, 41000);
--2
insert into especialidades values ('Architect', 1, 41000);

--TuplasNoOk
--1 No deberia aceptar valores menores a 0 en moneda
insert into especialidades values ('Architect', 0, -2);
--2 No deberia aceptar valores diferentes de 0 y 1
insert into especialidades values ('Architect', 3497, 41000);


--DISPARADORES

--DISPARADORES: INSERT
CREATE OR REPLACE TRIGGER TG_EspeProf_BI 
BEFORE INSERT OR UPDATE ON especialidades 
FOR EACH ROW
BEGIN
	:new.nombre := UPPER(:new.nombre);

	IF(:new.profesional > 1) THEN
		:new.profesional := 1;	
	END IF;

	IF(:new.profesional < 0) THEN
		:new.profesional := 0;	
	END IF;

END;

--DISPARADORES: DELETE
CREATE OR REPLACE TRIGGER TG_EspNombre_BD 
BEFORE DELETE OR UPDATE ON especialidades 
FOR EACH ROW
BEGIN

	IF(:old.nombre = 'DESCONOCID') THEN
		RAISE_APPLICATION_ERROR (-20501,'No se puede eliminar el campo "DESCONOCID"');
	END IF;

END;

CREATE OR REPLACE TRIGGER TG_Esp_BD
BEFORE DELETE ON especialidades 
FOR EACH ROW
DECLARE
    n INT;
BEGIN
    SELECT COUNT(*) INTO n FROM recursos WHERE nombre_esp = :old.nombre;

	IF(n > 0) THEN
		RAISE_APPLICATION_ERROR (-20502,'No se puede eliminar especialidades usadas en recursos');
	ELSE
		UPDATE empleados SET nombre_especialidad='DESCONOCID' WHERE nombre_especialidad=:old.nombre;
	END IF;

END;

--DisparadoresOk
--1
INSERT INTO especialidades VALUES('prueba', -1, 0);
--2
INSERT INTO empleados VALUES(0, 2, 'PRUEBA', 1);
--3
DELETE FROM especialidades WHERE nombre='PRUEBA';

--DisparadoresNoOk
--1
INSERT INTO especialidades VALUES('prueba', -1, -1);
--2
DELETE FROM especialidades WHERE nombre='DESCONOCID';
--3
DELETE FROM especialidades WHERE nombre='Expeditor';

--XDisparadores
DROP TRIGGER TG_EspNombre_BD 
DROP TRIGGER TG_EspNombre_BD 
DROP TRIGGER TG_Esp_BD

--Consultas
SELECT proyectos
WHERE fin < CURRENT_DATE;