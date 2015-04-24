-- Generado por Oracle SQL Developer Data Modeler 3.3.0.747
--   en:        2015-04-23 22:47:29 CST
--   sitio:      SQL Server 2008
--   tipo:      SQL Server 2008




CREATE
  TABLE Archivos
  (
    id_archivo SERIAL NOT NULL ,
    archivo    BYTEA NOT NULL ,
    id_ts      VARCHAR (5) NOT NULL ,
    id_poliza  INTEGER NOT NULL ,
    CONSTRAINT Archivos_PK PRIMARY KEY  (id_archivo)
);

CREATE
  TABLE Beneficiario
  (
    id_beneficiario SERIAL NOT NULL ,
    nombre TEXT NOT NULL ,
    telefono TEXT ,
    id_ts     VARCHAR (5) NOT NULL ,
    id_poliza INTEGER NOT NULL ,
    CONSTRAINT Beneficiario_PK PRIMARY KEY  (id_beneficiario)
);

CREATE
  TABLE Bien
  (
    id_bien SERIAL NOT NULL ,
    nombre TEXT NOT NULL ,
    monto BIGINT ,
    id_ts     VARCHAR (5) NOT NULL ,
    id_poliza INTEGER NOT NULL ,
    CONSTRAINT Bien_PK PRIMARY KEY  (id_bien)
);

CREATE
  TABLE Cliente
  (
    id        SERIAL NOT NULL ,
    nombre    VARCHAR (50) NOT NULL ,
    domicilio VARCHAR (75) ,
    id1       INTEGER NOT NULL ,
    id_pais   INTEGER NOT NULL ,
    CONSTRAINT Cliente_PK PRIMARY KEY (id)
);

CREATE
  TABLE Cobertura
  (
    id_cobertura SERIAL NOT NULL ,
    descripcion TEXT ,
    monto     DECIMAL NOT NULL ,
    id_ts     VARCHAR (5) NOT NULL ,
    id_poliza INTEGER NOT NULL ,
    CONSTRAINT Cobertura_PK PRIMARY KEY (id_cobertura)
);

CREATE
  TABLE Condiciones
  (
    id_cond SERIAL NOT NULL ,
    condicion TEXT NOT NULL ,
    id_ts VARCHAR (5) NOT NULL ,
    CONSTRAINT Condiciones_PK PRIMARY KEY (id_cond)
);

CREATE
  TABLE Condiciones_Generales
  (
    id_cg SERIAL NOT NULL ,
    condicion TEXT NOT NULL ,
    CONSTRAINT Condiciones_Generales_PK PRIMARY KEY (id_cg)
);

CREATE
  TABLE Condiciones_Particulares
  (
    id_cp SERIAL NOT NULL ,
    condicion TEXT NOT NULL ,
    CONSTRAINT Condiciones_Particulares_PK PRIMARY KEY (id_cp)
);

CREATE
  TABLE Departamento
  (
    id_dep SERIAL NOT NULL ,
    nombre VARCHAR (50) NOT NULL ,
    CONSTRAINT Departamento_PK PRIMARY KEY (id_dep)
);

CREATE
  TABLE Detalle_Pago
  (
    id_detalle   SERIAL NOT NULL ,
    fecha        DATE NOT NULL ,
    numero_cuota INTEGER NOT NULL ,
    id_plan      INTEGER NOT NULL ,
    CONSTRAINT Detalle_Pago_PK PRIMARY KEY (id_detalle)
);

CREATE
  TABLE Empleado
  (
    id_emp   SERIAL NOT NULL ,
    id_carga SERIAL NOT NULL ,
    nombre TEXT ,
    telefono TEXT ,
    id_te      INTEGER NOT NULL ,
    id_oficina VARCHAR (5) NOT NULL ,
    id_dep     INTEGER NOT NULL ,
    CONSTRAINT Empleado_PK PRIMARY KEY (id_emp, id_carga)
);

CREATE
  TABLE Estado_Poliza
  (
    id_estado SERIAL NOT NULL ,
    estado    VARCHAR (25) NOT NULL ,
    CONSTRAINT Estado_Poliza_PK PRIMARY KEY (id_estado)
);

CREATE
  TABLE Fotografia
  (
    id_foto SERIAL NOT NULL ,
    nombre TEXT NOT NULL ,
    id_bien INTEGER NOT NULL ,
    CONSTRAINT Fotografia_PK PRIMARY KEY (id_foto)
);

CREATE
  TABLE Inspeccion
  (
    id_inspeccion SERIAL NOT NULL ,
    fecha         DATE NOT NULL ,
    id_bien       INTEGER NOT NULL ,
    aprobado      VARCHAR (2) ,
    id_ts         VARCHAR (5) NOT NULL ,
    id_poliza     INTEGER NOT NULL ,
    id_emp        INTEGER NOT NULL ,
    id_carga      INTEGER NOT NULL ,
    CONSTRAINT Inspeccion_PK PRIMARY KEY (id_inspeccion)
);

CREATE
  TABLE Moneda
  (
    id_moneda SERIAL NOT NULL ,
    moneda TEXT ,
    CONSTRAINT Moneda_PK PRIMARY KEY (id_moneda)
);

CREATE
  TABLE Oficina
  (
    id_oficina VARCHAR (5) NOT NULL ,
    nombre     VARCHAR (50) ,
    id_dep     INTEGER NOT NULL ,
    CONSTRAINT Oficina_PK PRIMARY KEY (id_oficina, id_dep)
);

CREATE
  TABLE Pais
  (
    id_pais SERIAL NOT NULL ,
    pais TEXT NOT NULL ,
    CONSTRAINT Pais_PK PRIMARY KEY (id_pais)
);

CREATE
  TABLE Plan_de_Pagos
  (
    id_plan SERIAL NOT NULL ,
    prima BIGINT NOT NULL ,
    numero_cuotas INTEGER ,
    recargo BIGINT NOT NULL ,
    pago_cuota BIGINT NOT NULL ,
    id_moneda               INTEGER NOT NULL ,
    numero_cuotas_atrasadas INTEGER NOT NULL ,
    id_ts                   VARCHAR (5) NOT NULL ,
    id_poliza               INTEGER NOT NULL ,
    porcentaje_deducible    DECIMAL ,
    deducible               DECIMAL ,
    CONSTRAINT Plan_de_Pagos_PK PRIMARY KEY (id_plan)
);
CREATE UNIQUE INDEX
Plan_de_Pagos__IDX ON Plan_de_Pagos
(
  id_ts ,
  id_poliza
)

;

CREATE
  TABLE Poliza
  (
    id_poliza    SERIAL NOT NULL ,
    id_estado    INTEGER NOT NULL ,
    id_cp        INTEGER NOT NULL ,
    fecha_inicio DATE NOT NULL ,
    fecha_fin    DATE NOT NULL ,
    clausulas TEXT ,
    id           INTEGER NOT NULL ,
    id_ts        VARCHAR (5) NOT NULL ,
    poliza_vieja VARCHAR NOT NULL ,
    meses        INTEGER NOT NULL ,
    producto_descripcion TEXT ,
    status        VARCHAR (15) NOT NULL ,
    id_vendedor   INTEGER NOT NULL ,
    id_operador   INTEGER NOT NULL ,
    id_negociador INTEGER NOT NULL ,
    cod_venta TEXT ,
    coberturas_adicionales TEXT ,
    id_cargaV INTEGER NOT NULL ,
    id_cargaO INTEGER NOT NULL ,
    id_cargaN INTEGER NOT NULL ,
    CONSTRAINT Poliza_PK PRIMARY KEY (id_ts, id_poliza)
);

CREATE
  TABLE "Poliza_-_Condicion"
  (
    id_cg INTEGER NOT NULL ,
    descripion TEXT NOT NULL ,
    id_ts     VARCHAR (5) NOT NULL ,
    id_poliza INTEGER NOT NULL ,
    CONSTRAINT "Poliza_-_Condicion_PK" PRIMARY KEY (id_cg, id_ts,
    id_poliza)
);

CREATE
  TABLE Tipo_Cliente
  (
    id   SERIAL NOT NULL ,
    tipo VARCHAR (25) NOT NULL ,
    CONSTRAINT Tipo_Cliente_PK PRIMARY KEY (id)
);

CREATE
  TABLE Tipo_Empleado
  (
    id_te SERIAL NOT NULL ,
    tipo TEXT ,
    CONSTRAINT Tipo_Empleado_PK PRIMARY KEY (id_te)
);

CREATE
  TABLE Tipo_de_cambio
  (
    fecha DATE NOT NULL ,
    cambio BIGINT ,
    id_moneda INTEGER NOT NULL ,
    CONSTRAINT Tipo_de_cambio_PK PRIMARY KEY (fecha, id_moneda)
);

CREATE
  TABLE Tipo_de_seguro
  (
    id_ts VARCHAR (5) NOT NULL ,
    tipo TEXT NOT NULL ,
    CONSTRAINT Tipo_de_seguro_PK PRIMARY KEY (id_ts)
);

ALTER TABLE Archivos
ADD CONSTRAINT Archivos_Poliza_FK FOREIGN KEY
(
id_ts,
id_poliza
)
REFERENCES Poliza
(
id_ts ,
id_poliza
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
;

ALTER TABLE Beneficiario
ADD CONSTRAINT Beneficiario_Poliza_FK FOREIGN KEY
(
id_ts,
id_poliza
)
REFERENCES Poliza
(
id_ts ,
id_poliza
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
;

ALTER TABLE Bien
ADD CONSTRAINT Bien_Poliza_FK FOREIGN KEY
(
id_ts,
id_poliza
)
REFERENCES Poliza
(
id_ts ,
id_poliza
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
;

ALTER TABLE Cliente
ADD CONSTRAINT Cliente_Pais_FK FOREIGN KEY
(
id_pais
)
REFERENCES Pais
(
id_pais
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
;

ALTER TABLE Cliente
ADD CONSTRAINT Cliente_Tipo_Cliente_FK FOREIGN KEY
(
id1
)
REFERENCES Tipo_Cliente
(
id
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
;

ALTER TABLE Cobertura
ADD CONSTRAINT Cobertura_Poliza_FK FOREIGN KEY
(
id_ts,
id_poliza
)
REFERENCES Poliza
(
id_ts ,
id_poliza
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
;

ALTER TABLE Condiciones
ADD CONSTRAINT Condiciones_Tipo_de_seguro_FK FOREIGN KEY
(
id_ts
)
REFERENCES Tipo_de_seguro
(
id_ts
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
;

ALTER TABLE Detalle_Pago
ADD CONSTRAINT Detalle_Pago_Plan_de_Pagos_FK FOREIGN KEY
(
id_plan
)
REFERENCES Plan_de_Pagos
(
id_plan
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
;

ALTER TABLE Empleado
ADD CONSTRAINT Empleado_Oficina_FK FOREIGN KEY
(
id_oficina,
id_dep
)
REFERENCES Oficina
(
id_oficina ,
id_dep
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
;

ALTER TABLE Empleado
ADD CONSTRAINT Empleado_Tipo_Empleado_FK FOREIGN KEY
(
id_te
)
REFERENCES Tipo_Empleado
(
id_te
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
;

ALTER TABLE Fotografia
ADD CONSTRAINT Fotografia_Bien_FK FOREIGN KEY
(
id_bien
)
REFERENCES Bien
(
id_bien
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
;

ALTER TABLE Inspeccion
ADD CONSTRAINT Inspeccion_Bien_FK FOREIGN KEY
(
id_bien
)
REFERENCES Bien
(
id_bien
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
;

ALTER TABLE Inspeccion
ADD CONSTRAINT Inspeccion_Empleado_FK FOREIGN KEY
(
id_emp,
id_carga
)
REFERENCES Empleado
(
id_emp ,
id_carga
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
;

ALTER TABLE Inspeccion
ADD CONSTRAINT Inspeccion_Poliza_FK FOREIGN KEY
(
id_ts,
id_poliza
)
REFERENCES Poliza
(
id_ts ,
id_poliza
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
;

ALTER TABLE Oficina
ADD CONSTRAINT Oficina_Departamento_FK FOREIGN KEY
(
id_dep
)
REFERENCES Departamento
(
id_dep
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
;

ALTER TABLE Plan_de_Pagos
ADD CONSTRAINT Plan_de_Pagos_Moneda_FK FOREIGN KEY
(
id_moneda
)
REFERENCES Moneda
(
id_moneda
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
;

ALTER TABLE Plan_de_Pagos
ADD CONSTRAINT Plan_de_Pagos_Poliza_FK FOREIGN KEY
(
id_ts,
id_poliza
)
REFERENCES Poliza
(
id_ts ,
id_poliza
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
;

ALTER TABLE "Poliza_-_Condicion"
ADD CONSTRAINT "Poliza_-_Condicion_Condiciones_Generales_FK" FOREIGN KEY
(
id_cg
)
REFERENCES Condiciones_Generales
(
id_cg
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
;

ALTER TABLE "Poliza_-_Condicion"
ADD CONSTRAINT "Poliza_-_Condicion_Poliza_FK" FOREIGN KEY
(
id_ts,
id_poliza
)
REFERENCES Poliza
(
id_ts ,
id_poliza
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
;

ALTER TABLE Poliza
ADD CONSTRAINT Poliza_Cliente_FK FOREIGN KEY
(
id
)
REFERENCES Cliente
(
id
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
;

ALTER TABLE Poliza
ADD CONSTRAINT Poliza_Condiciones_Particulares_FK FOREIGN KEY
(
id_cp
)
REFERENCES Condiciones_Particulares
(
id_cp
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
;

ALTER TABLE Poliza
ADD CONSTRAINT Poliza_Empleado_FK FOREIGN KEY
(
id_negociador,
id_cargaV
)
REFERENCES Empleado
(
id_emp ,
id_carga
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
;

ALTER TABLE Poliza
ADD CONSTRAINT Poliza_Empleado_FKv1 FOREIGN KEY
(
id_operador,
id_cargaO
)
REFERENCES Empleado
(
id_emp ,
id_carga
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
;

ALTER TABLE Poliza
ADD CONSTRAINT Poliza_Empleado_FKv2 FOREIGN KEY
(
id_vendedor,
id_cargaN
)
REFERENCES Empleado
(
id_emp ,
id_carga
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
;

ALTER TABLE Poliza
ADD CONSTRAINT Poliza_Estado_Poliza_FK FOREIGN KEY
(
id_estado
)
REFERENCES Estado_Poliza
(
id_estado
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
;

ALTER TABLE Poliza
ADD CONSTRAINT Poliza_Tipo_de_seguro_FK FOREIGN KEY
(
id_ts
)
REFERENCES Tipo_de_seguro
(
id_ts
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
;

ALTER TABLE Tipo_de_cambio
ADD CONSTRAINT Tipo_de_cambio_Moneda_FK FOREIGN KEY
(
id_moneda
)
REFERENCES Moneda
(
id_moneda
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
;

ALTER SEQUENCE empleado_id_carga_seq RESTART WITH 10000 INCREMENT BY 1;
-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            24
-- CREATE INDEX                             1
-- ALTER TABLE                             27
-- CREATE VIEW                              0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE DATABASE                          0
-- CREATE DEFAULT                           0
-- CREATE INDEX ON VIEW                     0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE ROLE                              0
-- CREATE RULE                              0
-- CREATE PARTITION FUNCTION                0
-- CREATE PARTITION SCHEME                  0
-- 
-- DROP DATABASE                            0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
