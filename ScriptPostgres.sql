-- Generated by Oracle SQL Developer Data Modeler 4.0.2.840
--   at:        2015-04-22 12:19:32 CST
--   site:      SQL Server 2008
--   type:      SQL Server 2008




CREATE
  TABLE Archivos
  (
    id_archivo                  SERIAL NOT NULL ,
    archivo                     BYTEA NOT NULL ,
    Poliza_Tipo_de_seguro_id_ts VARCHAR (5) NOT NULL ,
    Poliza_id_poliza            INTEGER NOT NULL ,
    CONSTRAINT Archivos_PK PRIMARY KEY  (id_archivo)
)
  
;

CREATE
  TABLE Beneficiario
  (
    id_beneficiario SERIAL NOT NULL ,
    nombre TEXT NOT NULL ,
    telefono TEXT NOT NULL ,
    Poliza_Tipo_de_seguro_id_ts VARCHAR (5) NOT NULL ,
    Poliza_id_poliza            INTEGER NOT NULL ,
    CONSTRAINT Beneficiario_PK PRIMARY KEY  (id_beneficiario)
);

CREATE
  TABLE Bien
  (
    id_bien SERIAL NOT NULL ,
    nombre TEXT NOT NULL ,
    monto BIGINT ,
    Poliza_Tipo_de_seguro_id_ts VARCHAR (5) NOT NULL ,
    Poliza_id_poliza            INTEGER NOT NULL ,
    CONSTRAINT Bien_PK PRIMARY KEY  (id_bien)
);

CREATE
  TABLE Cliente
  (
    id              SERIAL NOT NULL ,
    nombre          VARCHAR (50) NOT NULL ,
    domicilio       VARCHAR (75) NOT NULL ,
    Tipo_Cliente_id INTEGER NOT NULL ,
    Pais_id_pais    INTEGER NOT NULL ,
    CONSTRAINT Cliente_PK PRIMARY KEY  (id)
);

CREATE
  TABLE Cobertura
  (
    id_cobertura SERIAL NOT NULL ,
    descripcion TEXT ,
    monto                       DECIMAL (28) NOT NULL ,
    Poliza_Tipo_de_seguro_id_ts VARCHAR (5) NOT NULL ,
    Poliza_id_poliza            INTEGER NOT NULL ,
    CONSTRAINT Cobertura_PK PRIMARY KEY  (id_cobertura)
);

CREATE
  TABLE Condiciones
  (
    id_cond SERIAL NOT NULL ,
    condicion TEXT NOT NULL ,
    Tipo_de_seguro_id_ts VARCHAR (5) NOT NULL ,
    CONSTRAINT Condiciones_PK PRIMARY KEY  (id_cond)
);

CREATE
  TABLE Condiciones_Generales
  (
    id_cg SERIAL NOT NULL ,
    condicion TEXT NOT NULL ,
    CONSTRAINT Condiciones_Generales_PK PRIMARY KEY  (id_cg)
);

CREATE
  TABLE Condiciones_Particulares
  (
    id_cp SERIAL NOT NULL ,
    condicion TEXT NOT NULL ,
    CONSTRAINT Condiciones_Particulares_PK PRIMARY KEY  (id_cp)
);

CREATE
  TABLE Departamento
  (
    id_dep SERIAL NOT NULL ,
    nombre VARCHAR (50) NOT NULL ,
    CONSTRAINT Departamento_PK PRIMARY KEY  (id_dep)
);

CREATE
  TABLE Detalle_Pago
  (
    id_detalle            SERIAL NOT NULL ,
    fecha                 DATE NOT NULL ,
    numero_cuota          INTEGER NOT NULL ,
    Plan_de_Pagos_id_plan INTEGER NOT NULL ,
    CONSTRAINT Detalle_Pago_PK PRIMARY KEY  (id_detalle)
);

CREATE
  TABLE Empleado
  (
    id_emp SERIAL UNIQUE NOT NULL ,
    nombre TEXT ,
    telefono TEXT ,
    Tipo_Empleado_id_te INTEGER NOT NULL ,
    Oficina_id_oficina UNIQUE  VARCHAR (5) NOT NULL ,
	Oficina_Departamento_id_dep INTEGER NOT NULL ,
    CONSTRAINT Empleado_PK PRIMARY KEY  (id_emp, Oficina_id_oficina)
);

CREATE
  TABLE Estado_Poliza
  (
    id_estado SERIAL NOT NULL ,
    estado    VARCHAR (25) NOT NULL ,
    CONSTRAINT Estado_Poliza_PK PRIMARY KEY  (id_estado)
);

CREATE
  TABLE Fotografia
  (
    id_foto SERIAL NOT NULL ,
    nombre TEXT NOT NULL ,
    Bien_id_bien INTEGER NOT NULL ,
    CONSTRAINT Fotografia_PK PRIMARY KEY  (id_foto)
);

CREATE
  TABLE Inspeccion
  (
    id_inspeccion               SERIAL NOT NULL ,
    Empleado_id_emp             INTEGER NOT NULL ,
    fecha                       DATE NOT NULL ,
    Bien_id_bien                INTEGER NOT NULL ,
    aprobado                    VARCHAR (2) ,
    Poliza_Tipo_de_seguro_id_ts VARCHAR (5) NOT NULL ,
    Poliza_id_poliza            INTEGER NOT NULL ,
    CONSTRAINT Inspeccion_PK PRIMARY KEY  (id_inspeccion)
);

CREATE
  TABLE Moneda
  (
    id_moneda SERIAL NOT NULL ,
    moneda TEXT ,
    CONSTRAINT Moneda_PK PRIMARY KEY  (id_moneda)
);

CREATE
  TABLE Oficina
  (
    id_oficina          VARCHAR (5) NOT NULL ,
    nombre              VARCHAR (50) ,
    Departamento_id_dep INTEGER NOT NULL ,
    CONSTRAINT Oficina_PK PRIMARY KEY  (id_oficina, Departamento_id_dep)
);

CREATE
  TABLE Pais
  (
    id_pais SERIAL NOT NULL ,
    pais TEXT NOT NULL ,
    CONSTRAINT Pais_PK PRIMARY KEY  (id_pais)
);

CREATE
  TABLE Plan_de_Pagos
  (
    id_plan SERIAL NOT NULL ,
    prima BIGINT NOT NULL ,
    numero_cuotas INTEGER NOT NULL ,
    recargo BIGINT NOT NULL ,
    pago_cuota BIGINT NOT NULL ,
    Moneda_id_moneda            INTEGER NOT NULL ,
    numero_cuotas_atrasadas     INTEGER NOT NULL ,
    Poliza_Tipo_de_seguro_id_ts VARCHAR (5) NOT NULL ,
    Poliza_id_poliza            INTEGER NOT NULL ,
    CONSTRAINT Plan_de_Pagos_PK PRIMARY KEY  (id_plan)
);
CREATE UNIQUE INDEX
Plan_de_Pagos__IDX ON Plan_de_Pagos
(
  Poliza_Tipo_de_seguro_id_ts ,
  Poliza_id_poliza
);

CREATE
  TABLE Poliza
  (
    id_poliza                      SERIAL NOT NULL ,
    Estado_Poliza_id_estado        INTEGER NOT NULL ,
    Condiciones_Particulares_id_cp INTEGER NOT NULL ,
    fecha_inicio                   DATE NOT NULL ,
    fecha_fin                      DATE NOT NULL ,
    clausulas TEXT NOT NULL ,
    Cliente_id           INTEGER NOT NULL ,
    Tipo_de_seguro_id_ts VARCHAR (5) NOT NULL ,
    Empleado_id_emp      INTEGER NOT NULL ,
    poliza_vieja         VARCHAR NOT NULL ,
    meses                INTEGER NOT NULL ,
    producto_descripcion TEXT ,
    Empleado_id_emp3 INTEGER NOT NULL ,
    Empleado_id_emp1 INTEGER NOT NULL ,
    status           VARCHAR (15) NOT NULL ,
    CONSTRAINT Poliza_PK PRIMARY KEY  (Tipo_de_seguro_id_ts, id_poliza
    )
);

CREATE
  TABLE "Poliza_-_Condicion"
  (
    Condiciones_Generales_id_cg INTEGER NOT NULL ,
    descripion TEXT NOT NULL ,
    Poliza_Tipo_de_seguro_id_ts VARCHAR (5) NOT NULL ,
    Poliza_id_poliza            INTEGER NOT NULL ,
    CONSTRAINT "Poliza_-_Condicion_PK" PRIMARY KEY  (
    Condiciones_Generales_id_cg, Poliza_Tipo_de_seguro_id_ts, Poliza_id_poliza)
);

CREATE
  TABLE Tipo_Cliente
  (
    id   SERIAL NOT NULL ,
    tipo VARCHAR (25) NOT NULL ,
    CONSTRAINT Tipo_Cliente_PK PRIMARY KEY  (id)
);

CREATE
  TABLE Tipo_Empleado
  (
    id_te SERIAL NOT NULL ,
    tipo TEXT ,
    CONSTRAINT Tipo_Empleado_PK PRIMARY KEY  (id_te)
);

CREATE
  TABLE Tipo_de_cambio
  (
    fecha DATE NOT NULL ,
    cambio BIGINT ,
    Moneda_id_moneda INTEGER NOT NULL ,
    CONSTRAINT Tipo_de_cambio_PK PRIMARY KEY  (fecha, Moneda_id_moneda
    )
);

CREATE
  TABLE Tipo_de_seguro
  (
    id_ts VARCHAR (5) NOT NULL ,
    tipo TEXT NOT NULL ,
    CONSTRAINT Tipo_de_seguro_PK PRIMARY KEY  (id_ts)
);

ALTER TABLE Archivos
ADD CONSTRAINT Archivos_Poliza_FK FOREIGN KEY
(
Poliza_Tipo_de_seguro_id_ts,
Poliza_id_poliza
)
REFERENCES Poliza
(
Tipo_de_seguro_id_ts ,
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
Poliza_Tipo_de_seguro_id_ts,
Poliza_id_poliza
)
REFERENCES Poliza
(
Tipo_de_seguro_id_ts ,
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
Poliza_Tipo_de_seguro_id_ts,
Poliza_id_poliza
)
REFERENCES Poliza
(
Tipo_de_seguro_id_ts ,
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
Pais_id_pais
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
Tipo_Cliente_id
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
Poliza_Tipo_de_seguro_id_ts,
Poliza_id_poliza
)
REFERENCES Poliza
(
Tipo_de_seguro_id_ts ,
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
Tipo_de_seguro_id_ts
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
Plan_de_Pagos_id_plan
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
Oficina_id_oficina,
Oficina_Departamento_id_dep
)
REFERENCES Oficina
(
id_oficina,
Departamento_id_dep
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
;

ALTER TABLE Empleado
ADD CONSTRAINT Empleado_Tipo_Empleado_FK FOREIGN KEY
(
Tipo_Empleado_id_te
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
Bien_id_bien
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
Bien_id_bien
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
Empleado_id_emp
)
REFERENCES Empleado
(
id_emp
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
;

ALTER TABLE Inspeccion
ADD CONSTRAINT Inspeccion_Poliza_FK FOREIGN KEY
(
Poliza_Tipo_de_seguro_id_ts,
Poliza_id_poliza
)
REFERENCES Poliza
(
Tipo_de_seguro_id_ts ,
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
Departamento_id_dep
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
Moneda_id_moneda
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
Poliza_Tipo_de_seguro_id_ts,
Poliza_id_poliza
)
REFERENCES Poliza
(
Tipo_de_seguro_id_ts ,
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
Condiciones_Generales_id_cg
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
Poliza_Tipo_de_seguro_id_ts,
Poliza_id_poliza
)
REFERENCES Poliza
(
Tipo_de_seguro_id_ts ,
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
Cliente_id
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
Condiciones_Particulares_id_cp
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
Empleado_id_emp
)
REFERENCES Empleado
(
id_emp
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
;

ALTER TABLE Poliza
ADD CONSTRAINT Poliza_Empleado_FKv1 FOREIGN KEY
(
Empleado_id_emp1
)
REFERENCES Empleado
(
id_emp
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
;

ALTER TABLE Poliza
ADD CONSTRAINT Poliza_Empleado_FKv3 FOREIGN KEY
(
Empleado_id_emp3
)
REFERENCES Empleado
(
id_emp
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
;

ALTER TABLE Poliza
ADD CONSTRAINT Poliza_Estado_Poliza_FK FOREIGN KEY
(
Estado_Poliza_id_estado
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
Tipo_de_seguro_id_ts
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
Moneda_id_moneda
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

ALTER SEQUENCE empleado_id_emp_seq RESTART WITH 10000 INCREMENT BY 1;

-- Oracle SQL Developer Data Modeler Summary Report: 
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
