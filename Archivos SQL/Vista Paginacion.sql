
CREATE OR REPLACE VIEW paginacion AS
SELECT relname AS Tabla, reltuples AS TuplasInsertadas, relpages AS Paginacion
FROM pg_class
WHERE relname LIKE 'poliza' OR
relname LIKE 'moneda' OR 
relname LIKE 'cliente' OR
relname LIKE 'tipo_cliente' OR
relname LIKE 'pais' OR
relname LIKE 'fotografia' OR 
relname LIKE 'cobertura' OR 
relname LIKE 'archivos' OR 
relname LIKE 'bien' OR 
relname LIKE 'inspeccion' OR 
relname LIKE 'empleado' OR 
relname LIKE 'oficina' OR 
relname LIKE 'departamento' OR 
relname LIKE 'tipo_empleado'  OR
relname LIKE 'detalle_pago' OR 
relname LIKE 'tipo_de_cambio' OR 
relname LIKE 'plan_de_pagos' OR 
relname LIKE 'tipo_de_pago' OR 
relname LIKE 'condiciones_generales' OR 
relname LIKE 'poliza-condicion' OR 
relname LIKE 'tipo_de_seguro' OR 
relname LIKE 'condiciones' OR 
relname LIKE 'beneficiario' OR 
relname LIKE 'bitacora'
ORDER BY relpages DESC; 