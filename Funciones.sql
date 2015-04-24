
---------------------------------------------------------------------------------------
-------------------------------------- INSERCIONES ------------------------------------
---------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION insertarPais(_nombre varchar(50))
RETURNS void AS $$
BEGIN
	INSERT INTO Pais (pais) VALUES (_nombre);
END;
$$  LANGUAGE plpgsql
	
CREATE OR REPLACE FUNCTION insertarTipoCliente(_nombre varchar(50))
RETURNS void AS $$
BEGIN
	INSERT INTO Tipo_Cliente (tipo) VALUES (_nombre);
END;
$$  LANGUAGE plpgsql
	
CREATE OR REPLACE FUNCTION insertarFotografia(_nombre varchar(50))
RETURNS void AS $$
BEGIN
	INSERT INTO Fotografia (nombre) VALUES (_nombre);
END;
$$  LANGUAGE plpgsql
	
CREATE OR REPLACE FUNCTION insertarMoneda(_nombre varchar(50))
RETURNS void AS $$
BEGIN
	INSERT INTO Moneda (moneda) VALUES (_nombre);
END;
$$  LANGUAGE plpgsql
	
CREATE OR REPLACE FUNCTION insertarTipoEmpleado(_nombre varchar(50))
RETURNS void AS $$
BEGIN
	INSERT INTO Tipo_Empleado (tipo) VALUES (_nombre);
END;
$$  LANGUAGE plpgsql

CREATE OR REPLACE FUNCTION insertarDepartamento(_nombre varchar(50))
RETURNS void AS $$
BEGIN
	INSERT INTO Departamento (nombre) VALUES (_nombre);
END;
$$  LANGUAGE plpgsql
	
CREATE OR REPLACE FUNCTION insertarCondiciones(_nombre varchar(50))
RETURNS void AS $$
BEGIN
	INSERT INTO Condiciones (tipo) VALUES (_nombre);
END;
$$  LANGUAGE plpgsql
	
CREATE OR REPLACE FUNCTION insertarEstadoPoliza(_nombre varchar(50))
RETURNS void AS $$
BEGIN
	INSERT INTO Estado_Poliza (estado) VALUES (_nombre);
END;
$$  LANGUAGE plpgsql
	
CREATE OR REPLACE FUNCTION insertarCondicionesGenerales(_nombre varchar(50))
RETURNS void AS $$
BEGIN
	INSERT INTO Condiciones_Generales (condicion) VALUES (_nombre);
END;
$$  LANGUAGE plpgsql

CREATE OR REPLACE FUNCTION insertarOficina(_id varchar(5),_nombre varchar(50), _departamento varchar(50))
RETURNS void AS $$
DECLARE idDepto INTEGER;
BEGIN
	SELECT getIdDepartamento(_departamento) INTO idDepto;
	INSERT INTO Oficina (id_oficina, nombre, Departamento_id_dep) VALUES (_id, _nombre, idDepto);
END;
$$  LANGUAGE plpgsql

CREATE OR REPLACE FUNCTION insertarEmpleado(_nombre varchar(50), _telefono varchar(20), _tipo varchar(30), _oficina varchar(30), _depto varchar(30))
RETURNS void AS $$
DECLARE idTE INTEGER;
DECLARE idOficina INTEGER;
DECLARE idDepto INTEGER;
BEGIN
	SELECT getIdTipoEmpleado (_tipo) INTO idTE;
	SELECT getIdOficina (_oficina) INTO idOficina;
	SELECT getIdDepartamento (_depto) INTO idDepto;
	INSERT INTO Empleado (nombre, telefono, Tipo_Empleado_id_te, Oficina_id_oficina, Oficina_Departamento_id_dep) VALUES (_nombre, _telefono, idTE, idOficina, idDepto);
END;
$$  LANGUAGE plpgsql

------------------------------------------------------------------------------------------
-------------------------------------- RECUPERACIONES ------------------------------------
------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION getIdPais(_nombre varchar(50))
RETURNS INTEGER AS $$
DECLARE idPais INTEGER;
BEGIN
	SELECT id_pais INTO idPais FROM Pais WHERE pais = _nombre;
	RETURN idPais;
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION getIdTipoCliente(_nombre varchar(50))
RETURNS INTEGER AS $$
DECLARE idTC INTEGER;
BEGIN
	SELECT id INTO idTC FROM Tipo_Cliente WHERE tipo = _nombre;
	RETURN idTC;
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION getIdTipoEmpleado(_tipo varchar(50))
RETURNS INTEGER AS $$
DECLARE idTipoEmp INTEGER;
BEGIN
	SELECT id_te INTO idTipoEmp FROM Tipo_Empleado WHERE tipo = _tipo;
	RETURN idTipoEmp;
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION getIdDepartamento(_nombre varchar(50))
RETURNS INTEGER AS $$
DECLARE idDepto INTEGER;
BEGIN
	SELECT id_dep INTO idDepto FROM Departamento WHERE nombre = _nombre;
	RETURN idDepto;
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION getIdOficina(_nombre varchar(50))
RETURNS TEXT AS $$
DECLARE idOficina TEXT;
BEGIN
	SELECT id_oficina INTO idOficina FROM Oficina WHERE nombre = _nombre;
	RETURN idOficina;
END;
$$  LANGUAGE plpgsql;


------------------------------------------------------------------------------------------
-------------------------------------- CARGA DE DATOS ------------------------------------
------------------------------------------------------------------------------------------

INSERT INTO Pais (pais) 
SELECT DISTINCT pais
FROM datos
ORDER BY pais ASC;

INSERT INTO Estado_Poliza (estado)
SELECT DISTINCT estado
FROM datos
ORDER BY estado ASC;

INSERT INTO Moneda (moneda)
SELECT DISTINCT moneda
FROM datos
ORDER BY moneda ASC;

-------------------------------------- Tipos de seguro ------------------------------------
INSERT INTO Tipo_De_Seguro (id_ts, tipo) VALUES ('AUTO','Automovil');
INSERT INTO Tipo_De_Seguro (id_ts, tipo) VALUES ('BIEN','Bienes');
INSERT INTO Tipo_De_Seguro (id_ts, tipo) VALUES ('CONF','Confidencial');
INSERT INTO Tipo_De_Seguro (id_ts, tipo) VALUES ('ELEC','Electronico');
INSERT INTO Tipo_De_Seguro (id_ts, tipo) VALUES ('EVEN','Evento');
INSERT INTO Tipo_De_Seguro (id_ts, tipo) VALUES ('GARAN','Garantia');
INSERT INTO Tipo_De_Seguro (id_ts, tipo) VALUES ('HOGAR','Hogar');
INSERT INTO Tipo_De_Seguro (id_ts, tipo) VALUES ('IMPOR','Importacion');
INSERT INTO Tipo_De_Seguro (id_ts, tipo) VALUES ('MEDIC','Medico');
INSERT INTO Tipo_De_Seguro (id_ts, tipo) VALUES ('MERCA','Mercaderia');
INSERT INTO Tipo_De_Seguro (id_ts, tipo) VALUES ('TRANS','Transporte');
INSERT INTO Tipo_De_Seguro (id_ts, tipo) VALUES ('VIAJE','Viaje');
INSERT INTO Tipo_De_Seguro (id_ts, tipo) VALUES ('VIDA','Vida');

INSERT INTO Tipo_Cliente (tipo) VALUES ('Persona individual');
INSERT INTO Tipo_Cliente (tipo) VALUES ('Empresa');

-------------------------------------- Clientes Empresas ------------------------------------
INSERT INTO cliente   (nombre, domicilio, id1, id_pais)
	SELECT C.cliente, 'Ciudad', getIdTipoCliente('Empresa'), getIdPais(C.pais)
	FROM (
		SELECT DISTINCT cliente, COUNT(*) cantidad, pais
		FROM Datos 
		GROUP BY cliente, pais
	) C
	WHERE C.cantidad >= 14;

	-------------------------------------- Clientes Personas ------------------------------------
INSERT INTO cliente (nombre, domicilio, id1, id_pais)
	SELECT C.cliente, 'Ciudad', getIdTipoCliente('Persona individual'), getIdPais(C.pais)
	FROM (
		SELECT DISTINCT cliente, COUNT(*) cantidad, pais
		FROM Datos 
		GROUP BY cliente, pais
	) C	
	WHERE C.cantidad < 14;
	
INSERT INTO Departamento (nombre)
SELECT DISTINCT depto
FROM datos
ORDER BY depto ASC;

INSERT INTO Oficina  (id_oficina, nombre, id_dep)
SELECT C.codigo_oficina, CONCAT('Oficina ', C.codigo_oficina), getIdDepartamento(C.depto)
FROM (
	SELECT DISTINCT codigo_oficina, depto
	FROM Datos
) C;

-------------------------------------- Tipos de empleado ------------------------------------
INSERT INTO Tipo_Empleado (tipo) VALUES ('Inspector');
INSERT INTO Tipo_Empleado (tipo) VALUES ('Corredor');
INSERT INTO Tipo_Empleado (tipo) VALUES ('Vendedor');
INSERT INTO Tipo_Empleado (tipo) VALUES ('Asesor');
INSERT INTO Tipo_Empleado (tipo) VALUES ('Operador');
INSERT INTO Tipo_Empleado (tipo) VALUES ('Negociador');



-------------------------------------- Empleados Operadores ------------------------------------
INSERT INTO Empleado  (id_carga, nombre, telefono, id_te, id_oficina, id_dep)
SELECT DISTINCT codigo_operador, '', '', getIdTipoEmpleado('Operador'), codigo_oficina, getIdDepartamento(depto)
FROM Datos;

-------------------------------------- Empleados Vendedores ------------------------------------
INSERT INTO Empleado  (id_carga, nombre, telefono, id_te, id_oficina, id_dep)
SELECT DISTINCT codigo_vendedor, '', '', getIdTipoEmpleado('Vendedor'), codigo_oficina, getIdDepartamento(depto)
FROM Datos;

-------------------------------------- Empleados Negociadores ------------------------------------
INSERT INTO Empleado  (nombre, telefono, id_te, id_oficina, id_dep)
SELECT DISTINCT negocio, '', getIdTipoEmpleado('Negociador'), codigo_oficina, getIdDepartamento(depto)
FROM Datos;






























