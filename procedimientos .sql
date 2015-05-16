
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
  RETURNS TABLE(id int,  nombre varchar,  domicilio varchar, id1 int, id_pais int , id_tc int, tipo varchar, id_pais2 int,
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
 INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Insertar', 'tipo_cliente');
END;
$$ language plpgsql;

-- insert en tipo de seguro

CREATE OR REPLACE FUNCTION insertar_tipo_de_seguro(p_idts varchar(5),p_tipo text,_usuario varchar(20))
RETURNS void AS 
$$
BEGIN
 Insert into tipo_de_seguro values(p_idts,p_tipo);
 INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Insertar', 'tipo_de_seguro');
END;
$$ language plpgsql;
-- select insertarTipoSeguro('ID','TIPO')

CREATE OR REPLACE FUNCTION insertar_pais(p_pais text,_usuario varchar(20))
RETURNS void AS 
$$
BEGIN
 Insert into pais(pais) values(p_pais);
 INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Insertar', 'pais');
END;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION insertar_condiciones_particulares(p_condicion text,_usuario varchar(20))
RETURNS void AS 
$$
BEGIN
 Insert into condiciones_particulares(condicion) values(p_condicion);
 INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Insertar', 'condiciones_particulares');
END;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION insertar_estado_poliza(p_estado varchar(25),_usuario varchar(20))
RETURNS void AS 
$$
BEGIN
 Insert into estado_poliza(estado) values(p_estado);
 INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Insertar', 'estado_poliza');
END;
$$ language plpgsql;

------------******************************updates *********************************************
-- UPDATE TIPO DE SEGURO
CREATE OR REPLACE FUNCTION update_tipo_de_seguro(p_idts text, p_tipo text,_usuario varchar(20))
RETURNS void AS 
$$
BEGIN
	update tipo_de_seguro set tipo = p_tipo where id_ts = p_idts;
	INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Actualizar', 'tipo_de_seguro');
END;
$$ language plpgsql;

--select updateTipoSeguro('ID','TIPO')

CREATE OR REPLACE FUNCTION update_tipo_cliente(p_idts int, p_tipo varchar(25),_usuario varchar(20))
RETURNS void AS 
$$
BEGIN
	update tipo_cliente set tipo = p_tipo where id = p_idts;
	INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Actualizar', 'tipo_cliente');
END;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION update_pais(p_idts int, p_tipo text,_usuario varchar(20))
RETURNS void AS 
$$
BEGIN
	update pais set pais = p_tipo where id_pais = p_idts;
	INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Actualizar', 'pais');
END;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION update_condiciones_particulares(p_idts int, p_tipo text, _usuario varchar(20))
RETURNS void AS 
$$
BEGIN
	update condiciones_particulares set condicion = p_tipo where id_cp = p_idts;
	INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Actualizar', 'condiciones_particulares');
END;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION update_estado_poliza(p_idts int, p_tipo varchar(25), _usuario varchar(20))
RETURNS void AS 
$$
BEGIN
	update estado_poliza set estado = p_tipo where id_estado = p_idts;
	INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Actualizar', 'estado_poliza');
END;
$$ language plpgsql;

---********************************DELETES
CREATE OR REPLACE FUNCTION delete_tipo_de_seguro(p_idts varchar(5),_usuario varchar(20))
RETURNS void AS 
$$
BEGIN
	delete from tipo_de_seguro where id_ts = p_idts;
	INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Eliminar', 'tipo_de_seguro');
END;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION delete_tipo_cliente(p_idts int,_usuario varchar(20))
RETURNS void AS 
$$
BEGIN
	delete from tipo_cliente where id = p_idts;
	INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Eliminar', 'tipo_cliente');
END;
$$ language plpgsql;


CREATE OR REPLACE FUNCTION delete_pais(p_idts int,_usuario varchar(20))
RETURNS void AS 
$$
BEGIN
	delete from pais where id_pais = p_idts;
	INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Eliminar', 'pais');
END;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION delete_condiciones_particulares(p_idts int,_usuario varchar(20))
RETURNS void AS 
$$
BEGIN
	delete from condiciones_particulares where id_cp = p_idts;
	INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Eliminar', 'condiciones_particulares');
END;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION delete_estado_poliza(p_idts int,_usuario varchar(20))
RETURNS void AS 
$$
BEGIN
	delete from estado_poliza where id_estado = p_idts;
	INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Eliminar', 'estado_poliza');
END;
$$ language plpgsql;

----------------------------------------------------------------------

CREATE OR REPLACE FUNCTION insertarCliente(_nombre varchar(50), _domicilio varchar(75), _idTipo integer, _idPais integer, _usuario varchar(20))
RETURNS void AS $$
BEGIN
	INSERT INTO Cliente (nombre, domicilio, id1, id_pais) VALUES (_nombre, _domicilio, _idTipo, _idPais);
	INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Insertar', 'Cliente');
END;
$$  LANGUAGE plpgsql;



CREATE OR REPLACE FUNCTION eliminarCliente(_id integer, _usuario varchar(20))
RETURNS void AS $$
BEGIN
	DELETE FROM Cliente WHERE id = _id;
	INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Eliminar', 'Cliente');
END;
$$  LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION modificarCliente(_idCliente integer, _nombre varchar(50), _domicilio varchar(75), _idTipo integer, _idPais integer, _usuario varchar(20))
RETURNS void AS $$
BEGIN
	UPDATE Cliente SET nombre = _nombre WHERE id = _idCliente;
	UPDATE Cliente SET domicilio = _domicilio WHERE id = _idCliente;
	UPDATE Cliente SET id1 = _idTipo WHERE id = _idCliente;
	UPDATE Cliente SET id_pais = _idPais WHERE id = _idCliente;
	INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Modificar', 'Cliente');
END;
$$  LANGUAGE plpgsql;




-------------------------------******************************************************


CREATE OR REPLACE FUNCTION insertarPoliza(_usuario varchar(20),_idestado int, _idcp int, _fechaIni date, _fechaFin date, _clausulas text, _idcliente int, _idtipoSeguro varchar(5), _polizaVieja varchar, _meses int,_productoDescripcion text, _status varchar(15),_idvendedor int, _idoperador int, _idnegociador int , _codventa text, _cobadicional text,_cargav int,_cargao int, _cargan int)
RETURNS void AS $$
BEGIN
	INSERT INTO Poliza(id_estado, id_cp, fecha_inicio, fecha_fin, clausulas, id, id_ts, poliza_vieja, meses, producto_descripcion, status,
						id_vendedor, id_operador, id_negociador, cod_venta, coberturas_adicionales, id_cargaV, id_cargaO, id_cargaN) 
			VALUES   (_idestado, _idcp, _fechaIni, _fechaFin, _clausulas, _idcliente, _idtipoSeguro, _polizaVieja, _meses, _productoDescripcion, _status, _idvendedor,_idoperador,_idnegociador,_codventa,_cobadicional,_cargav,_cargao,_cargan);
	INSERT INTO Bitacora(usuario, fecha, accion, modulo) VALUES (_usuario, current_timestamp, 'Insertar', 'Poliza');
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION regresaIDPoliza(_idestado int, _idcp int, _fechaIni date, _fechaFin date, _clausulas text, _idcliente int, _idtipoSeguro varchar(5), _polizaVieja varchar, _meses int,_productoDescripcion text, _status varchar(15),_idvendedor int, _idoperador int, _idnegociador int , _codventa text, _cobadicional text,_cargav int,_cargao int, _cargan int)
RETURNS INTEGER AS $$
DECLARE idpoliza INTEGER;
BEGIN
	SELECT id_poliza into idpoliza from Poliza where id_estado = _idestado and id_cp=_idcp and fecha_inicio=_fechaIni and fecha_fin =_fechaFin and clausulas = _clausulas and
						id = _idcliente and id_ts =_idtipoSeguro and poliza_vieja = _polizaVieja and meses =_meses and producto_descripcion=_productoDescripcion and status =_status and
						id_vendedor=_idvendedor and id_operador=_idoperador and id_negociador=_idnegociador and cod_venta=_codventa and
						coberturas_adicionales=_cobadicional and id_cargaV=_cargav and id_cargaO=_cargao and id_cargaN =_cargan;
	RETURN idpoliza;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION getValorCambio(_id_moneda int, _prima bigint,_fecha date)
RETURNS numeric AS 
$$
DECLARE 
valor numeric;
cambiodolar numeric;
cambioeuro numeric;
cambiopeso numeric;
BEGIN
	SELECT cambio INTO cambiodolar FROM tipo_de_cambio where id_moneda = 1 and fecha = _fecha;
	SELECT cambio INTO cambioeuro FROM tipo_de_cambio where id_moneda = 2 and fecha = _fecha;
	SELECT cambio INTO cambiopeso FROM tipo_de_cambio where id_moneda = 3 and fecha = _fecha;

	IF _id_moneda = 1 THEN
		valor := _prima * cambiodolar;
	END IF;
	IF _id_moneda = 2 THEN
		valor := _prima * cambioeuro;
	END IF;
	IF _id_moneda = 3 THEN
		valor := _prima * cambiopeso;
	END IF;
	IF _id_moneda = 4 THEN
		valor := _prima;
	END IF;
	RETURN valor;
END;
$$  LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION conversionMoneda(_fecha date)
  RETURNS setof plan_de_pagos AS $$
DECLARE
	valor numeric;
	cur_row record;
	c cursor for select * from plan_de_pagos;
BEGIN
create temporary table pagos_temp as select * from plan_de_pagos; 

 FOR cur_row IN c LOOP
	select getValorCambio(cur_row.id_moneda, cur_row.prima,_fecha) into valor;
	update pagos_temp set prima = valor where id_plan = cur_row.id_plan;  
 END LOOP;

	RETURN QUERY SELECT * FROM pagos_temp order by id_plan;
	DROP TABLE pagos_temp;
END;
$$  LANGUAGE plpgsql;

--CREATE FUNCTION obtener_cursor(refcursor) RETURNS refcursor AS $$
--BEGIN
	--OPEN $1 FOR SELECT * FROM plan_de_pagos;
	--RETURN $1;
--END;
--$$ LANGUAGE plpgsql;


--CREATE OR REPLACE FUNCTION conversionMoneda(_fecha date)
  --RETURNS setof plan_de_pagos AS $$
--DECLARE
	--valor numeric;
	--ts plan_de_pagos%ROWTYPE;

	--cur_row record;
	
	--c refcursor;
--BEGIN
--create temporary table pagos_temp as select * from plan_de_pagos; 
--c := obtener_cursor(c);

 --Loop
 --FETCH from c INTO cur_row;
 --exit when not FOUND;
	--select getValorCambio(cur_row.id_moneda, cur_row.prima,_fecha) into valor;
	--update pagos_temp set prima = valor where id_plan = cur_row.id_plan;  
 --END LOOP;
--CLOSE c;
 --for ts in select * from pagos_temp order by id_plan loop
   --return next ts;	
--end loop;

	--DROP TABLE pagos_temp;
--END;
--$$  LANGUAGE plpgsql;

