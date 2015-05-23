
------------******************************SELECTS *********************************************
CREATE OR REPLACE FUNCTION consultar_tipo_de_seguro()
RETURNS setof tipo_de_seguro AS 
$$
DECLARE
	ts tipo_de_seguro%ROWTYPE;
BEGIN
 for ts in select * from tipo_de_seguro loop
    return next ts;
end loop;
END;
$$ language plpgsql;

--select * from consultar_tipo_de_seguro()

CREATE OR REPLACE FUNCTION consultar_tipo_cliente()
RETURNS setof tipo_cliente AS 
$$
DECLARE
	ts tipo_cliente%ROWTYPE;
BEGIN
 for ts in select * from tipo_cliente loop
    return next ts;
end loop;
END;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION consultar_pais()
RETURNS setof pais AS 
$$
DECLARE
	ts pais%ROWTYPE;
BEGIN
 for ts in select * from pais loop
    return next ts;
end loop;
END;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION consultar_condiciones_particulares()
RETURNS setof condiciones_particulares AS 
$$
DECLARE
	ts condiciones_particulares%ROWTYPE;
BEGIN
 for ts in select * from condiciones_particulares loop
    return next ts;
end loop;
END;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION consultar_estado_poliza()
RETURNS setof estado_poliza AS 
$$
DECLARE
	ts estado_poliza%ROWTYPE;
BEGIN
 for ts in select * from estado_poliza loop
    return next ts;
end loop;
END;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION consultar_poliza()
RETURNS setof poliza AS 
$$
DECLARE
	ts poliza%ROWTYPE;
BEGIN
 for ts in select * from poliza loop
    return next ts;
end loop;
END;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION consultar_cliente()
  RETURNS TABLE(id_cliente int,  nombre varchar,  domicilio varchar, id1 int, id_pais int , id_tc int, tipo varchar, id_pais2 int,
  pais text) AS $$
BEGIN
	
	RETURN QUERY select * from 
(cliente join tipo_cliente on cliente.id1 = tipo_cliente.id) c join pais on c.id_pais = pais.id_pais order by c.nombre;
END;
$$  LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION consultar_poliza()
RETURNS setof poliza AS 
$$
DECLARE
	ts poliza%ROWTYPE;
BEGIN
 for ts in select * from poliza order by id_ts loop
    return next ts;
end loop;
END;
$$ language plpgsql;


-- *****************************************INSERTS ***********************************************************
-- select insertarTipoSeguro('ID','TIPO')

CREATE OR REPLACE FUNCTION insertar_tipo_cliente(p_tipo varchar(25),_usuario varchar(20))
RETURNS void AS 
$$
BEGIN
 Insert into tipo_cliente(tipo) values(p_tipo);
 INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Insert', 'tipo_cliente');
END;
$$ language plpgsql;

-- insert en tipo de seguro

CREATE OR REPLACE FUNCTION insertar_tipo_de_seguro(p_idts varchar(5),p_tipo text,_usuario varchar(20))
RETURNS void AS 
$$
BEGIN
 Insert into tipo_de_seguro values(p_idts,p_tipo);
 INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Insert', 'tipo_de_seguro');
END;
$$ language plpgsql;
-- select insertarTipoSeguro('ID','TIPO')

CREATE OR REPLACE FUNCTION insertar_pais(p_pais text,_usuario varchar(20))
RETURNS void AS 
$$
BEGIN
 Insert into pais(pais) values(p_pais);
 INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Insert', 'pais');
END;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION insertar_condiciones_particulares(p_condicion text,_usuario varchar(20))
RETURNS void AS 
$$
BEGIN
 Insert into condiciones_particulares(condicion) values(p_condicion);
 INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Insert', 'condiciones_particulares');
END;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION insertar_estado_poliza(p_estado varchar(25),_usuario varchar(20))
RETURNS void AS 
$$
BEGIN
 Insert into estado_poliza(estado) values(p_estado);
 INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Insert', 'estado_poliza');
END;
$$ language plpgsql;

------------******************************updates *********************************************
-- UPDATE TIPO DE SEGURO
CREATE OR REPLACE FUNCTION update_tipo_de_seguro(p_idts text, p_tipo text,_usuario varchar(20))
RETURNS void AS 
$$
BEGIN
	update tipo_de_seguro set tipo = p_tipo where id_ts = p_idts;
	INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Update', 'tipo_de_seguro');
END;
$$ language plpgsql;

--select updateTipoSeguro('ID','TIPO')

CREATE OR REPLACE FUNCTION update_tipo_cliente(p_idts int, p_tipo varchar(25),_usuario varchar(20))
RETURNS void AS 
$$
BEGIN
	update tipo_cliente set tipo = p_tipo where id = p_idts;
	INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Update', 'tipo_cliente');
END;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION update_pais(p_idts int, p_tipo text,_usuario varchar(20))
RETURNS void AS 
$$
BEGIN
	update pais set pais = p_tipo where id_pais = p_idts;
	INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Update', 'pais');
END;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION update_condiciones_particulares(p_idts int, p_tipo text, _usuario varchar(20))
RETURNS void AS 
$$
BEGIN
	update condiciones_particulares set condicion = p_tipo where id_cp = p_idts;
	INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Update', 'condiciones_particulares');
END;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION update_estado_poliza(p_idts int, p_tipo varchar(25), _usuario varchar(20))
RETURNS void AS 
$$
BEGIN
	update estado_poliza set estado = p_tipo where id_estado = p_idts;
	INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Update', 'estado_poliza');
END;
$$ language plpgsql;

---********************************DELETES
CREATE OR REPLACE FUNCTION delete_tipo_de_seguro(p_idts varchar(5),_usuario varchar(20))
RETURNS void AS 
$$
BEGIN
	delete from tipo_de_seguro where id_ts = p_idts;
	INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Delete', 'tipo_de_seguro');
END;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION delete_tipo_cliente(p_idts int,_usuario varchar(20))
RETURNS void AS 
$$
BEGIN
	delete from tipo_cliente where id = p_idts;
	INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Delete', 'tipo_cliente');
END;
$$ language plpgsql;


CREATE OR REPLACE FUNCTION delete_pais(p_idts int,_usuario varchar(20))
RETURNS void AS 
$$
BEGIN
	delete from pais where id_pais = p_idts;
	INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Delete', 'pais');
END;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION delete_condiciones_particulares(p_idts int,_usuario varchar(20))
RETURNS void AS 
$$
BEGIN
	delete from condiciones_particulares where id_cp = p_idts;
	INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Delete', 'condiciones_particulares');
END;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION delete_estado_poliza(p_idts int,_usuario varchar(20))
RETURNS void AS 
$$
BEGIN
	delete from estado_poliza where id_estado = p_idts;
	INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Delete', 'estado_poliza');
END;
$$ language plpgsql;

-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
-------------------------------------- MISCELANEOS ------------------------------------
---------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION insertarCliente(_nombre varchar(50), _domicilio varchar(75), _idTipo integer, _idPais integer, _usuario varchar(20))
RETURNS void AS $$
BEGIN
	INSERT INTO Cliente (nombre, domicilio, id1, id_pais) VALUES (_nombre, _domicilio, _idTipo, _idPais);
	INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Insert', 'Cliente');
END;
$$  LANGUAGE plpgsql;



CREATE OR REPLACE FUNCTION eliminarCliente(_id integer, _usuario varchar(20))
RETURNS void AS $$
BEGIN
	DELETE FROM Cliente WHERE id_cliente = _id;
	INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Delete', 'Cliente');
END;
$$  LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION modificarCliente(_idCliente integer, _nombre varchar(50), _domicilio varchar(75), _idTipo integer, _idPais integer, _usuario varchar(20))
RETURNS void AS $$
BEGIN
	UPDATE Cliente SET nombre = _nombre WHERE id_cliente = _idCliente;
	UPDATE Cliente SET domicilio = _domicilio WHERE id_cliente = _idCliente;
	UPDATE Cliente SET id1 = _idTipo WHERE id_cliente = _idCliente;
	UPDATE Cliente SET id_pais = _idPais WHERE id_cliente = _idCliente;
	INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Update', 'Cliente');
END;
$$  LANGUAGE plpgsql;




-------------------------------******************************************************


CREATE OR REPLACE FUNCTION insertarPoliza(_usuario varchar(20),_idestado int, _idcp int, _fechaIni date, _fechaFin date, _clausulas text, _idcliente int, _idtipoSeguro varchar(5), _polizaVieja varchar, _meses int,_productoDescripcion text, _status varchar(15), _precio float, _valorseguro float,_idvendedor int, _idoperador int, _idnegociador int , _codventa text, _cobadicional text,_cargav int,_cargao int, _cargan int)
RETURNS void AS $$
BEGIN
	INSERT INTO Poliza(id_est, id_condp, fecha_inicio, fecha_fin, clausulas, id_cli, id_ts, poliza_vieja, meses, producto_descripcion, status,
						precio,valor_seguro,id_vendedor, id_operador, id_negociador, cod_venta, coberturas_adicionales, id_cargaV, id_cargaO, id_cargaN) 
			VALUES   (_idestado, _idcp, _fechaIni, _fechaFin, _clausulas, _idcliente, _idtipoSeguro, _polizaVieja, _meses, _productoDescripcion, _status,
						_precio,_valorseguro, _idvendedor,_idoperador,_idnegociador,_codventa,_cobadicional,_cargav,_cargao,_cargan);
	INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Insert', 'Poliza');
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION regresaIDPoliza(_idestado int, _idcp int, _fechaIni date, _fechaFin date, _clausulas text, _idcliente int, _idtipoSeguro varchar(5), _polizaVieja varchar, _meses int,_productoDescripcion text, _status varchar(15), _precio float, _valorseguro float,_idvendedor int, _idoperador int, _idnegociador int , _codventa text, _cobadicional text,_cargav int,_cargao int, _cargan int)
RETURNS INTEGER AS $$
DECLARE idpoliza INTEGER;
BEGIN
	SELECT id_poliza into idpoliza from Poliza where id_est = _idestado and id_condp=_idcp and fecha_inicio=_fechaIni and fecha_fin =_fechaFin and clausulas = _clausulas and
						id_cli = _idcliente and id_ts =_idtipoSeguro and poliza_vieja = _polizaVieja and meses =_meses and producto_descripcion=_productoDescripcion and status =_status and
						precio = _precio and valor_seguro = _valorseguro and id_vendedor=_idvendedor and id_operador=_idoperador and id_negociador=_idnegociador and cod_venta=_codventa and
						coberturas_adicionales=_cobadicional and id_cargaV=_cargav and id_cargaO=_cargao and id_cargaN =_cargan;
	RETURN idpoliza;
END;
$$ LANGUAGE plpgsql;




CREATE OR REPLACE FUNCTION insertarBeneficiario(_nombre text, _telefono text, _id_ts varchar, _id_poliza int, _usuario varchar(20))
RETURNS void AS $$
BEGIN
	INSERT INTO Beneficiario (nombre, telefono,id_ts,id_poliza) VALUES (_nombre, _telefono,_id_ts,_id_poliza);
	INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Insert', 'Beneficiario');
END;
$$  LANGUAGE plpgsql; 

CREATE OR REPLACE FUNCTION verifica_usuario(usr varchar, pass varchar)
RETURNS integer SECURITY DEFINER AS
$$
SELECT CASE WHEN pass = $2 THEN 1 ELSE 0 END
FROM empleado WHERE usuario=$1;
$$ LANGUAGE SQL;

CREATE OR REPLACE FUNCTION getValorCambio3(_id_moneda int, _valor float)
RETURNS float AS 
$$
DECLARE 
valor float;
ultimoCambio numeric;
BEGIN
	SELECT cambio INTO ultimoCambio FROM tipo_de_cambio where id_moneda = _id_moneda ORDER BY fecha DESC LIMIT 1;

	valor := _valor * ultimoCambio;
	
	RETURN valor;
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION getPoliza(_id_poliza int, _id_ts varchar)
RETURNS setof poliza AS 
$$
BEGIN
	return query select * from poliza where id_poliza = $1 and id_ts = $2;
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION modificarPoliza(_usuario varchar,_id_poliza int,_idestado int, _idcp int, _fechaIni date, _fechaFin date, _clausulas text, _idcliente int, _idtipoSeguro varchar(5), _polizaVieja varchar,_productoDescripcion text, _status varchar(15), _precio float, _valorseguro float,_idvendedor int, _idoperador int, _idnegociador int , _codventa text, _cobadicional text,_cargav int,_cargao int, _cargan int)
RETURNS void AS $$
BEGIN
	UPDATE Poliza SET id_est = _idestado , id_condp=_idcp , fecha_inicio=_fechaIni , fecha_fin =_fechaFin , clausulas = _clausulas ,
	id_cli = _idcliente  , poliza_vieja = _polizaVieja , producto_descripcion=_productoDescripcion , status =_status ,
	precio = _precio , valor_seguro = _valorseguro , id_vendedor=_idvendedor , id_operador=_idoperador , id_negociador=_idnegociador , cod_venta=_codventa ,
	coberturas_adicionales=_cobadicional , id_cargaV=_cargav , id_cargaO=_cargao , id_cargaN =_cargan 
	where id_poliza = _id_poliza and id_ts=_idtipoSeguro;
	INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Update', 'Poliza');
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION conversor3(mondestino int, monorigen int, valor float)
  RETURNS float AS $$
DECLARE ret float;
val1 float;
val2 float;
BEGIN
	select * into val1 from getValorCambio3(monorigen,1);
	select  * into val2 from getValorCambio3(mondestino,1);
	ret := (valor * val1) / val2;
	return ret;
END;
$$  LANGUAGE plpgsql;

--CREATE OR REPLACE FUNCTION conversor2(mondestino int, monorigen int, valor numeric)
--  RETURNS numeric AS $$
--DECLARE ret numeric;
v--al1 numeric;
v--al2 numeric;
--BEGIN
--	select * into val1 from getValorCambio2(monorigen,1);
--	select  * into val2 from getValorCambio2(mondestino,1);
--	ret := (valor * val1) / val2;
--	return ret;
--END;
--$$  LANGUAGE plpgsql;


