
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

CREATE OR REPLACE FUNCTION insertarEmpleado(_nombre varchar(50), _telefono varchar(20), _tipo varchar(30), _oficina varchar(30))
RETURNS void AS $$
DECLARE idTE INTEGER;
DECLARE idOficina INTEGER;
BEGIN
	SELECT getIdTipoEmpleado (_tipo) INTO idTE;
	SELECT getIdOficina (_oficina) INTO idOficina;
	INSERT INTO Empleado (nombre, telefono, Tipo_Empleado_id_te, Oficina_id_oficina) VALUES (_nombre, _telefono, idTE, idOficina);
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
$$  LANGUAGE plpgsql

CREATE OR REPLACE FUNCTION getIdTipoEmpleado(_tipo varchar(50))
RETURNS INTEGER AS $$
DECLARE idTipoEmp INTEGER;
BEGIN
	SELECT id_te INTO idTipoEmp FROM Tipo_Empleado WHERE tipo = _tipo;
	RETURN idTipoEmp;
END;
$$  LANGUAGE plpgsql

CREATE OR REPLACE FUNCTION getIdDepartamento(_nombre varchar(50))
RETURNS INTEGER AS $$
DECLARE idDepto INTEGER;
BEGIN
	SELECT id_dep INTO idDepto FROM Departamento WHERE nombre = _nombre;
	RETURN idDepto;
END;
$$  LANGUAGE plpgsql

CREATE OR REPLACE FUNCTION getIdOficina(_nombre varchar(50))
RETURNS TEXT AS $$
DECLARE idOficina TEXT;
BEGIN
	SELECT id_oficina INTO idOficina FROM Oficina WHERE nombre = _nombre;
	RETURN idOficina;
END;
$$  LANGUAGE plpgsql

















