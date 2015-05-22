
---------------------------------------------------------------------------------------
-------------------------------------- INSERCIONES ------------------------------------
---------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION insertarPais(_usuario varchar(20), _nombre varchar(50))
RETURNS void AS $$
BEGIN
	INSERT INTO Pais (pais) VALUES (_nombre);
	INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Insert', 'Pais');
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insertartipodecambio( _usuario varchar, _fecha date, _cambio numeric, _moneda_id_moneda integer)
  RETURNS void AS
$$
BEGIN
	INSERT INTO BITACORA(usuario, fecha, accion, modulo) VALUES (_usuario,now(),'Insert','Tipo de cambio');
	INSERT INTO tipo_de_cambio VALUES(_fecha,_cambio,_moneda_id_moneda);
END;
$$  LANGUAGE plpgsql;
	
CREATE OR REPLACE FUNCTION insertarTipoCliente(_nombre varchar(50))
RETURNS void AS $$
BEGIN
	INSERT INTO Tipo_Cliente (tipo) VALUES (_nombre);
END;
$$  LANGUAGE plpgsql;
	
CREATE OR REPLACE FUNCTION insertarFotografia(_nombre varchar(50))
RETURNS void AS $$
BEGIN
	INSERT INTO Fotografia (nombre) VALUES (_nombre);
END;
$$  LANGUAGE plpgsql;
	
CREATE OR REPLACE FUNCTION insertarMoneda(_usuario varchar(50), _nombre varchar(50))
RETURNS void AS $$
BEGIN
	INSERT INTO BITACORA(usuario, fecha, accion, modulo) VALUES (_usuario,now(),'Insert','Moneda');
	INSERT INTO Moneda (moneda) VALUES (_nombre);
END;
$$  LANGUAGE plpgsql;
	
CREATE OR REPLACE FUNCTION insertarTipoEmpleado(_nombre varchar(50))
RETURNS void AS $$
BEGIN
	INSERT INTO Tipo_Empleado (tipo) VALUES (_nombre);
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insertarDepartamento(_nombre varchar(50))
RETURNS void AS $$
BEGIN
	INSERT INTO Departamento (nombre) VALUES (_nombre);
END;
$$  LANGUAGE plpgsql;
	
CREATE OR REPLACE FUNCTION insertarCondiciones(_nombre varchar(50))
RETURNS void AS $$
BEGIN
	INSERT INTO Condiciones (tipo) VALUES (_nombre);
END;
$$  LANGUAGE plpgsql;
	
CREATE OR REPLACE FUNCTION insertarEstadoPoliza(_nombre varchar(50))
RETURNS void AS $$
BEGIN
	INSERT INTO Estado_Poliza (estado) VALUES (_nombre);
END;
$$  LANGUAGE plpgsql;
	
CREATE OR REPLACE FUNCTION insertarCondicionesGenerales(_nombre varchar(50))
RETURNS void AS $$
BEGIN
	INSERT INTO Condiciones_Generales (condicion) VALUES (_nombre);
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insertarOficina(_id varchar(5),_nombre varchar(50), _departamento varchar(50))
RETURNS void AS $$
DECLARE idDepto INTEGER;
BEGIN
	SELECT getIdDepartamento(_departamento) INTO idDepto;
	INSERT INTO Oficina (id_oficina, nombre, Departamento_id_dep) VALUES (_id, _nombre, idDepto);
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insertarEmpleado(_nombre varchar(50), _telefono varchar(20), _tipo varchar(30), _oficina varchar(30), _depto varchar(30))
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
END;
$$  LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION insertarempleado( _usuario1 text,  _nombre text, _usuario text, _pass text, _telefono text, _id_te int, _id_oficina text, _id_dep int)
  RETURNS void AS
$$
BEGIN
	INSERT INTO BITACORA(usuario, fecha, accion, modulo) VALUES (_usuario1,now(),'Insert','Empleado');
	INSERT INTO EMPLEADO(nombre , usuario , pass , telefono , id_te , id_oficina , id_dep) VALUES( _nombre , _usuario , _pass , _telefono , _id_te , _id_oficina , _id_dep );
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insertartipoempleado( _usuario varchar, _nombre text)
  RETURNS void AS
$$
BEGIN
	INSERT INTO BITACORA(usuario, fecha, accion, modulo) VALUES (_usuario,now(),'Insert','Tipo empleado');
	INSERT INTO TIPO_EMPLEADO(tipo) VALUES( _nombre );
END;
$$  LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION insertardepartamento( _usuario varchar, _nombre text)
  RETURNS void AS
$$
BEGIN
	INSERT INTO BITACORA(usuario, fecha, accion, modulo) VALUES (_usuario,now(),'Insert','Departamento');
	INSERT INTO DEPARTAMENTO(nombre) VALUES( _nombre );
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insertaroficina( _usuario varchar, _id_oficina text, _nombre text, _id_dep int)
  RETURNS void AS
$$
BEGIN
	INSERT INTO BITACORA(usuario, fecha, accion, modulo) VALUES (_usuario,now(),'Insert','Oficina');
	INSERT INTO Oficina VALUES( _id_oficina, _nombre, _id_dep );
END;
$$  LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION insertartipodepago( _usuario varchar, _tipo text)
  RETURNS void AS
$$
BEGIN
	INSERT INTO BITACORA(usuario, fecha, accion, modulo) VALUES (_usuario,now(),'Insert','Tipo de pago');
	INSERT INTO Tipo_de_pago (tipo) VALUES( _tipo );
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insertarplandepagos( _usuario varchar, _prima int,  _numero_cuotas int, _recargo int , _id_moneda int, _numero_cuotas_atrasadas int, _id_ts varchar,
  _id_poliza integer, _porcentaje_deducible numeric, _deducible numeric, _tipo_cuota varchar,  _id_tp integer)
  RETURNS void AS
$$
BEGIN
	INSERT INTO BITACORA(usuario, fecha, accion, modulo) VALUES (_usuario,now(),'Insert','Plan de pago');
	INSERT INTO plan_de_pagos ( prima ,  numero_cuotas , recargo  , id_moneda , numero_cuotas_atrasadas , id_ts ,
  id_poliza , porcentaje_deducible , deducible , tipo_cuota, id_tp ) VALUES( _prima ,  _numero_cuotas , _recargo , _pago_cuota  , _id_moneda , _numero_cuotas_atrasadas , _id_ts ,
  _id_poliza , _porcentaje_deducible , _deducible , _tipo_cuota, _id_tp );
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insertarcobertura( _usuario varchar, _descripcion text, _monto numeric, _id_ts varchar, _id_poliza integer)
  RETURNS void AS
$$
BEGIN
	INSERT INTO BITACORA(usuario, fecha, accion, modulo) VALUES (_usuario,now(),'Insert','Cobertura');
	INSERT INTO cobertura (descripcion, monto, id_ts, id_poliza) VALUES( _descripcion, _monto, _id_ts, _id_poliza );
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insertarbien( _usuario varchar, _nombre text, _monto numeric, _id_ts varchar, _id_poliza integer)
  RETURNS void AS
$$
BEGIN
	INSERT INTO BITACORA(usuario, fecha, accion, modulo) VALUES (_usuario,now(),'Insert','Bien');
	INSERT INTO bien (nombre, monto, id_ts, id_poliza) VALUES( _nombre, _monto, _id_ts, _id_poliza );
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insertarInspeccion( _usuario varchar, _fecha date, _id_bien integer, _aprobado varchar,  _id_ts varchar, _id_poliza integer, _id_emp integer, _id_carga integer)
  RETURNS void AS
$$
BEGIN
	INSERT INTO BITACORA(usuario, fecha, accion, modulo) VALUES (_usuario,now(),'Insert','Inspeccion');
	INSERT INTO inspeccion (fecha, id_bien, aprobado, id_ts, id_poliza, id_emp, id_carga) VALUES( _fecha, _id_bien, _aprobado,  _id_ts, _id_poliza, _id_emp, _id_carga );
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

CREATE OR REPLACE FUNCTION seleccionarmoneda()
  RETURNS TABLE(id integer, moneda text) AS $$
BEGIN
	
	RETURN QUERY SELECT * FROM Moneda;
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION seleccionarbien()
  RETURNS TABLE(id integer, nombre text, monto numeric, id_ts varchar, id_poliza integer) AS $$
BEGIN
	
	RETURN QUERY SELECT * FROM bien;
END;
$$  LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION seleccionarinspeccion(_id_ts varchar, _id_poliza integer)
  RETURNS TABLE(id integer, fecha date, id_bien integer, aprobado varchar,  id_ts varchar, id_poliza integer, id_emp integer, id_carga integer) AS $$
BEGIN
	
	RETURN QUERY SELECT * FROM inspeccion where inspeccion.id_ts = _id_ts and inspeccion.id_poliza = _id_poliza;
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION seleccionarinspeccion()
  RETURNS TABLE(id integer, fecha date, id_bien integer, aprobado varchar,  id_ts varchar, id_poliza integer, id_emp integer, id_carga integer) AS $$
BEGIN
	
	RETURN QUERY SELECT * FROM inspeccion;
END;
$$  LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION seleccionarbienreducido(_id_ts varchar, _id_poliza integer)
  RETURNS TABLE(nombre text, monto numeric) AS $$
BEGIN
	RETURN QUERY SELECT bien.nombre, bien.monto FROM bien WHERE bien.id_ts = _id_ts AND bien.id_poliza = _id_poliza;
	
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION seleccionarbien(_id_ts varchar, _id_poliza integer)
  RETURNS TABLE(id integer, nombre text, monto numeric, id_ts varchar, id_poliza integer) AS $$
BEGIN
	
	RETURN QUERY SELECT * FROM bien WHERE bien.id_ts = _id_ts AND bien.id_poliza = _id_poliza;
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION seleccionarcobertura()
  RETURNS TABLE(id integer, descripcion text, monto numeric, id_ts varchar, id_poliza integer) AS $$
BEGIN
	
	RETURN QUERY SELECT * FROM cobertura;
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION seleccionarcoberturareducido(_id_ts varchar, _id_poliza integer)
  RETURNS TABLE(descripcion text, monto numeric) AS $$
BEGIN
	
	RETURN QUERY SELECT cobertura.descripcion, cobertura.monto FROM cobertura WHERE id_ts = _id_ts AND id_poliza = _id_poliza;
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION seleccionarcobertura(_id_ts varchar, _id_poliza integer)
  RETURNS TABLE(id integer, descripcion text, monto numeric, id_ts_ varchar, id_poliza_ integer) AS $$
BEGIN
	
	RETURN QUERY SELECT * FROM cobertura WHERE id_ts = _id_ts AND id_poliza = _id_poliza;
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION seleccionartipodecambio()
  RETURNS TABLE(fecha date, cambio numeric, moneda_id_moneda int) AS $$
BEGIN
	
	RETURN QUERY SELECT * FROM tipo_de_cambio;
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION seleccionarempleado()
  RETURNS TABLE(id_emp int, nombre text, usuario varchar, pass varchar, telefono text, id_te int, id_oficina varchar, id_dep int) AS $$
BEGIN
	
	RETURN QUERY SELECT empleado.id_emp , empleado.nombre , empleado.usuario , empleado.pass , empleado.telefono , empleado.id_te , empleado.id_oficina , empleado.id_dep  FROM empleado;
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION seleccionartipoempleado()
  RETURNS TABLE(id_tipo int, tipo text) AS $$
BEGIN
	
	RETURN QUERY SELECT * FROM tipo_empleado;
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION seleccionardepartamento()
  RETURNS TABLE(id_dep int, nombre varchar) AS $$
BEGIN
	
	RETURN QUERY SELECT * FROM departamento;
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION seleccionaroficina()
  RETURNS TABLE(id_oficina varchar, nombre varchar, id_dep int) AS $$
BEGIN
	
	RETURN QUERY SELECT * FROM Oficina;
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION seleccionartipodepago()
  RETURNS TABLE(id_tipo_pago int, tipo varchar) AS $$
BEGIN
	
	RETURN QUERY SELECT * FROM tipo_de_pago;
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION seleccionarplandepagos()
  RETURNS TABLE(id_plan int,  prima bigint,  numero_cuotas int, recargo bigint , id_moneda int, numero_cuotas_atrasadas int, id_ts varchar,
  id_poliza integer, porcentaje_deducible numeric, deducible numeric, tipo_cuota varchar, id_tp integer) AS $$
BEGIN
	
	RETURN QUERY SELECT * FROM plan_de_pagos;
END;
$$  LANGUAGE plpgsql;


------------------------------------------------------------------------------------------
-------------------------------------- MODIFICACIONES ------------------------------------
------------------------------------------------------------------------------------------





------------------------------------------------------------------------------------------
-------------------------------------- MODIFICACIONES ------------------------------------
------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION actualizarmoneda( _usuario varchar(50), _id integer, _moneda character varying)
  RETURNS void AS
$$
BEGIN
	INSERT INTO BITACORA(usuario, fecha, accion, modulo) VALUES (_usuario,now(),'Update','Moneda');
	UPDATE Moneda SET moneda = _moneda WHERE id_moneda = _id;
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION actualizarcobertura( _usuario varchar, _id_cobertura integer, _descripcion text, _monto numeric, _id_ts varchar, _id_poliza integer)
  RETURNS void AS
$$
BEGIN
	INSERT INTO BITACORA(usuario, fecha, accion, modulo) VALUES (_usuario,now(),'Update','Cobertura');
	UPDATE cobertura SET monto = _monto, descripcion = _descripcion, id_ts = _id_ts, id_poliza = _id_poliza WHERE id_cobertura = _id_cobertura;
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION actualizarbien( _usuario varchar, _id_bien integer, _nombre text, _monto numeric, _id_ts varchar, _id_poliza integer)
  RETURNS void AS
$$
BEGIN
	INSERT INTO BITACORA(usuario, fecha, accion, modulo) VALUES (_usuario,now(),'Update','Bien');
	UPDATE bien SET monto = _monto, nombre = _nombre, id_ts = _id_ts, id_poliza = _id_poliza WHERE id_bien = _id_bien;
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION actualizartipodecambio( _usuario varchar, _fecha date, _cambio numeric, _moneda_id_moneda integer)
  RETURNS void AS
$$
BEGIN
	INSERT INTO BITACORA(usuario, fecha, accion, modulo) VALUES (_usuario,now(),'Update','Tipo de cambio');
	UPDATE tipo_de_cambio SET cambio = _cambio WHERE fecha = _fecha and id_moneda = _moneda_id_moneda;
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION actualizarempleado( _usuario1 varchar, _id_emp int, _nombre text, _usuario varchar, _pass varchar, _telefono text, _id_te int, _id_oficina varchar, _id_dep int)
  RETURNS void AS
$$
BEGIN
	INSERT INTO BITACORA(usuario, fecha, accion, modulo) VALUES (_usuario1,now(),'Update','Empleado');
	UPDATE EMPLEADO SET nombre = _nombre, usuario = _usuario, pass = _pass, telefono = _telefono, id_te = _id_te , id_oficina = _id_oficina, id_dep = _id_dep WHERE empleado.id_emp = _id_emp; 
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION actualizartipoempleado( _usuario varchar, _id_te int, _nombre text)
  RETURNS void AS
$$
BEGIN
	INSERT INTO BITACORA(usuario, fecha, accion, modulo) VALUES (_usuario,now(),'Update','Tipo empleado');
	UPDATE TIPO_EMPLEADO SET tipo = _nombre WHERE id_te = _id_te; 
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION actualizardepartamento( _usuario varchar, _id_dep int, _nombre text)
  RETURNS void AS
$$
BEGIN
	INSERT INTO BITACORA(usuario, fecha, accion, modulo) VALUES (_usuario,now(),'Update','Departamento');
	UPDATE Departamento SET nombre = _nombre WHERE id_dep = _id_dep; 
END;
$$  LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION actualizartipodepago( _usuario varchar, _id_tp int, _tipo text)
  RETURNS void AS
$$
BEGIN
	INSERT INTO BITACORA(usuario, fecha, accion, modulo) VALUES (_usuario,now(),'Update','Tipo de pago');
	UPDATE tipo_de_pago SET tipo = _tipo WHERE id_tp = _id_tp; 
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION actualizarplandepagos( _usuario varchar, _id_plan int, _prima int,  _numero_cuotas int, _recargo int, _id_moneda int, _numero_cuotas_atrasadas int, _id_ts varchar,
  _id_poliza integer, _porcentaje_deducible numeric, _deducible numeric, _tipo_cuota varchar , _id_tp integer)
  RETURNS void AS
$$
BEGIN
	INSERT INTO BITACORA(usuario, fecha, accion, modulo) VALUES (_usuario,now(),'Update','Plan de pago');
	UPDATE plan_de_pagos SET prima = _prima,  numero_cuotas = _numero_cuotas, recargo = _recargo,  id_moneda = _id_moneda, 
	numero_cuotas_atrasadas = _numero_cuotas_atrasadas , id_ts = _id_ts ,  id_poliza = _id_poliza, porcentaje_deducible = _porcentaje_deducible, deducible = _deducible, tipo_cuota  = _tipo_cuota, id_tp = _id_tp 
	WHERE id_plan = _id_plan; 
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION actualizarinspeccion(_id_inspeccion integer, _fecha date, _id_bien integer, _aprobado varchar,  _id_ts varchar, _id_poliza integer, _id_emp integer, _id_carga integer)
  RETURNS void AS
$$
BEGIN
	INSERT INTO BITACORA(usuario, fecha, accion, modulo) VALUES (_usuario,now(),'Update','Inspeccion');
	UPDATE inspeccion SET fecha = _fecha, id_bien = _id_bien, aprobado = _aprobado, id_ts = _id_ts, id_poliza = _id_poliza, id_emp = _id_emp, id_carga = _id_carga WHERE id_inspeccion = _id_inspeccion; 
END;
$$  LANGUAGE plpgsql;

------------------------------------------------------------------------------------------
-------------------------------------- ELIMINACIONES -------------------------------------
------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION insertarPais(_nombre varchar(50))
RETURNS void AS $$
BEGIN
	INSERT INTO Pais (pais) VALUES (_nombre);
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION getValorCambio2(_id_moneda int, _prima bigint)
RETURNS numeric AS 
$$
DECLARE 
valor numeric;
ultimoCambio numeric;
BEGIN
	SELECT cambio INTO ultimoCambio FROM tipo_de_cambio where id_moneda = _id_moneda ORDER BY fecha DESC LIMIT 1;

	valor := _prima * ultimoCambio;
	
	RETURN valor;
END;
$$  LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION getValorCambio2(_id_moneda int, _prima numeric)
RETURNS numeric AS 
$$
DECLARE 
valor numeric;
ultimoCambio numeric;
BEGIN
	SELECT cambio INTO ultimoCambio FROM tipo_de_cambio where id_moneda = _id_moneda ORDER BY fecha DESC LIMIT 1;

	valor := _prima * ultimoCambio;
	
	RETURN valor;
END;
$$  LANGUAGE plpgsql;


create or replace function cargar_byte(p_path text, p_result out bytea) 
                   language plpgsql as $$
declare
  l_oid oid;
  r record;
begin
  p_result := '';
  select lo_import(p_path) into l_oid;
  for r in ( select data 
             from pg_largeobject 
             where loid = l_oid 
             order by pageno ) loop
    p_result = p_result || r.data;
  end loop;
  perform lo_unlink(l_oid);
end;$$;

------------------------------------------------------------------------------------------
-------------------------------------- ELIMINACIONES ------------------------------------
------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION eliminarmoneda(_usuario varchar(50), _id integer)
  RETURNS void AS
$$
BEGIN
	INSERT INTO BITACORA(usuario, fecha, accion, modulo) VALUES (_usuario,now(),'Delete','Moneda');
	DELETE FROM Moneda WHERE id_moneda = _id;
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION eliminarcobertura(_usuario varchar, _id_cobertura integer)
  RETURNS void AS
$$
BEGIN
	INSERT INTO BITACORA(usuario, fecha, accion, modulo) VALUES (_usuario,now(),'Delete','Cobertura');
	DELETE FROM cobertura WHERE id_cobertura = _id_cobertura;
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION eliminarbien(_usuario varchar, _id_bien integer)
  RETURNS void AS
$$
BEGIN
	INSERT INTO BITACORA(usuario, fecha, accion, modulo) VALUES (_usuario,now(),'Delete','Bien');
	DELETE FROM bien WHERE id_bien = _id_bien;
END;
$$  LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION eliminartipodecambio(_usuario varchar,  _fecha date, _cambio numeric, _moneda_id_moneda integer)
  RETURNS void AS
$$
BEGIN
	INSERT INTO BITACORA(usuario, fecha, accion, modulo) VALUES (_usuario,now(),'Delete','Tipo de cambio');
	DELETE FROM tipo_de_cambio WHERE fecha = _fecha and id_moneda = _moneda_id_moneda;
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION eliminarempleado(_usuario varchar,  _id_empleado integer)
  RETURNS void AS
$$
BEGIN
	INSERT INTO BITACORA(usuario, fecha, accion, modulo) VALUES (_usuario,now(),'Delete','Empleado');
	DELETE FROM EMPLEADO WHERE empleado.id_emp = _id_empleado;
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION eliminartipoempleado(_usuario varchar,  _id_te integer)
  RETURNS void AS
$$
BEGIN
	INSERT INTO BITACORA(usuario, fecha, accion, modulo) VALUES (_usuario,now(),'Delete','Tipo empleado');
	DELETE FROM TIPO_EMPLEADO WHERE id_te = _id_te;
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION eliminardepartamento(_usuario varchar,  _id_dep integer)
  RETURNS void AS
$$
BEGIN
	INSERT INTO BITACORA(usuario, fecha, accion, modulo) VALUES (_usuario,now(),'Delete','Departamento');
	DELETE FROM Departamento WHERE id_dep = _id_dep;
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION eliminaroficina(_usuario varchar,  _id_oficina varchar)
  RETURNS void AS
$$
BEGIN
	INSERT INTO BITACORA(usuario, fecha, accion, modulo) VALUES (_usuario,now(),'Delete','Oficina');
	DELETE FROM Oficina WHERE id_oficina = _id_oficina;
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION eliminartipodepago(_usuario varchar, _id_tp int)
  RETURNS void AS
$$
BEGIN
	INSERT INTO BITACORA(usuario, fecha, accion, modulo) VALUES (_usuario,now(),'Delete','Tipo de pago');
	DELETE FROM tipo_de_pago WHERE id_tp = _id_tp;
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION eliminarplandepagos(_usuario varchar, _id_plan int)
  RETURNS void AS
$$
BEGIN
	INSERT INTO BITACORA(usuario, fecha, accion, modulo) VALUES (_usuario,now(),'Delete','Plan de pago');
	DELETE FROM plan_de_pagos WHERE id_plan = _id_plan;
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION eliminarinspeccion(_usuario varchar, _id_inspeccion int)
  RETURNS void AS
$$
BEGIN
	INSERT INTO BITACORA(usuario, fecha, accion, modulo) VALUES (_usuario,now(),'Delete','Inspeccion');
	DELETE FROM inspeccion WHERE id_inspeccion = _id_inspeccion;
END;
$$  LANGUAGE plpgsql;