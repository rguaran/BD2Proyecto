CREATE TABLE Datos (
	cliente TEXT, 
	negocio TEXT,
	depto TEXT, 
	poliza_vieja TEXT, 
	pais TEXT,
	producto_desc TEXT,
	beneficiarios TEXT,
	tipo TEXT,
	id INTEGER,
	estado TEXT,
	cuotas_atrasadas INTEGER,
	cuotas INTEGER,
	documentos INTEGER,
	imagenes_documento FLOAT,
	tasa FLOAT,
	fecha_inicio DATE,
	fecha_fin DATE,
	meses INTEGER,
	valor_seguro FLOAT,
	pct_deducible FLOAT,
	deducible FLOAT,
	precio FLOAT,
	codigo_oficina TEXT,
	codigo_operador INTEGER,
	codigo_vendedor INTEGER,
	codigo_venta TEXT,
	coberturas_adicionales TEXT,
	moneda TEXT,
	archivo TEXT,
	tipo_pago TEXT,
	cob1 FLOAT,
	cob2 FLOAT,
	cob3 FLOAT,
	cob4 FLOAT,
	cob5 FLOAT,
	cob6 FLOAT,
	cob7 FLOAT,
	cob8 FLOAT,
	cob9 FLOAT,
	cob10 FLOAT,
	PRIMARY KEY (id)
);

SET datestyle TO "ISO, MDY";

COPY datos FROM E'C:\\DatosBD2\\dbm.csv' DELIMITER '|' CSV;

UPDATE Datos SET cob1=0 WHERE cob1 IS NULL;
UPDATE Datos SET cob2=0 WHERE cob2 IS NULL;
UPDATE Datos SET cob3=0 WHERE cob3 IS NULL;
UPDATE Datos SET cob4=0 WHERE cob4 IS NULL;
UPDATE Datos SET cob5=0 WHERE cob5 IS NULL;
UPDATE Datos SET cob6=0 WHERE cob6 IS NULL;
UPDATE Datos SET cob7=0 WHERE cob7 IS NULL;
UPDATE Datos SET cob8=0 WHERE cob8 IS NULL;
UPDATE Datos SET cob9=0 WHERE cob9 IS NULL;
UPDATE Datos SET cob10=0 WHERE cob10 IS NULL;

UPDATE Datos SET beneficiarios='-' WHERE beneficiarios IS NULL;
UPDATE Datos SET archivo='-' WHERE archivo IS NULL;

INSERT INTO TareaProgramada (fecha, tabla, inserciones, modificaciones, eliminaciones) VALUES (NOW(), 'Estado Poliza', 0, 0, 0);




