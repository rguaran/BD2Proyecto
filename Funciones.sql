
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

CREATE OR REPLACE FUNCTION insertarPoliza()
RETURNS void AS $$
BEGIN

END;
$$ LANGUAGE plpgsql



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

CREATE OR REPLACE FUNCTION getIdEstado(_estado varchar(50))
RETURNS INTEGER AS $$
DECLARE idEstado INTEGER;
BEGIN
	SELECT id_estado INTO idEstado FROM Estado_Poliza WHERE estado = _estado;
	RETURN idEstado;
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION getIdCliente(_nombre varchar(50), _pais varchar(50))
RETURNS INTEGER AS $$
DECLARE idCliente INTEGER;
BEGIN
	SELECT id INTO idCliente FROM Cliente WHERE nombre = _nombre AND getIdPais(_pais) = (SELECT id_pais FROM Pais WHERE pais=_pais);
	RETURN idCliente;
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION getIdTS(_tipo varchar(20))
RETURNS TEXT AS $$
DECLARE idTipo TEXT;
BEGIN
	SELECT id_ts INTO idTipo FROM Tipo_De_Seguro WHERE tipo = _tipo;
	RETURN idTipo;
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION getIdEmp(_tipo varchar(10), _codigo integer, _oficina varchar(4), _depto integer)
RETURNS INTEGER AS $$
DECLARE idEmp INTEGER;
BEGIN
	IF _tipo = 'Vendedor' THEN
		SELECT id_emp INTO idEmp FROM Empleado WHERE id_carga = _codigo AND id_oficina = _oficina AND id_dep = _depto;		
	ELSE 
		SELECT id_emp INTO idEmp FROM Empleado WHERE id_carga = _codigo AND id_oficina = _oficina AND id_dep = _depto;
	END IF;
	RETURN idEmp;
END;
$$  LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION getIdNegociador(_nombre varchar(30))
RETURNS INTEGER AS $$
DECLARE idEmp INTEGER;
BEGIN
	SELECT id_emp INTO idEmp FROM Empleado WHERE nombre = _nombre;
	RETURN idEmp;
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION getIdCargaNegociador(_nombre varchar(30))
RETURNS INTEGER AS $$
DECLARE idEmp INTEGER;
BEGIN
	SELECT id_carga INTO idEmp FROM Empleado WHERE nombre = _nombre;
	RETURN idEmp;
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION getIdMoneda(_moneda varchar(50))
RETURNS INTEGER AS $$
DECLARE idMoneda INTEGER;
BEGIN
	SELECT id_moneda INTO idMoneda FROM Moneda WHERE moneda = _moneda;
	RETURN idMoneda;
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION getIdTipoPago(_tipo varchar(50))
RETURNS INTEGER AS $$
DECLARE idTipo INTEGER;
BEGIN
	SELECT id_tp INTO idTipo FROM Tipo_de_pago WHERE tipo = _tipo;
	RETURN idTipo;
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION seleccionarmoneda()
  RETURNS TABLE(id integer, moneda text) AS$$
BEGIN
	
	RETURN QUERY SELECT * FROM Moneda;
END;
$$  LANGUAGE plpgsql;



------------------------------------------------------------------------------------------
-------------------------------------- MODIFICACIONES ------------------------------------
------------------------------------------------------------------------------------------





------------------------------------------------------------------------------------------
-------------------------------------- MODIFICACIONES ------------------------------------
------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION actualizarmoneda(
    _id integer,
    _moneda character varying)
  RETURNS void AS
$$
BEGIN
	UPDATE Moneda SET moneda = _moneda WHERE id_moneda = _id;
END;
$$  LANGUAGE plpgsql;








------------------------------------------------------------------------------------------
-------------------------------------- ELIMINACIONES ------------------------------------
------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION eliminarmoneda(_id integer)
  RETURNS void AS
$$
BEGIN
	DELETE FROM Moneda WHERE id_moneda = _id;
END;
$$  LANGUAGE plpgsql;










