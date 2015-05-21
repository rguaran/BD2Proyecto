-- Reporte 1

CREATE OR REPLACE FUNCTION reporte1()
  RETURNS TABLE(nombre varchar, domicilio varchar, tipo varchar, pais text) AS $$
BEGIN
return query select c.nombre, c.domicilio, c.tipo,pais.pais from 
(cliente join tipo_cliente on cliente.id1 = tipo_cliente.id) c join pais on c.id_pais = pais.id_pais order by c.nombre;
END;
$$  LANGUAGE plpgsql;

-- Reporte 2 *****AUN FALTA 

CREATE OR REPLACE FUNCTION reporte2(_fecha date)
  RETURNS TABLE(total numeric, id_ts varchar, moneda text, pais text) AS $$
BEGIN
create temporary table planpagos_temp as select * from conversionMoneda(_fecha);

RETURN QUERY select sum(pp.prima), p.id_ts, m.moneda, pa.pais 
--select *
from poliza p join planpagos_temp pp 
on p.id_ts = pp.id_ts and p.id_poliza = pp.id_poliza
join moneda m on pp.id_moneda = m.id_moneda
join cliente c on p.id = c.id
join pais pa on pa.id_pais = c.id_pais
group by p.id_ts, m.moneda, pa.pais 
;
DROP TABLE planpagos_temp;
END;
$$  LANGUAGE plpgsql;


-- Reporte 3
CREATE OR REPLACE FUNCTION reporte3(param varchar, pvalor int, pvalor2 varchar)
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

select id_emp, usuario, count(id_poliza) from empleado e inner join poliza p on e.id_emp = p.id_vendedor group by id_emp, usuario




-- Reporte 6
CREATE OR REPLACE FUNCTION reporte6()
  RETURNS TABLE(idpoliza int, tipoSeguro varchar, moneda text, totalcoberturas numeric) AS $$
BEGIN
	RETURN QUERY select p.id_poliza, p.id_ts, m.moneda , sum(co.monto) 
	from poliza p join cobertura co on co.id_poliza = p.id_poliza and co.id_ts= p.id_ts
	join plan_de_pagos pp on pp.id_poliza = p.id_poliza  and pp.id_ts= p.id_ts
	join moneda m on pp.id_moneda = m.id_moneda 
	group by p.id_poliza,p.id_ts, m.moneda 
	order by p.id_poliza;
END;
$$  LANGUAGE plpgsql; 


-- Reporte 7

CREATE OR REPLACE FUNCTION reporte7(id_moneda int)
  RETURNS TABLE("Código vendedor" int, "Nombre" varchar, "Total venta" numeric) AS $$
BEGIN
	RETURN QUERY select id_vendedor as "id", e.usuario, sum(getValorCambio2(id_moneda,precio)) as "total" from poliza  inner join empleado e on e.id_emp = id_vendedor group by id_vendedor, usuario order by "total" desc ;
END;
$$  LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION reporte7(id_moneda int, _id_vendedor int)
  RETURNS TABLE("Código vendedor" int, "Nombre" varchar, "Total venta" numeric) AS $$
BEGIN
	RETURN QUERY select id_vendedor as "id", e.usuario, sum(getValorCambio2(id_moneda,precio)) as "total" from poliza  inner join empleado e on e.id_emp = id_vendedor where id_vendedor = _id_vendedor group by id_vendedor, usuario order by "total" desc ;
END;
$$  LANGUAGE plpgsql;

-- Reporte 8

CREATE OR REPLACE FUNCTION reporte8(id_moneda int)
  RETURNS TABLE("Código agente" int, "Nombre" varchar, "Total venta" numeric) AS $$
BEGIN
	RETURN QUERY select id_negociador as "id", e.usuario, sum(getValorCambio2(id_moneda,precio)) as "total" from poliza  inner join empleado e on e.id_emp = id_negociador group by id_negociador, usuario order by "total" desc ;
END;
$$  LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION reporte8(id_moneda int, _id_negociador int)
  RETURNS TABLE("Código agente" int, "Nombre" varchar, "Total venta" numeric) AS $$
BEGIN
	RETURN QUERY select id_negociador as "id", e.usuario, sum(getValorCambio2(id_moneda,precio)) as "total" from poliza  inner join empleado e on e.id_emp = id_negociador where id_negociador = _id_negociador group by id_negociador, usuario order by "total" desc ;
END;
$$  LANGUAGE plpgsql;
 
-- Reporte 14 

select nombre, octet_length(archivo) from archivos

