-- Reporte 1

CREATE OR REPLACE FUNCTION reporte1()
  RETURNS TABLE(nombre varchar, domicilio varchar,telefono text,  tipo varchar, pais text) AS $$
BEGIN
return query select c.nombre, c.domicilio, text('12345678'), c.tipo,pais.pais from 
(cliente join tipo_cliente on cliente.id1 = tipo_cliente.id) c join pais on c.id_pais = pais.id_pais order by c.nombre;
END;
$$  LANGUAGE plpgsql;

-- Reporte 2 *****No estoy segura si eso es lo que piden

--CREATE OR REPLACE FUNCTION reporte2(param varchar, _moneda int)
 -- RETURNS TABLE("Filtro" text, "Total precio de polizas" float, "Total valor seguro" float) AS $$
--BEGIN
--	IF param = 'tiposeguro' THEN
--		RETURN QUERY select ts.tipo,sum(getValorCambio3(_moneda,p.precio)) as total_precio, sum(getValorCambio3(_moneda,p.valor_seguro)) as total_valor_seguro
--		from poliza p right join tipo_de_seguro ts on p.id_ts = ts.id_ts
--		group by ts.id_ts,ts.tipo
--		order by ts.id_ts;
--	END IF;
--	IF param = 'moneda' THEN
--		RETURN QUERY select m.moneda,sum(getValorCambio3(_moneda,p.precio)) as total_precio, sum(getValorCambio3(_moneda,p.valor_seguro)) as total_valor_seguro
--		from poliza p join plan_de_pagos pp on p.id_ts = pp.id_ts and p.id_poliza = pp.id_poliza
--		join moneda m on pp.id_moneda = m.id_moneda
--		group by m.moneda
--		order by m.moneda;
--	END IF;
--	IF param = 'pais' THEN
--		RETURN QUERY select pa.pais,sum(getValorCambio3(_moneda,p.precio)) as total_precio, sum(getValorCambio3(_moneda,p.valor_seguro)) as total_valor_seguro
--		from poliza p join cliente c on p.id_cli = c.id_cliente
--		right join pais pa on pa.id_pais = c.id_pais
--		group by pa.pais
--		order by pa.pais;
--	END IF;
--END;
--$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION reporte2(_id_ts varchar)
  RETURNS TABLE("Tipo de Seguro" text, "Moneda" text, "Pais" text, "Precio Total" float, "Valor total de seguros" float) AS $$
BEGIN
	RETURN QUERY select ts.tipo,m.moneda,pa.pais, sum(p.precio) as total_precio, sum(p.valor_seguro) as total_valor_seguro
	from poliza p join tipo_de_seguro ts on p.id_ts = ts.id_ts
	join plan_de_pagos pp on p.id_ts = pp.id_ts and p.id_poliza = pp.id_poliza
	join moneda m on pp.id_moneda = m.id_moneda
	join cliente c on p.id_cli = c.id_cliente
	join pais pa on pa.id_pais = c.id_pais
	where p.id_ts= _id_ts
	group by ts.id_ts,ts.tipo,m.moneda,pa.pais
	order by pa.pais;
END;
$$  LANGUAGE plpgsql;



-- Reporte 3
CREATE OR REPLACE FUNCTION reporte3(param varchar, pvalor int)
  RETURNS TABLE(idpoliza int, tipoSeguro text, fecha_inicio date, fecha_fin date, poliza_vieja varchar, meses int,producto text, status varchar, id_vendedor int,
  id_operador int, cod_venta text, coberturas_adicionales text, condicion text, cliente varchar, domicilio varchar, tipo varchar, pais text,
  agenteNegocio text, estadoPoliza varchar) AS $$
BEGIN

IF param = 'tiposeguro' then
	RETURN QUERY select p.id_poliza, ts.tipo, p.fecha_inicio, p.fecha_fin, p.poliza_vieja, p.meses,
	 p.producto_descripcion, p.status, p.id_vendedor, p.id_operador, p.cod_venta, p.coberturas_adicionales, cp.condicion,
	 c.nombre, c.domicilio, tc.tipo,pa.pais, e.nombre, ep.estado
	from poliza p join cliente c on p.id_cli = c.id_cliente
	join tipo_de_seguro ts on p.id_ts = ts.id_ts
	join empleado e on p.id_negociador = e.id_emp and p.id_cargan = e.id_carga
	join estado_poliza ep on ep.id_estado = p.id_est
	join pais pa on pa.id_pais = c.id_pais
	join tipo_cliente tc on tc.id = c.id1
	join condiciones_particulares cp on p.id_condp = cp.id_cp
	--where p.id_ts = pvalor2;
	where LOWER(p.id_ts) LIKE LOWER((pvalor2 || '%' ));
END IF;
IF param = 'numeropoliza' then
	RETURN QUERY select p.id_poliza, ts.tipo, p.fecha_inicio, p.fecha_fin, p.poliza_vieja, p.meses,
	 p.producto_descripcion, p.status, p.id_vendedor, p.id_operador, p.cod_venta, p.coberturas_adicionales, cp.condicion,
	 c.nombre, c.domicilio, tc.tipo,pa.pais, e.nombre, ep.estado
	from poliza p join cliente c on p.id_cli = c.id_cliente
	join tipo_de_seguro ts on p.id_ts = ts.id_ts
	join empleado e on p.id_negociador = e.id_emp and p.id_cargan = e.id_carga
	join estado_poliza ep on ep.id_estado = p.id_est
	join pais pa on pa.id_pais = c.id_pais
	join tipo_cliente tc on tc.id = c.id1
	join condiciones_particulares cp on p.id_condp = cp.id_cp
	where p.id_poliza = pvalor;
	
END IF;
IF param = 'cliente' then
	RETURN QUERY select p.id_poliza, ts.tipo, p.fecha_inicio, p.fecha_fin, p.poliza_vieja, p.meses,
	 p.producto_descripcion, p.status, p.id_vendedor, p.id_operador, p.cod_venta, p.coberturas_adicionales, cp.condicion,
	 c.nombre, c.domicilio, tc.tipo,pa.pais, e.nombre, ep.estado
	from poliza p join cliente c on p.id_cli = c.id_cliente
	join tipo_de_seguro ts on p.id_ts = ts.id_ts
	join empleado e on p.id_negociador = e.id_emp and p.id_cargan = e.id_carga
	join estado_poliza ep on ep.id_estado = p.id_est
	join pais pa on pa.id_pais = c.id_pais
	join tipo_cliente tc on tc.id = c.id1
	join condiciones_particulares cp on p.id_condp = cp.id_cp
	--where p.id = pvalor;
	where LOWER(c.nombre) LIKE LOWER((pvalor2 || '%' ));
END IF;
IF param = 'agentenegocio' then
	RETURN QUERY select p.id_poliza, ts.tipo, p.fecha_inicio, p.fecha_fin, p.poliza_vieja, p.meses,
	 p.producto_descripcion, p.status, p.id_vendedor, p.id_operador, p.cod_venta, p.coberturas_adicionales, cp.condicion,
	 c.nombre, c.domicilio, tc.tipo,pa.pais, e.nombre, ep.estado
	from poliza p join cliente c on p.id_cli = c.id_cliente
	join tipo_de_seguro ts on p.id_ts = ts.id_ts
	join empleado e on p.id_negociador = e.id_emp and p.id_cargan = e.id_carga
	join estado_poliza ep on ep.id_estado = p.id_est
	join pais pa on pa.id_pais = c.id_pais
	join tipo_cliente tc on tc.id = c.id1
	join condiciones_particulares cp on p.id_condp = cp.id_cp
	--where p.id_negociador = pvalor and p.id_cargan = _idcargan;
	where LOWER(e.nombre) LIKE LOWER((pvalor2 || '%' ));
END IF;
IF param = 'polizavieja' then
	RETURN QUERY select p.id_poliza, ts.tipo, p.fecha_inicio, p.fecha_fin, p.poliza_vieja, p.meses,
	 p.producto_descripcion, p.status, p.id_vendedor, p.id_operador, p.cod_venta, p.coberturas_adicionales, cp.condicion,
	 c.nombre, c.domicilio, tc.tipo,pa.pais, e.nombre, ep.estado
	from poliza p join cliente c on p.id_cli = c.id_cliente
	join tipo_de_seguro ts on p.id_ts = ts.id_ts
	join empleado e on p.id_negociador = e.id_emp and p.id_cargan = e.id_carga
	join estado_poliza ep on ep.id_estado = p.id_est
	join pais pa on pa.id_pais = c.id_pais
	join tipo_cliente tc on tc.id = c.id1
	join condiciones_particulares cp on p.id_condp = cp.id_cp
	--where p.poliza_vieja = pvalor2;
	where LOWER(p.poliza_vieja) LIKE LOWER((pvalor2 || '%' ));
END IF;
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION reporte3(param varchar, pvalor2 varchar)
  RETURNS TABLE(idpoliza int, tipoSeguro text, fecha_inicio date, fecha_fin date, poliza_vieja varchar, meses int,producto text, status varchar, id_vendedor int,
  id_operador int, cod_venta text, coberturas_adicionales text, condicion text, cliente varchar, domicilio varchar, tipo varchar, pais text,
  agenteNegocio text, estadoPoliza varchar) AS $$
BEGIN

IF param = 'tiposeguro' then
	RETURN QUERY select p.id_poliza, ts.tipo, p.fecha_inicio, p.fecha_fin, p.poliza_vieja, p.meses,
	 p.producto_descripcion, p.status, p.id_vendedor, p.id_operador, p.cod_venta, p.coberturas_adicionales, cp.condicion,
	 c.nombre, c.domicilio, tc.tipo,pa.pais, e.nombre, ep.estado
	from poliza p join cliente c on p.id_cli = c.id_cliente
	join tipo_de_seguro ts on p.id_ts = ts.id_ts
	join empleado e on p.id_negociador = e.id_emp and p.id_cargan = e.id_carga
	join estado_poliza ep on ep.id_estado = p.id_est
	join pais pa on pa.id_pais = c.id_pais
	join tipo_cliente tc on tc.id = c.id1
	join condiciones_particulares cp on p.id_condp = cp.id_cp
	--where p.id_ts = pvalor2;
	where LOWER(p.id_ts) LIKE LOWER((pvalor2 || '%' ));
END IF;
IF param = 'numeropoliza' then
	RETURN QUERY select p.id_poliza, ts.tipo, p.fecha_inicio, p.fecha_fin, p.poliza_vieja, p.meses,
	 p.producto_descripcion, p.status, p.id_vendedor, p.id_operador, p.cod_venta, p.coberturas_adicionales, cp.condicion,
	 c.nombre, c.domicilio, tc.tipo,pa.pais, e.nombre, ep.estado
	from poliza p join cliente c on p.id_cli = c.id_cliente
	join tipo_de_seguro ts on p.id_ts = ts.id_ts
	join empleado e on p.id_negociador = e.id_emp and p.id_cargan = e.id_carga
	join estado_poliza ep on ep.id_estado = p.id_est
	join pais pa on pa.id_pais = c.id_pais
	join tipo_cliente tc on tc.id = c.id1
	join condiciones_particulares cp on p.id_condp = cp.id_cp
	where p.id_poliza = pvalor;
	
END IF;
IF param = 'cliente' then
	RETURN QUERY select p.id_poliza, ts.tipo, p.fecha_inicio, p.fecha_fin, p.poliza_vieja, p.meses,
	 p.producto_descripcion, p.status, p.id_vendedor, p.id_operador, p.cod_venta, p.coberturas_adicionales, cp.condicion,
	 c.nombre, c.domicilio, tc.tipo,pa.pais, e.nombre, ep.estado
	from poliza p join cliente c on p.id_cli = c.id_cliente
	join tipo_de_seguro ts on p.id_ts = ts.id_ts
	join empleado e on p.id_negociador = e.id_emp and p.id_cargan = e.id_carga
	join estado_poliza ep on ep.id_estado = p.id_est
	join pais pa on pa.id_pais = c.id_pais
	join tipo_cliente tc on tc.id = c.id1
	join condiciones_particulares cp on p.id_condp = cp.id_cp
	--where p.id = pvalor;
	where LOWER(c.nombre) LIKE LOWER((pvalor2 || '%' ));
END IF;
IF param = 'agentenegocio' then
	RETURN QUERY select p.id_poliza, ts.tipo, p.fecha_inicio, p.fecha_fin, p.poliza_vieja, p.meses,
	 p.producto_descripcion, p.status, p.id_vendedor, p.id_operador, p.cod_venta, p.coberturas_adicionales, cp.condicion,
	 c.nombre, c.domicilio, tc.tipo,pa.pais, e.nombre, ep.estado
	from poliza p join cliente c on p.id_cli = c.id_cliente
	join tipo_de_seguro ts on p.id_ts = ts.id_ts
	join empleado e on p.id_negociador = e.id_emp and p.id_cargan = e.id_carga
	join estado_poliza ep on ep.id_estado = p.id_est
	join pais pa on pa.id_pais = c.id_pais
	join tipo_cliente tc on tc.id = c.id1
	join condiciones_particulares cp on p.id_condp = cp.id_cp
	--where p.id_negociador = pvalor and p.id_cargan = _idcargan;
	where LOWER(e.nombre) LIKE LOWER((pvalor2 || '%' ));
END IF;
IF param = 'polizavieja' then
	RETURN QUERY select p.id_poliza, ts.tipo, p.fecha_inicio, p.fecha_fin, p.poliza_vieja, p.meses,
	 p.producto_descripcion, p.status, p.id_vendedor, p.id_operador, p.cod_venta, p.coberturas_adicionales, cp.condicion,
	 c.nombre, c.domicilio, tc.tipo,pa.pais, e.nombre, ep.estado
	from poliza p join cliente c on p.id_cli = c.id_cliente
	join tipo_de_seguro ts on p.id_ts = ts.id_ts
	join empleado e on p.id_negociador = e.id_emp and p.id_cargan = e.id_carga
	join estado_poliza ep on ep.id_estado = p.id_est
	join pais pa on pa.id_pais = c.id_pais
	join tipo_cliente tc on tc.id = c.id1
	join condiciones_particulares cp on p.id_condp = cp.id_cp
	--where p.poliza_vieja = pvalor2;
	where LOWER(p.poliza_vieja) LIKE LOWER((pvalor2 || '%' ));
END IF;
END;
$$  LANGUAGE plpgsql;

--reporte 4

CREATE OR REPLACE FUNCTION reporte4(_moneda int)
  RETURNS TABLE(total_precio float, total_valor_seguro float,total_pagado float, total_deuda float) AS $$
BEGIN
return query select sum(getValorCambio3(_moneda,p.precio)),sum(getValorCambio3(_moneda,p.valor_seguro)), 
sum(getValorCambio3(_moneda, (pp.numero_cuotas - pp.numero_cuotas_atrasadas) * (p.precio/pp.numero_cuotas))), 
sum(getValorCambio3(_moneda, pp.numero_cuotas_atrasadas * (p.precio/pp.numero_cuotas)))
from poliza p join plan_de_pagos pp on p.id_poliza = pp.id_poliza and p.id_ts = pp.id_ts
;
END;
$$  LANGUAGE plpgsql;

-- Reporte 5

CREATE OR REPLACE FUNCTION reporte5()
  RETURNS TABLE("ID empleado" int, "Empleado" text, "Total Polizas" bigint) AS $$
BEGIN
RETURN QUERY select id_emp, nombre, count(id_poliza) from empleado e inner join poliza p on e.id_emp = p.id_vendedor  group by id_emp, nombre;
END;
$$  LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION reporte5(_nombre varchar)
  RETURNS TABLE("ID empleado" int, "Empleado" text, "Total Polizas" bigint) AS $$
BEGIN
RETURN QUERY select id_emp, nombre, count(id_poliza) from empleado e inner join poliza p on e.id_emp = p.id_vendedor where nombre like _nombre group by id_emp, nombre;
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION reporte5(_id_poliza int)
  RETURNS TABLE("ID empleado" int, "Empleado" text, "Total Polizas" bigint) AS $$
BEGIN
RETURN QUERY select id_emp, nombre, count(id_poliza) from empleado e inner join poliza p on e.id_emp = p.id_vendedor where id_poliza = _id_poliza group by id_emp, nombre;
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION reporte5(_nombre varchar, _id_poliza int)
  RETURNS TABLE("ID empleado" int, "Empleado" text, "Total Polizas" bigint) AS $$
BEGIN
RETURN QUERY select id_emp, nombre, count(id_poliza) from empleado e inner join poliza p on e.id_emp = p.id_vendedor where nombre like _nombre or id_poliza = _id_poliza group by id_emp, nombre;
END;
$$  LANGUAGE plpgsql;

-- Reporte 6
CREATE OR REPLACE FUNCTION reporte6(_id_moneda int)
  RETURNS TABLE(idpoliza int, tipoSeguro varchar, moneda text, totalcoberturas numeric) AS $$
BEGIN
	RETURN QUERY select p.id_poliza, p.id_ts, m.moneda , sum(getValorCambio2(_id_moneda,co.monto)) 
	from poliza p join cobertura co on co.id_poliza = p.id_poliza and co.id_ts= p.id_ts
	join plan_de_pagos pp on pp.id_poliza = p.id_poliza  and pp.id_ts= p.id_ts
	join moneda m on pp.id_moneda = m.id_moneda 
	group by p.id_poliza,p.id_ts, m.moneda 
	order by p.id_poliza;
END;
$$  LANGUAGE plpgsql; 


-- Reporte 7

CREATE OR REPLACE FUNCTION reporte7(id_moneda int)
  RETURNS TABLE("Código vendedor" int, "Nombre" text, "Total venta" numeric) AS $$
BEGIN
	RETURN QUERY select id_vendedor as "id", e.nombre, sum(getValorCambio2(id_moneda,precio)) as "total" from poliza  inner join empleado e on e.id_emp = id_vendedor group by id_vendedor, nombre order by "total" desc ;
END;
$$  LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION reporte7(id_moneda int, _id_vendedor varchar)
  RETURNS TABLE("Código vendedor" int, "Nombre" text, "Total venta" numeric) AS $$
BEGIN
	RETURN QUERY select id_vendedor as "id", e.nombre, sum(getValorCambio2(id_moneda,precio)) as "total" from poliza  inner join empleado e on e.id_emp = id_vendedor where cast(id_vendedor as varchar) like _id_vendedor group by id_vendedor, nombre order by "total" desc ;
END;
$$  LANGUAGE plpgsql;

-- Reporte 8

CREATE OR REPLACE FUNCTION reporte8(id_moneda int)
  RETURNS TABLE("Código agente" int, "Nombre" varchar, "Total venta" numeric) AS $$
BEGIN
	RETURN QUERY select id_negociador as "id", e.usuario, sum(getValorCambio2(id_moneda,precio)) as "total" from poliza  inner join empleado e on e.id_emp = id_negociador group by id_negociador, usuario order by "total" desc ;
END;
$$  LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION reporte8(id_moneda int, _negociador varchar)
  RETURNS TABLE("Código agente" int, "Nombre" text, "Total venta" numeric) AS $$
BEGIN
	RETURN QUERY select id_negociador as "id", e.nombre, sum(getValorCambio2(id_moneda,precio)) as "total" from poliza  inner join empleado e on e.id_emp = id_negociador where lower(nombre) like lower(_negociador) group by id_negociador, nombre order by "total" desc ;
END;
$$  LANGUAGE plpgsql;

-- Reporte 9

CREATE OR REPLACE FUNCTION reporte9(id_moneda int, _pos int)
  RETURNS TABLE("Cliente" varchar, "Total" numeric) AS $$
  BEGIN
  IF _pos = 0 THEN
	RETURN QUERY Select c.nombre, cast(count(id_poliza) as numeric) conteo from cliente c inner join poliza p on c.id_cliente = p.id_cli group by c.nombre order by conteo desc limit 10;
  END IF;
  IF _pos = 1 THEN
	RETURN QUERY Select c.nombre, sum(getValorCambio2(id_moneda,p.precio)) conteo from cliente c inner join poliza p on c.id_cliente = p.id_cli group by c.nombre order by conteo desc limit 10;
  END IF;
  IF _pos = 2 THEN
	RETURN QUERY Select c.nombre, sum(getValorCambio2(id_moneda,p.valor_seguro)) conteo from cliente c inner join poliza p on c.id_cliente = p.id_cli group by c.nombre order by conteo desc limit 10 ;
  END IF;

END;
$$  LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION reporte9(id_moneda int, _pos int, _pos2 int)
  RETURNS TABLE("Cliente" varchar, "Total" numeric, "Total " numeric) AS $$
  BEGIN
  IF _pos = 0 THEN
	IF _pos2 = 1 THEN
	RETURN QUERY select * from (Select c.nombre, sum(getValorCambio2(id_moneda,p.precio)) pagar, cast(count(id_poliza) as numeric) conteo from cliente c inner join poliza p on c.id_cliente = p.id_cli group by c.nombre) a order by pagar desc, conteo desc  limit 10;
	END IF;
	IF _pos2 = 2 THEN
	RETURN QUERY select * from (Select c.nombre, sum(getValorCambio2(id_moneda,p.valor_seguro)) asegurada, cast(count(id_poliza) as numeric) conteo from cliente c inner join poliza p on c.id_cliente = p.id_cli group by c.nombre) a order by asegurada desc, conteo desc  limit 10;
	END IF;
  END IF;
  IF _pos = 1 THEN
	RETURN QUERY select * from (Select c.nombre, sum(getValorCambio2(id_moneda,p.valor_seguro)) asegurada, sum(getValorCambio2(id_moneda,p.precio)) pagar from cliente c inner join poliza p on c.id_cliente = p.id_cli group by c.nombre) a order by asegurada desc, pagar desc  limit 10;
  END IF;
  

END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION reporte9(id_moneda int, _pos int, _pos2 int, _pos3 int)
  RETURNS TABLE("Cliente" varchar, "Total asegurado" numeric, "Total pagado" numeric, "Total polizas" numeric) AS $$
  BEGIN
  
	RETURN QUERY select * from (Select c.nombre, sum(getValorCambio2(id_moneda,p.valor_seguro)) asegurada, sum(getValorCambio2(id_moneda,p.precio)) pagar, cast(count(id_poliza) as numeric) conteo  from cliente c inner join poliza p on c.id_cliente = p.id_cli group by c.nombre) a order by asegurada desc, pagar desc, conteo desc  limit 10;
  
END;
$$  LANGUAGE plpgsql;

-- Reporte 10
CREATE OR REPLACE FUNCTION reporte10()
  RETURNS TABLE("ID Inspeccion" int , "Fecha revision" date, "Nombre bien" text, "Aprobacion" varchar,  "ID Empleado" int) AS $$
  BEGIN
	RETURN QUERY select i.id_inspeccion, i.fecha, b.nombre, i.aprobado, i.id_emp from inspeccion i inner join bien b on i.id_bien = b.id_bien order by i.id_bien desc , i.fecha asc;
END;
$$  LANGUAGE plpgsql;

 -- Reporte 11
CREATE OR REPLACE FUNCTION reporte11(param varchar, valor varchar)
  RETURNS TABLE("Usuario" varchar, "Fecha" timestamp, "Accion" varchar, "Modulo" varchar) AS $$
BEGIN
	IF $1 = 'accion' THEN
	RETURN QUERY select b.usuario, b.fecha, b.accion, b.modulo
	from bitacora b
	where lower(b.accion) like lower($2);
	END IF;
	IF $1 = 'usuario' THEN
	RETURN QUERY select b.usuario, b.fecha, b.accion, b.modulo
	from bitacora b
	where lower(b.usuario) like lower( $2);
	END IF;
END;
$$  LANGUAGE plpgsql; 

CREATE OR REPLACE FUNCTION reporte11(param varchar,fechainicio date, fechafin date)
  RETURNS TABLE("Usuario" varchar, "Fecha" timestamp, "Accion" varchar, "Modulo" varchar) AS $$
BEGIN
	RETURN QUERY select b.usuario, b.fecha, b.accion, b.modulo
	from bitacora b
	where b.fecha between $2 and $3; 
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION reporte11()
  RETURNS TABLE("Usuario" varchar, "Fecha" timestamp, "Accion" varchar, "Modulo" varchar) AS $$
BEGIN
	RETURN QUERY select b.usuario, b.fecha, b.accion, b.modulo
	from bitacora b;
	
END;
$$  LANGUAGE plpgsql;

-- Reporte 13
CREATE OR REPLACE FUNCTION reporte13(_id_moneda int)
  RETURNS TABLE("Cliente" varchar, "Tipo de seguro" varchar, "Total cobertura" numeric) AS $$
  BEGIN
	RETURN QUERY select cl.nombre, a.id_ts, a.sum from (select p.id_cli, c.id_ts, sum(getValorCambio2(_id_moneda,c.monto)) from cobertura c inner join poliza p on c.id_poliza = p.id_poliza and p.id_ts = c.id_ts group by p.id_cli, c.id_ts order by sum desc) a inner join cliente cl on a.id_cli = cl.id_cliente ;
END;
$$  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION reporte13(_id_moneda int, _nombre varchar)
  RETURNS TABLE("Cliente" varchar, "Tipo de seguro" varchar, "Total cobertura" numeric) AS $$
  BEGIN
	RETURN QUERY select cl.nombre, a.id_ts, a.sum from (select p.id_cli, c.id_ts, sum(getValorCambio2(_id_moneda,c.monto)) from cobertura c inner join poliza p on c.id_poliza = p.id_poliza and p.id_ts = c.id_ts group by p.id_cli, c.id_ts order by sum desc) a inner join cliente cl on a.id_cli = cl.id_cliente where lower(nombre) like lower(_nombre) ;
END;
$$  LANGUAGE plpgsql;


-- Reporte 14 
CREATE OR REPLACE FUNCTION reporte14()
  RETURNS TABLE("Nombre del archivo" text, "Total Bytes" numeric) AS $$
  BEGIN
	RETURN QUERY select nombre, cast(octet_length(archivo) as numeric) conteo from archivos order by conteo asc;
END;
$$  LANGUAGE plpgsql;

-- Reporte 15
CREATE OR REPLACE FUNCTION reporte15()
  RETURNS TABLE("Nombre de Usuario" varchar, "Nombre" text, "No. de Telefono" text, "Tipo de Empleado" text, "Nombre de Oficina" varchar,
  "Nombre de Departamento" varchar) AS $$
  BEGIN
	RETURN QUERY select e.usuario, e.nombre, e.telefono, te.tipo, o.nombre, dep.nombre
	from empleado e join tipo_empleado te on e.id_te = te.id_te 
	join oficina o on e.id_oficina = o.id_oficina
	join departamento dep on e.id_dep = dep.id_dep
	group by e.usuario,e.id_emp,e.nombre, e.telefono, te.tipo, o.nombre, dep.nombre
	order by e.id_emp;
END;
$$  LANGUAGE plpgsql;

