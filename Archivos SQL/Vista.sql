

CREATE OR REPLACE VIEW datos_totales AS
SELECT c.id_cliente AS Id_Cliente,
c.nombre AS Cliente,
c.domicilio AS Direccion,
c.id1 AS Id_TipoCliente,
(SELECT tipo FROM Tipo_Cliente WHERE id=C.id1) AS Tipo_Cliente,
c.id_pais AS Id_Pais, 
(SELECT pais FROM Pais WHERE id_pais=C.id_pais) AS Pais,
P.id_cargaV AS codigo_vendedor,
P.id_cargaO AS codigo_operador,
P.id_cargaN AS codigo_negociador,
(SELECT nombre FROM Empleado WHERE id_emp=P.id_negociador) AS Negociador,
O.id_oficina AS Id_Oficina,
O.nombre AS Oficina,
D.id_dep AS Id_Departamento,
D.nombre AS Departamento,
P.id_poliza AS Id_Poliza,
P.id_ts AS Id_Seguro,
TDS.tipo AS Tipo_De_Seguro,
P.fecha_inicio AS Fecha_Inicio,
P.fecha_fin AS Fecha_Fin,
P.poliza_vieja AS Poliza_Vieja,
P.producto_descripcion AS Producto_Descripcion,
P.precio AS Precio,
P.valor_seguro AS Valor_Seguro,
P.meses AS Meses,
P.cod_venta AS Codigo_Venta,
P.coberturas_adicionales AS Coberturas_Ad,
P.id_est AS Id_Estado,
P.status AS Estado,
B.id_beneficiario AS Id_Beneficiario,
B.nombre AS Beneficiario,
A.archivo AS Nombre_Archivo,
PDP.id_plan AS Id_Plan_Pagos,
PDP.numero_cuotas AS Numero_Cuotas,
PDP.recargo AS tasa,
PDP.prima AS Prima,
PDP.numero_cuotas_atrasadas AS Cuotas_Atrasadas,
PDP.porcentaje_deducible AS Porcentaje_Deducible,
PDP.deducible AS Deducible,
PDP.tipo_cuota AS Tipo_Cuota,
PDP.id_tp AS Id_Tipo_Pago,
(SELECT tipo FROM Tipo_De_Pago WHERE id_tp=PDP.id_tp) AS Tipo_Pago,
PDP.id_moneda AS Id_Moneda,
(SELECT moneda FROM Moneda WHERE id_moneda=PDP.id_moneda) AS Moneda
FROM Poliza AS P
JOIN cliente AS C ON C.id_cliente = P.id_cli
JOIN Empleado AS E ON E.id_emp = P.id_vendedor
JOIN Oficina AS O ON O.id_oficina = E.id_oficina
JOIN Departamento AS D ON D.id_dep = O.id_dep
JOIN Tipo_De_Seguro AS TDS ON TDS.id_ts = P.id_ts
JOIN Archivos AS A ON A.id_poliza = P.id_poliza
JOIN Plan_De_Pagos AS PDP ON PDP.id_poliza = P.id_poliza
JOIN Tipo_De_Pago AS TDP ON TDP.id_tp = PDP.id_tp
JOIN Moneda AS M ON M.id_moneda = PDP.id_moneda
JOIN Beneficiario AS B ON B.id_poliza = P.id_poliza
JOIN Cobertura AS CO ON CO.id_poliza = P.id_poliza;


SELECT * FROM datos_totales;

COPY (SELECT * FROM datos_totales) TO 'C:\DatosBD2\desnormalizados.csv' WITH DELIMITER AS '|' CSV HEADER; 