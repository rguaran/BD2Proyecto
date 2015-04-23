--- INSERCIONES ---

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

--- RECUPERACIONES ---

CREATE OR REPLACE FUNCTION obtenerPais(_nombre varchar(50))
RETURNS INTEGER AS $$
DECLARE idPais INTEGER;
BEGIN
	SELECT id_pais INTO idPais FROM Pais WHERE pais = _nombre;
	RETURN idPais;
END;
$$  LANGUAGE plpgsql

CREATE OR REPLACE FUNCTION obtenerTipoEmpleado(_tipo varchar(50))
RETURNS INTEGER AS $$
DECLARE idTipoEmp INTEGER;
BEGIN
	SELECT id_te INTO idTipoEmp FROM Tipo_Empleado WHERE tipo = _tipo;
	RETURN idTipoEmp;
END;
$$  LANGUAGE plpgsql















