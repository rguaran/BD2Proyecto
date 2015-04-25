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
INSERT INTO Tipo_De_Seguro (id_ts, tipo) VALUES ('AUTO','Auto');
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


UPDATE Tipo_De_Seguro SET tipo='AUTO' WHERE id_ts = 'AUTO';
UPDATE Tipo_De_Seguro SET tipo='BIENES' WHERE id_ts = 'BIEN';
UPDATE Tipo_De_Seguro SET tipo='Confidencial' WHERE id_ts = 'CONF'; 
UPDATE Tipo_De_Seguro SET tipo='ELECTRONICO' WHERE id_ts = 'ELEC'; 
UPDATE Tipo_De_Seguro SET tipo='EVENTO' WHERE id_ts = 'EVEN'; 
UPDATE Tipo_De_Seguro SET tipo='Garantia' WHERE id_ts = 'GARAN'; 
UPDATE Tipo_De_Seguro SET tipo='HOGAR' WHERE id_ts = 'HOGAR';
UPDATE Tipo_De_Seguro SET tipo='Importacion' WHERE id_ts = 'IMPOR';
UPDATE Tipo_De_Seguro SET tipo='MEDICO' WHERE id_ts = 'MEDIC';
UPDATE Tipo_De_Seguro SET tipo='MERCADERIA' WHERE id_ts = 'MERCA';
UPDATE Tipo_De_Seguro SET tipo='TRANSPORTE' WHERE id_ts = 'TRANS';
UPDATE Tipo_De_Seguro SET tipo='VIAJE' WHERE id_ts = 'VIAJE';
UPDATE Tipo_De_Seguro SET tipo='VIDA' WHERE id_ts = 'VIDA';


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

-------------------------------------- Condiciones Particulares ------------------------------------
INSERT INTO Condiciones_Particulares (condicion) VALUES ('Condicion particular 1');



-------------------------------------- Empleados Operadores ------------------------------------
INSERT INTO Empleado  (id_carga, nombre, usuario, pass, telefono, id_te, id_oficina, id_dep)
SELECT DISTINCT codigo_operador, '', CONCAT('usuario_', codigo_operador), 'password',  '', getIdTipoEmpleado('Operador'), codigo_oficina, getIdDepartamento(depto)
FROM Datos;

-------------------------------------- Empleados Vendedores ------------------------------------
INSERT INTO Empleado  (id_carga, nombre, usuario, pass, telefono, id_te, id_oficina, id_dep)
SELECT DISTINCT codigo_vendedor, '', CONCAT('usuario_', codigo_operador), 'password', '', getIdTipoEmpleado('Vendedor'), codigo_oficina, getIdDepartamento(depto)
FROM Datos;

-------------------------------------- Empleados Negociadores ------------------------------------
INSERT INTO Empleado  (nombre, usuario, pass, telefono, id_te, id_oficina, id_dep)
SELECT DISTINCT negocio, CONCAT('usuario_', negocio), 'password', '', getIdTipoEmpleado('Negociador'), codigo_oficina, getIdDepartamento(depto)
FROM Datos;

INSERT INTO Poliza    (id_poliza, id_estado, id_cp, fecha_inicio, fecha_fin, clausulas, id, id_ts, poliza_vieja, meses, producto_descripcion,
						status, id_vendedor, id_operador, id_negociador, cod_venta, coberturas_adicionales, id_cargaV, id_cargaO, id_cargaN)
SELECT DISTINCT id, getIdEstado(estado), 1, fecha_inicio, fecha_fin, '', getIdCliente(cliente, pais), getIdTS(tipo), poliza_vieja, meses, producto_desc,
				estado, getIdEmp('Vendedor', codigo_vendedor, codigo_oficina, getIdDepartamento(depto)), getIdEmp('Operador', codigo_operador, codigo_oficina, getIdDepartamento(depto)),
				getIdNegociador(negocio), codigo_venta, coberturas_adicionales, codigo_vendedor, codigo_operador, getIdCargaNegociador(negocio)
FROM Datos;						

-------------------------------------- Coberturas  -------------------------------------------------
INSERT INTO Cobertura (descripcion, monto, id_ts, id_poliza)
SELECT DISTINCT '', cob1, getIdTS(tipo), id
FROM Datos;

INSERT INTO Cobertura (descripcion, monto, id_ts, id_poliza)
SELECT DISTINCT '', cob2, getIdTS(tipo), id
FROM Datos;

INSERT INTO Cobertura (descripcion, monto, id_ts, id_poliza)
SELECT DISTINCT '', cob3, getIdTS(tipo), id
FROM Datos;

INSERT INTO Cobertura (descripcion, monto, id_ts, id_poliza)
SELECT DISTINCT '', cob4, getIdTS(tipo), id
FROM Datos;

INSERT INTO Cobertura (descripcion, monto, id_ts, id_poliza)
SELECT DISTINCT '', cob5, getIdTS(tipo), id
FROM Datos;

INSERT INTO Cobertura (descripcion, monto, id_ts, id_poliza)
SELECT DISTINCT '', cob6, getIdTS(tipo), id
FROM Datos;

INSERT INTO Cobertura (descripcion, monto, id_ts, id_poliza)
SELECT DISTINCT '', cob7, getIdTS(tipo), id
FROM Datos;

INSERT INTO Cobertura (descripcion, monto, id_ts, id_poliza)
SELECT DISTINCT '', cob8, getIdTS(tipo), id
FROM Datos;

INSERT INTO Cobertura (descripcion, monto, id_ts, id_poliza)
SELECT DISTINCT '', cob9, getIdTS(tipo), id
FROM Datos;

INSERT INTO Cobertura (descripcion, monto, id_ts, id_poliza)
SELECT DISTINCT '', cob10, getIdTS(tipo), id
FROM Datos;

--------------------------------------  Tipos de pago  -------------------------------------------------
INSERT INTO Tipo_De_Pago (tipo)
SELECT DISTINCT tipo_pago
FROM Datos;

INSERT INTO Plan_De_Pagos(prima, numero_cuotas, recargo, pago_cuota, id_moneda, numero_cuotas_atrasadas, id_ts, id_poliza, porcentaje_deducible,
							deducible, id_tp)
SELECT DISTINCT valor_seguro, 0, tasa, 0, getIdMoneda(moneda), cuotas_atrasadas, getIdTS(tipo), id, pct_deducible, deducible, getIdTipoPago(tipo_pago)
FROM Datos;

INSERT INTO Beneficiario(nombre, telefono, id_ts, id_poliza)
SELECT DISTINCT beneficiarios, '', getIdTS(tipo), id
FROM Datos;

INSERT INTO Archivos (nombre, id_ts, id_poliza)
SELECT DISTINCT archivo, getIdTS(tipo), id
FROM Datos;












