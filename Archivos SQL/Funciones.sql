
---------------------------------------------------------------------------------------
-------------------------------------- INSERCIONES ------------------------------------
---------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION insertarPais(_usuario varchar(20), _nombre varchar(50))
RETURNS void AS $$
BEGIN
	INSERT INTO Pais (pais) VALUES (_nombre);
	INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Insertar', 'Pais');
END;
$$  LANGUAGE plpgsql
	
CREATE OR REPLACE FUNCTION insertarTipoCliente(_usuario varchar(20), _nombre varchar(50))
RETURNS void AS $$
BEGIN
	INSERT INTO Tipo_Cliente (tipo) VALUES (_nombre);
	INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Insertar', 'Tipo Cliente');
END;
$$  LANGUAGE plpgsql
	
CREATE OR REPLACE FUNCTION insertarFotografia(_usuario varchar(20), _nombre varchar(50))
RETURNS void AS $$
BEGIN
	INSERT INTO Fotografia (nombre) VALUES (_nombre);
	INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Insertar', 'Fotografia');
END;
$$  LANGUAGE plpgsql
	
CREATE OR REPLACE FUNCTION insertarMoneda(_usuario varchar(20), _nombre varchar(50))
RETURNS void AS $$
BEGIN
	INSERT INTO Moneda (moneda) VALUES (_nombre);
	INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Insertar', 'Moneda');
END;
$$  LANGUAGE plpgsql
	
CREATE OR REPLACE FUNCTION insertarTipoEmpleado(_usuario varchar(20), _nombre varchar(50))
RETURNS void AS $$
BEGIN
	INSERT INTO Tipo_Empleado (tipo) VALUES (_nombre);
	INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Insertar', 'Tipo Empleado');
END;
$$  LANGUAGE plpgsql

CREATE OR REPLACE FUNCTION insertarDepartamento(_usuario varchar(20), _nombre varchar(50))
RETURNS void AS $$
BEGIN
	INSERT INTO Departamento (nombre) VALUES (_nombre);
	INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Insertar', 'Departamento ');
END;
$$  LANGUAGE plpgsql
	
CREATE OR REPLACE FUNCTION insertarCondiciones(_usuario varchar(20), _nombre varchar(50))
RETURNS void AS $$
BEGIN
	INSERT INTO Condiciones (tipo) VALUES (_nombre);
	INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Insertar', 'Condiciones ');
END;
$$  LANGUAGE plpgsql
	
CREATE OR REPLACE FUNCTION insertarEstadoPoliza(_usuario varchar(20), _nombre varchar(50))
RETURNS void AS $$
BEGIN
	INSERT INTO Estado_Poliza (estado) VALUES (_nombre);
	INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Insertar', 'Estado Poliza ');
END;
$$  LANGUAGE plpgsql
	
CREATE OR REPLACE FUNCTION insertarCondicionesGenerales(_usuario varchar(20), _nombre varchar(50))
RETURNS void AS $$
BEGIN
	INSERT INTO Condiciones_Generales (condicion) VALUES (_nombre);
	INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Insertar', 'Condiciones Generales');
END;
$$  LANGUAGE plpgsql

CREATE OR REPLACE FUNCTION insertarOficina(_usuario varchar(20), _id varchar(5),_nombre varchar(50), _departamento varchar(50))
RETURNS void AS $$
DECLARE idDepto INTEGER;
BEGIN
	SELECT getIdDepartamento(_departamento) INTO idDepto;
	INSERT INTO Oficina (id_oficina, nombre, Departamento_id_dep) VALUES (_id, _nombre, idDepto);
	INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Insertar', 'Oficina ');
END;
$$  LANGUAGE plpgsql

CREATE OR REPLACE FUNCTION insertarEmpleado(_usuario varchar(20), _nombre varchar(50), _telefono varchar(20), _tipo varchar(30), _oficina varchar(30), _depto varchar(30))
RETURNS void AS $$
DECLARE idTE INTEGER;
DECLARE idOficina INTEGER;
DECLARE idDepto INTEGER;
BEGIN
	SELECT getIdTipoEmpleado (_tipo) INTO idTE;
	SELECT getIdOficina (_oficina) INTO idOficina;
	SELECT getIdDepartamento (_depto) INTO idDepto;
	INSERT INTO Empleado (nombre, telefono, Tipo_Empleado_id_te, Oficina_id_oficina, Oficina_Departamento_id_dep) VALUES 
	(_nombre, _telefono, idTE, idOficina, idDepto);
	INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Insertar', 'Empleados');
END;
$$  LANGUAGE plpgsql

CREATE OR REPLACE FUNCTION insertarPoliza(_usuario varchar(20), _estado, _cp, _fechaIni, _fechaFin, _clausulas, _nombreCliente, _pais, _tipoSeguro, _polizaVieja, _meses,
										  _productoDescripcion, )
RETURNS void AS $$
BEGIN
	INSERT INTO Poliza(id_estado, id_cp, fecha_inicio, fecha_fin, clausulas, id, id_ts, poliza_vieja, meses, producto_descripcion, status,
						id_vendedor, id_operador, id_negociador, cod_venta, coberturas_adicionales, id_cargaV, id_cargaO, id_cargaN) 
			VALUES   (getIdEstado(_estado), getIdCondicionParticular(_cp), _fechaIni, _fechaFin, _clausulas, getIdCliente(_nombreCliente, _pais),
						getIdTS(_tipoSeguro), _polizaVieja, _meses, _productoDescripcion, _estado, r);
	INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Insertar', 'Poliza');
END;
$$ LANGUAGE plpgsql


CREATE OR REPLACE FUNCTION insertarCliente(_usuario varchar(20), _nombre varchar(50), _domicilio varchar(75), _idTipo integer, _idPais integer)
RETURNS void AS $$
BEGIN
	INSERT INTO Cliente (nombre, domicilio, id1, id_pais) VALUES (_nombre, _domicilio, _idTipo, _idPais);
	INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Insertar', 'Cliente');
END;
$$  LANGUAGE plpgsql;

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

CREATE OR REPLACE FUNCTION getIdCondicionParticular(_condicion varchar(50))
RETURNS INTEGER AS $$
DECLARE idCp INTEGER;
BEGIN
	SELECT id_cp INTO idCp FROM Condiciones_Particulares WHERE condicion = _condicion;
	RETURN idCp;
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



------------------------------------------------------------------------------------------
-------------------------------------- MODIFICACIONES ------------------------------------
------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION actualizarCliente(_usuario varchar(20), _idCliente integer, _nombre varchar(50), _domicilio varchar(75), _idTipo integer, _idPais integer)
RETURNS void AS $$
BEGIN
	UPDATE Cliente SET nombre = _nombre WHERE id = _idCliente;
	UPDATE Cliente SET domicilio = _domicilio WHERE id = _idCliente;
	UPDATE Cliente SET id1 = _idTipo WHERE id = _idCliente;
	UPDATE Cliente SET id_pais = _idPais WHERE id = _idCliente;
	INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Modificar', 'Cliente');
END;
$$  LANGUAGE plpgsql





------------------------------------------------------------------------------------------
-------------------------------------- ELIMINACIONES -------------------------------------
------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION eliminarCliente(_usuario varchar(20), _id integer)
RETURNS void AS $$
BEGIN
	DELETE FROM Cliente WHERE id = _id;
	INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Eliminar', 'Cliente');
END;
$$  LANGUAGE plpgsql



------------------------------------------------------------------------------------------
-------------------------------------- TAREA PROGRAMADA -------------------------------------
------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION tarea()
RETURNS void AS $$
DECLARE lastTime TIMESTAMP;
DECLARE actual TIMESTAMP;
DECLARE ins INTEGER;	
DECLARE upd INTEGER;	
DECLARE del INTEGER;	
BEGIN
	-- Primero extraemos las fechas para hacer la comparación --
	SELECT NOW() INTO actual;
	SELECT fecha INTO lastTime FROM TareaProgramada WHERE tabla = 'Estado Poliza' ORDER BY id_tarea DESC LIMIT 1 ;
	
	-- Estado Poliza --
	SELECT COUNT(*) INTO ins FROM Bitacora WHERE modulo = 'Estado Poliza' AND accion='insert' AND fecha BETWEEN lastTime AND actual;
	SELECT COUNT(*) INTO upd FROM Bitacora WHERE modulo = 'Estado Poliza' AND accion='update' AND fecha BETWEEN lastTime AND actual;
	SELECT COUNT(*) INTO del FROM Bitacora WHERE modulo = 'Estado Poliza' AND accion='delete' AND fecha BETWEEN lastTime AND actual;
	INSERT INTO TareaProgramada (fecha, tabla, inserciones, modificaciones, eliminaciones) VALUES (NOW(), 'Estado Poliza', ins, upd, del);
	
	-- Poliza Condicion--
	SELECT COUNT(*) INTO ins FROM Bitacora WHERE modulo = 'Poliza Condicion' AND accion='insert' AND fecha BETWEEN lastTime AND actual;
	SELECT COUNT(*) INTO upd FROM Bitacora WHERE modulo = 'Poliza Condicion' AND accion='update' AND fecha BETWEEN lastTime AND actual;
	SELECT COUNT(*) INTO del FROM Bitacora WHERE modulo = 'Poliza Condicion' AND accion='delete' AND fecha BETWEEN lastTime AND actual;
	INSERT INTO TareaProgramada (fecha, tabla, inserciones, modificaciones, eliminaciones) VALUES (NOW(), 'Poliza Condicion', ins, upd, del);
	
	-- Condiciones Generales --
	SELECT COUNT(*) INTO ins FROM Bitacora WHERE modulo = 'Condiciones Generales' AND accion='insert' AND fecha BETWEEN lastTime AND actual;
	SELECT COUNT(*) INTO upd FROM Bitacora WHERE modulo = 'Condiciones Generales' AND accion='update' AND fecha BETWEEN lastTime AND actual;
	SELECT COUNT(*) INTO del FROM Bitacora WHERE modulo = 'Condiciones Generales' AND accion='delete' AND fecha BETWEEN lastTime AND actual;
	INSERT INTO TareaProgramada (fecha, tabla, inserciones, modificaciones, eliminaciones) VALUES (NOW(), 'Condiciones Generales', ins, upd, del);
	
	-- Condiciones Particulares --
	SELECT COUNT(*) INTO ins FROM Bitacora WHERE modulo = 'Condiciones Particulares' AND accion='insert' AND fecha BETWEEN lastTime AND actual;
	SELECT COUNT(*) INTO upd FROM Bitacora WHERE modulo = 'Condiciones Particulares' AND accion='update' AND fecha BETWEEN lastTime AND actual;
	SELECT COUNT(*) INTO del FROM Bitacora WHERE modulo = 'Condiciones Particulares' AND accion='delete' AND fecha BETWEEN lastTime AND actual;
	INSERT INTO TareaProgramada (fecha, tabla, inserciones, modificaciones, eliminaciones) VALUES (NOW(), 'Condiciones Particulares', ins, upd, del);
	
	-- Tipo Cliente --
	SELECT COUNT(*) INTO ins FROM Bitacora WHERE modulo = 'Tipo Cliente' AND accion='insert' AND fecha BETWEEN lastTime AND actual;
	SELECT COUNT(*) INTO upd FROM Bitacora WHERE modulo = 'Tipo Cliente' AND accion='update' AND fecha BETWEEN lastTime AND actual;
	SELECT COUNT(*) INTO del FROM Bitacora WHERE modulo = 'Tipo Cliente' AND accion='delete' AND fecha BETWEEN lastTime AND actual;
	INSERT INTO TareaProgramada (fecha, tabla, inserciones, modificaciones, eliminaciones) VALUES (NOW(), 'Tipo Cliente', ins, upd, del);
	
	-- Pais --
	SELECT COUNT(*) INTO ins FROM Bitacora WHERE modulo = 'Pais' AND accion='insert' AND fecha BETWEEN lastTime AND actual;
	SELECT COUNT(*) INTO upd FROM Bitacora WHERE modulo = 'Pais' AND accion='update' AND fecha BETWEEN lastTime AND actual;
	SELECT COUNT(*) INTO del FROM Bitacora WHERE modulo = 'Pais' AND accion='delete' AND fecha BETWEEN lastTime AND actual;
	INSERT INTO TareaProgramada (fecha, tabla, inserciones, modificaciones, eliminaciones) VALUES (NOW(), 'Pais', ins, upd, del);
	
	-- Cliente --
	SELECT COUNT(*) INTO ins FROM Bitacora WHERE modulo = 'Cliente' AND accion='insert' AND fecha BETWEEN lastTime AND actual;
	SELECT COUNT(*) INTO upd FROM Bitacora WHERE modulo = 'Cliente' AND accion='update' AND fecha BETWEEN lastTime AND actual;
	SELECT COUNT(*) INTO del FROM Bitacora WHERE modulo = 'Cliente' AND accion='delete' AND fecha BETWEEN lastTime AND actual;
	INSERT INTO TareaProgramada (fecha, tabla, inserciones, modificaciones, eliminaciones) VALUES (NOW(), 'Cliente', ins, upd, del);
	
	-- Cobertura --
	SELECT COUNT(*) INTO ins FROM Bitacora WHERE modulo = 'Cobertura' AND accion='insert' AND fecha BETWEEN lastTime AND actual;
	SELECT COUNT(*) INTO upd FROM Bitacora WHERE modulo = 'Cobertura' AND accion='update' AND fecha BETWEEN lastTime AND actual;
	SELECT COUNT(*) INTO del FROM Bitacora WHERE modulo = 'Cobertura' AND accion='delete' AND fecha BETWEEN lastTime AND actual;
	INSERT INTO TareaProgramada (fecha, tabla, inserciones, modificaciones, eliminaciones) VALUES (NOW(), 'Cobertura', ins, upd, del);
	
	-- Archivos --
	SELECT COUNT(*) INTO ins FROM Bitacora WHERE modulo = 'Archivos' AND accion='insert' AND fecha BETWEEN lastTime AND actual;
	SELECT COUNT(*) INTO upd FROM Bitacora WHERE modulo = 'Archivos' AND accion='update' AND fecha BETWEEN lastTime AND actual;
	SELECT COUNT(*) INTO del FROM Bitacora WHERE modulo = 'Archivos' AND accion='delete' AND fecha BETWEEN lastTime AND actual;
	INSERT INTO TareaProgramada (fecha, tabla, inserciones, modificaciones, eliminaciones) VALUES (NOW(), 'Archivos', ins, upd, del);
	
	-- Fotografia --
	SELECT COUNT(*) INTO ins FROM Bitacora WHERE modulo = 'Fotografia' AND accion='insert' AND fecha BETWEEN lastTime AND actual;
	SELECT COUNT(*) INTO upd FROM Bitacora WHERE modulo = 'Fotografia' AND accion='update' AND fecha BETWEEN lastTime AND actual;
	SELECT COUNT(*) INTO del FROM Bitacora WHERE modulo = 'Fotografia' AND accion='delete' AND fecha BETWEEN lastTime AND actual;
	INSERT INTO TareaProgramada (fecha, tabla, inserciones, modificaciones, eliminaciones) VALUES (NOW(), 'Fotografia', ins, upd, del);
	
	-- Bien --
	SELECT COUNT(*) INTO ins FROM Bitacora WHERE modulo = 'Bien' AND accion='insert' AND fecha BETWEEN lastTime AND actual;
	SELECT COUNT(*) INTO upd FROM Bitacora WHERE modulo = 'Bien' AND accion='update' AND fecha BETWEEN lastTime AND actual;
	SELECT COUNT(*) INTO del FROM Bitacora WHERE modulo = 'Bien' AND accion='delete' AND fecha BETWEEN lastTime AND actual;
	INSERT INTO TareaProgramada (fecha, tabla, inserciones, modificaciones, eliminaciones) VALUES (NOW(), 'Bien', ins, upd, del);
	
	-- Inspeccion --
	SELECT COUNT(*) INTO ins FROM Bitacora WHERE modulo = 'Inspeccion' AND accion='insert' AND fecha BETWEEN lastTime AND actual;
	SELECT COUNT(*) INTO upd FROM Bitacora WHERE modulo = 'Inspeccion' AND accion='update' AND fecha BETWEEN lastTime AND actual;
	SELECT COUNT(*) INTO del FROM Bitacora WHERE modulo = 'Inspeccion' AND accion='delete' AND fecha BETWEEN lastTime AND actual;
	INSERT INTO TareaProgramada (fecha, tabla, inserciones, modificaciones, eliminaciones) VALUES (NOW(), 'Inspeccion', ins, upd, del);
	
	-- Empleado --
	SELECT COUNT(*) INTO ins FROM Bitacora WHERE modulo = 'Empleado' AND accion='insert' AND fecha BETWEEN lastTime AND actual;
	SELECT COUNT(*) INTO upd FROM Bitacora WHERE modulo = 'Empleado' AND accion='update' AND fecha BETWEEN lastTime AND actual;
	SELECT COUNT(*) INTO del FROM Bitacora WHERE modulo = 'Empleado' AND accion='delete' AND fecha BETWEEN lastTime AND actual;
	INSERT INTO TareaProgramada (fecha, tabla, inserciones, modificaciones, eliminaciones) VALUES (NOW(), 'Empleado', ins, upd, del);
	
	-- Departamento --
	SELECT COUNT(*) INTO ins FROM Bitacora WHERE modulo = 'Departamento' AND accion='insert' AND fecha BETWEEN lastTime AND actual;
	SELECT COUNT(*) INTO upd FROM Bitacora WHERE modulo = 'Departamento' AND accion='update' AND fecha BETWEEN lastTime AND actual;
	SELECT COUNT(*) INTO del FROM Bitacora WHERE modulo = 'Departamento' AND accion='delete' AND fecha BETWEEN lastTime AND actual;
	INSERT INTO TareaProgramada (fecha, tabla, inserciones, modificaciones, eliminaciones) VALUES (NOW(), 'Departamento', ins, upd, del);
	
	-- Oficina --
	SELECT COUNT(*) INTO ins FROM Bitacora WHERE modulo = 'Oficina' AND accion='insert' AND fecha BETWEEN lastTime AND actual;
	SELECT COUNT(*) INTO upd FROM Bitacora WHERE modulo = 'Oficina' AND accion='update' AND fecha BETWEEN lastTime AND actual;
	SELECT COUNT(*) INTO del FROM Bitacora WHERE modulo = 'Oficina' AND accion='delete' AND fecha BETWEEN lastTime AND actual;
	INSERT INTO TareaProgramada (fecha, tabla, inserciones, modificaciones, eliminaciones) VALUES (NOW(), 'Oficina', ins, upd, del);
	
	-- Tipo Empleado --
	SELECT COUNT(*) INTO ins FROM Bitacora WHERE modulo = 'Tipo Empleado' AND accion='insert' AND fecha BETWEEN lastTime AND actual;
	SELECT COUNT(*) INTO upd FROM Bitacora WHERE modulo = 'Tipo Empleado' AND accion='update' AND fecha BETWEEN lastTime AND actual;
	SELECT COUNT(*) INTO del FROM Bitacora WHERE modulo = 'Tipo Empleado' AND accion='delete' AND fecha BETWEEN lastTime AND actual;
	INSERT INTO TareaProgramada (fecha, tabla, inserciones, modificaciones, eliminaciones) VALUES (NOW(), 'Tipo Empleado', ins, upd, del);
	
	-- Moneda --
	SELECT COUNT(*) INTO ins FROM Bitacora WHERE modulo = 'Moneda' AND accion='insert' AND fecha BETWEEN lastTime AND actual;
	SELECT COUNT(*) INTO upd FROM Bitacora WHERE modulo = 'Moneda' AND accion='update' AND fecha BETWEEN lastTime AND actual;
	SELECT COUNT(*) INTO del FROM Bitacora WHERE modulo = 'Moneda' AND accion='delete' AND fecha BETWEEN lastTime AND actual;
	INSERT INTO TareaProgramada (fecha, tabla, inserciones, modificaciones, eliminaciones) VALUES (NOW(), 'Moneda', ins, upd, del);
	
	-- Tipo De Cambio --
	SELECT COUNT(*) INTO ins FROM Bitacora WHERE modulo = 'Tipo De Cambio' AND accion='insert' AND fecha BETWEEN lastTime AND actual;
	SELECT COUNT(*) INTO upd FROM Bitacora WHERE modulo = 'Tipo De Cambio' AND accion='update' AND fecha BETWEEN lastTime AND actual;
	SELECT COUNT(*) INTO del FROM Bitacora WHERE modulo = 'Tipo De Cambio' AND accion='delete' AND fecha BETWEEN lastTime AND actual;
	INSERT INTO TareaProgramada (fecha, tabla, inserciones, modificaciones, eliminaciones) VALUES (NOW(), 'Tipo De Cambio', ins, upd, del);
	
	-- Plan De Pagos --
	SELECT COUNT(*) INTO ins FROM Bitacora WHERE modulo = 'Plan De Pagos' AND accion='insert' AND fecha BETWEEN lastTime AND actual;
	SELECT COUNT(*) INTO upd FROM Bitacora WHERE modulo = 'Plan De Pagos' AND accion='update' AND fecha BETWEEN lastTime AND actual;
	SELECT COUNT(*) INTO del FROM Bitacora WHERE modulo = 'Plan De Pagos' AND accion='delete' AND fecha BETWEEN lastTime AND actual;
	INSERT INTO TareaProgramada (fecha, tabla, inserciones, modificaciones, eliminaciones) VALUES (NOW(), 'Plan De Pagos', ins, upd, del);
	
	-- Detalle Pago --
	SELECT COUNT(*) INTO ins FROM Bitacora WHERE modulo = 'Detalle Pago' AND accion='insert' AND fecha BETWEEN lastTime AND actual;
	SELECT COUNT(*) INTO upd FROM Bitacora WHERE modulo = 'Detalle Pago' AND accion='update' AND fecha BETWEEN lastTime AND actual;
	SELECT COUNT(*) INTO del FROM Bitacora WHERE modulo = 'Detalle Pago' AND accion='delete' AND fecha BETWEEN lastTime AND actual;
	INSERT INTO TareaProgramada (fecha, tabla, inserciones, modificaciones, eliminaciones) VALUES (NOW(), 'Detalle Pago', ins, upd, del);
	
	-- Tipo De Pago --
	SELECT COUNT(*) INTO ins FROM Bitacora WHERE modulo = 'Tipo De Pago' AND accion='insert' AND fecha BETWEEN lastTime AND actual;
	SELECT COUNT(*) INTO upd FROM Bitacora WHERE modulo = 'Tipo De Pago' AND accion='update' AND fecha BETWEEN lastTime AND actual;
	SELECT COUNT(*) INTO del FROM Bitacora WHERE modulo = 'Tipo De Pago' AND accion='delete' AND fecha BETWEEN lastTime AND actual;
	INSERT INTO TareaProgramada (fecha, tabla, inserciones, modificaciones, eliminaciones) VALUES (NOW(), 'Tipo De Pago', ins, upd, del);
	
	-- Condiciones --
	SELECT COUNT(*) INTO ins FROM Bitacora WHERE modulo = 'Condiciones' AND accion='insert' AND fecha BETWEEN lastTime AND actual;
	SELECT COUNT(*) INTO upd FROM Bitacora WHERE modulo = 'Condiciones' AND accion='update' AND fecha BETWEEN lastTime AND actual;
	SELECT COUNT(*) INTO del FROM Bitacora WHERE modulo = 'Condiciones' AND accion='delete' AND fecha BETWEEN lastTime AND actual;
	INSERT INTO TareaProgramada (fecha, tabla, inserciones, modificaciones, eliminaciones) VALUES (NOW(), 'Condiciones', ins, upd, del);
	
	-- Tipo De Seguro --
	SELECT COUNT(*) INTO ins FROM Bitacora WHERE modulo = 'Tipo De Seguro' AND accion='insert' AND fecha BETWEEN lastTime AND actual;
	SELECT COUNT(*) INTO upd FROM Bitacora WHERE modulo = 'Tipo De Seguro' AND accion='update' AND fecha BETWEEN lastTime AND actual;
	SELECT COUNT(*) INTO del FROM Bitacora WHERE modulo = 'Tipo De Seguro' AND accion='delete' AND fecha BETWEEN lastTime AND actual;
	INSERT INTO TareaProgramada (fecha, tabla, inserciones, modificaciones, eliminaciones) VALUES (NOW(), 'Tipo De Seguro', ins, upd, del);
	
	-- Beneficiario --
	SELECT COUNT(*) INTO ins FROM Bitacora WHERE modulo = 'Beneficiario' AND accion='insert' AND fecha BETWEEN lastTime AND actual;
	SELECT COUNT(*) INTO upd FROM Bitacora WHERE modulo = 'Beneficiario' AND accion='update' AND fecha BETWEEN lastTime AND actual;
	SELECT COUNT(*) INTO del FROM Bitacora WHERE modulo = 'Beneficiario' AND accion='delete' AND fecha BETWEEN lastTime AND actual;
	INSERT INTO TareaProgramada (fecha, tabla, inserciones, modificaciones, eliminaciones) VALUES (NOW(), 'Beneficiario', ins, upd, del);
	
	-- Poliza --
	SELECT COUNT(*) INTO ins FROM Bitacora WHERE modulo = 'Poliza' AND accion='insert' AND fecha BETWEEN lastTime AND actual;
	SELECT COUNT(*) INTO upd FROM Bitacora WHERE modulo = 'Poliza' AND accion='update' AND fecha BETWEEN lastTime AND actual;
	SELECT COUNT(*) INTO del FROM Bitacora WHERE modulo = 'Poliza' AND accion='delete' AND fecha BETWEEN lastTime AND actual;
	INSERT INTO TareaProgramada (fecha, tabla, inserciones, modificaciones, eliminaciones) VALUES (NOW(), 'Poliza', ins, upd, del);
END;
$$  LANGUAGE plpgsql


---- INSERT BITACORA --
INSERT INTO Bitacora (usuario, fecha, accion, modulo) VALUES ( 'Administrador',NOW(), 'insert', 'Poliza');
INSERT INTO Bitacora (usuario, fecha, accion, modulo) VALUES ( 'Administrador',NOW(), 'update', 'Poliza');
INSERT INTO Bitacora (usuario, fecha, accion, modulo) VALUES ( 'Administrador',NOW(), 'delete', 'Tipo De Cambio');



