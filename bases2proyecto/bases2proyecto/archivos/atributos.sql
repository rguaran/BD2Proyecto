SELECT A.nombre, B.* FROM atributo_cliente A
LEFT JOIN 
(SELECT D.id_atributo_cliente, D.valor, C.nit FROM cliente C JOIN atributo_valor_cliente D ON C.nit = D.nit WHERE C.nit = '152790') as B
ON A.id_atributo_cliente = B.id_atributo_cliente 