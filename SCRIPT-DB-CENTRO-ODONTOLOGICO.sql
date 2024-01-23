USE CENTRO_ODONTOLOGICO

CREATE TABLE PAISES
(id_pais int ,
descripcion varchar (100),
CONSTRAINT PK_paises PRIMARY KEY (id_pais)
)

CREATE TABLE PROVINCIAS 
(id_provincia int ,
descripcion varchar (100),
id_pais int ,
CONSTRAINT PK_provincias PRIMARY KEY (id_provincia),
CONSTRAINT FK_provincias_paises FOREIGN KEY (id_pais)
REFERENCES paises (id_pais) 
)

CREATE TABLE LOCALIDADES 
(id_localidad int  ,
descripcion varchar (100),
id_provincia int,
CONSTRAINT PK_localidades PRIMARY KEY (id_localidad),
CONSTRAINT FK_localidades_provincias FOREIGN KEY (id_provincia)
REFERENCES provincias (id_provincia) 
)

CREATE TABLE BARRIOS 
(id_barrio int,
descripcion varchar (100),
id_localidad int ,
CONSTRAINT PK_barrios PRIMARY KEY (id_barrio),
CONSTRAINT FK_barrios_localidades FOREIGN KEY (id_localidad)
REFERENCES localidades (id_localidad) 
)


CREATE TABLE TIPOS_DOCUMENTOS
(id_tipo_doc int,
descripcion varchar (70),
CONSTRAINT PK_tipos_documentos PRIMARY KEY (id_tipo_doc)
)
CREATE TABLE OBRAS_SOCIALES
(id_obra_social int,
nombre varchar (70),
CONSTRAINT PK_obras_sociales PRIMARY KEY (id_obra_social)
)

CREATE TABLE TIPOS_MOVIMIENTOS
(id_tipo_movimiento int,
descripcion varchar (50),
CONSTRAINT PK_tipos_movimientos PRIMARY KEY (id_tipo_movimiento)
)

CREATE TABLE PROCEDIMIENTOS_ODONTOLOGICOS
(id_proc_odontologico int,
nombre varchar (100),
precio int,
CONSTRAINT PK_procedimientos_odontologicos PRIMARY KEY (id_proc_odontologico)
) 


CREATE TABLE FORMAS_DE_PAGOS
(id_forma_pago int,
descripcion varchar  (100),
recargo int,
CONSTRAINT  PK_formas_pagos PRIMARY KEY (id_forma_pago)
)

CREATE TABLE TIPOS_CONTACTOS
(id_tipo_contacto int,
tipo_contacto varchar (100),
CONSTRAINT PK_tipos_contactos PRIMARY KEY (id_tipo_contacto)
)

CREATE TABLE ESPECIALIDADES
(id_especialidad int,
descripcion varchar (100),
CONSTRAINT PK_especialidades PRIMARY KEY (id_especialidad)
)

CREATE TABLE MARCAS
(id_marca int,
marca varchar (100),
CONSTRAINT PK_marcas PRIMARY KEY (id_marca)
)

CREATE TABLE TIPOS_REPARACIONES
(id_tipo_reparacion  int,
descripcion varchar (150),
CONSTRAINT PK_tipos_reparaciones PRIMARY KEY (id_tipo_reparacion)
)

CREATE TABLE PACIENTES
(id_paciente int,
nombre varchar (50),
apellido varchar (50),
nro_telefono int,
fecha_nacimiento date,
nro_documento int,
email varchar (100),  
calle varchar (50),
altura int,
id_tipo_doc int,
id_barrio int,
id_obra_social int,
CONSTRAINT PK_pacientes PRIMARY KEY (id_paciente),
CONSTRAINT FK_pacientes_tipos_documentos FOREIGN KEY (id_tipo_doc)
REFERENCES tipos_documentos (id_tipo_doc),
CONSTRAINT FK_pacientes_barrios  FOREIGN KEY (id_barrio)
REFERENCES barrios (id_barrio),
CONSTRAINT FK_pacientes_obras_sociales FOREIGN KEY (id_obra_social)
REFERENCES obras_sociales (id_obra_social)
)

CREATE TABLE DENTISTAS
(nro_dentista int,
nombre varchar (50),
apellido  varchar (50),
id_tipo_doc int,
nro_documento int,
nro_telefono int,
id_especialidad int,
nro_matricula varchar (30),
email varchar (100),
CONSTRAINT PK_dentistas PRIMARY KEY (nro_dentista),
CONSTRAINT FK_dentistas_tipos_documentos FOREIGN KEY (id_tipo_doc)
REFERENCES  tipos_documentos (id_tipo_doc),
CONSTRAINT FK_dentistas_especialidades FOREIGN KEY(id_especialidad)
REFERENCES especialidades (id_especialidad)
)

CREATE TABLE CLINICAS
(id_clinica int,
nombre varchar (100),
altura int,
calle varchar (100),
hora_apertura  time,
hora_cierre time,
id_barrio int,
CONSTRAINT PK_clinicas PRIMARY KEY (id_clinica),
CONSTRAINT FK_clinicas_barrios FOREIGN KEY (id_barrio)
REFERENCES barrios (id_barrio)
) 

CREATE TABLE FACTURAS
(nro_factura int,
fecha date,
id_clinica int,
id_paciente int,
nro_dentista int,
CONSTRAINT PK_facturas PRIMARY KEY (nro_factura),
CONSTRAINT FK_facturas_clinicas FOREIGN KEY (id_clinica)
REFERENCES clinicas (id_clinica),
CONSTRAINT FK_facturas_pacientes FOREIGN KEY (id_paciente)
REFERENCES pacientes (id_paciente),
CONSTRAINT FK_facturas_dentistas FOREIGN KEY (nro_dentista)
REFERENCES dentistas (nro_dentista)
)

CREATE TABLE DETALLE_FACTURAS
(id_detalle_factura int,
nro_factura int,
id_proc_odontologico int,
precio int,
CONSTRAINT PK_detalles_facturas PRIMARY KEY (id_detalle_factura),
CONSTRAINT FK_detalles_facturas_facturas FOREIGN KEY (nro_factura)
REFERENCES facturas (nro_factura),
CONSTRAINT FK_detalles_facturas_procedimientos_odontologicos FOREIGN KEY (id_proc_odontologico)
REFERENCES procedimientos_odontologicos (id_proc_odontologico)
)

CREATE TABLE FACTURAS_FORMAS_PAGOS
(id_factura_forma_pago int,
nro_factura int,
id_forma_pago int,
monto int,
CONSTRAINT PK_facturas_formas_pagos PRIMARY KEY (id_factura_forma_pago),
CONSTRAINT FK_facturas_formas_pagos_facturas FOREIGN KEY (nro_factura)
REFERENCES facturas (nro_factura),
CONSTRAINT FK_facturas_formas_pagos_formas_de_pagos FOREIGN KEY (id_forma_pago)
REFERENCES formas_de_pagos (id_forma_pago)
)

CREATE TABLE CONSULTORIOS
(id_consultorio int,
descripcion varchar (100),
id_clinica int,
CONSTRAINT PK_consultorios PRIMARY KEY (id_consultorio),
CONSTRAINT FK_consultorios_clinicas FOREIGN KEY (id_clinica)
REFERENCES clinicas (id_clinica)
)

CREATE TABLE CONTACTOS	
(id_contacto int,
contacto varchar (150),
id_tipo_contacto int,
id_clinica int,
CONSTRAINT PK_contactos PRIMARY KEY (id_contacto),
CONSTRAINT FK_contactos_tipos_contactos FOREIGN KEY (id_tipo_contacto)
REFERENCES tipos_contactos (id_tipo_contacto),
CONSTRAINT FK_contactos_clinicas FOREIGN KEY (id_clinica)
REFERENCES clinicas (id_clinica)
)

CREATE TABLE OBRAS_SOCIALES_PROCEDIMIENTOS
(id_obra_social_procedimiento int,
id_proc_odontologico int,
id_obra_social int,
porc_cobertura int,
CONSTRAINT PK_obras_sociales_procedimientos PRIMARY KEY (id_obra_social_procedimiento),
CONSTRAINT FK_obras_sociales_procedimientos_procedimientos_odontologicos FOREIGN KEY (id_proc_odontologico)
REFERENCES procedimientos_odontologicos (id_proc_odontologico),
CONSTRAINT FK_obras_sociales_procedimientos_obras_sociales FOREIGN KEY (id_obra_social)
REFERENCES obras_sociales (id_obra_social)
)

CREATE TABLE PACIENTES_PROCEDIMIENTOS_ODONTOLOGICOS
(id_paciente_proc_odontologico int,		
id_paciente int,
id_proc_odontologico int,
fecha date,
costo int,
CONSTRAINT PK_pacientes_procedimientos_odontologicos PRIMARY KEY (id_paciente_proc_odontologico),
CONSTRAINT FK_pacientes_procedimientos_odontologicos_pacientes FOREIGN KEY (id_paciente)
REFERENCES pacientes (id_paciente),
CONSTRAINT FK_pacientes_procedimientos_odontologicos_proce_odontologicos FOREIGN KEY (id_proc_odontologico)
REFERENCES procedimientos_odontologicos (id_proc_odontologico)
)

CREATE TABLE INSTRUMENTOS
(id_instrumento int,
nombre varchar (100),
id_marca int,
id_pais int,
nro_serie varchar (150),
fecha_adquisicion date,
fecha_ult_revision date,
fecha_proxima_revision date,
CONSTRAINT PK_instrumentos PRIMARY KEY (id_instrumento),
CONSTRAINT FK_instrumentos_marcas FOREIGN KEY (id_marca) 
REFERENCES marcas (id_marca),
CONSTRAINT FK_instrumentos_paises FOREIGN KEY (id_pais) 
REFERENCES paises (id_pais)
)


CREATE TABLE INSTRUMENTOS_CONSULTORIOS
(id_instrumento_consultorio int,
id_instrumento int,
nro_dentista int,
id_consultorio int,
CONSTRAINT PK_instrumentos_consultorios PRIMARY KEY (id_instrumento_consultorio),
CONSTRAINT FK_instrumentos_consultorios_instrumentos   FOREIGN KEY (id_instrumento)
REFERENCES instrumentos (id_instrumento),
CONSTRAINT FK_instrumentos_consultorios_dentistas FOREIGN KEY (nro_dentista)
REFERENCES dentistas (nro_dentista),
CONSTRAINT FK_instrumentos_consultorios_consultorios FOREIGN KEY (id_consultorio)
REFERENCES consultorios (id_consultorio)
)

CREATE TABLE MATERIALES
(id_material int,
nombre varchar (100),
id_marca int,
id_pais int,
fecha_vencimiento date,
cantidad int,
CONSTRAINT PK_materiales PRIMARY KEY (id_material),
CONSTRAINT FK_materiales_marcas FOREIGN KEY (id_marca)
REFERENCES marcas (id_marca),
CONSTRAINT FK_materiales_paises FOREIGN KEY (id_pais)
REFERENCES paises (id_pais)
)
CREATE TABLE INVENTARIOS
(id_inventario int,
id_instrumento int,
id_material int,
id_tipo_movimiento int,
fecha date,
cantidad int,
CONSTRAINT PK_inventarios PRIMARY KEY (id_inventario),
CONSTRAINT Fk_inventarios_instrumentos FOREIGN KEY (id_instrumento)
REFERENCES instrumentos (id_instrumento),
CONSTRAINT Fk_inventarios_materiales FOREIGN KEY (id_material)
REFERENCES materiales (id_material),
CONSTRAINT FK_inventarios_tipos_movimientos FOREIGN KEY (id_tipo_movimiento)
REFERENCES tipos_movimientos (id_tipo_movimiento)
)	

CREATE TABLE PROCEDIMIENTOS_X_INSTRUMENTOS
(id_proc_instrumento int,
id_proc_odontologico int,
id_material int,
id_instrumento int,
cantidad int,
CONSTRAINT PK_procedimientos_x_instrumentos PRIMARY KEY (id_proc_instrumento),
CONSTRAINT FK_procedimientos_x_instrumentos_procedimientos_odontologicos FOREIGN KEY (id_proc_odontologico)
REFERENCES procedimientos_odontologicos (id_proc_odontologico),
CONSTRAINT FK_procedimientos_x_instrumentos_materiales  FOREIGN KEY (id_material)
REFERENCES materiales (id_material),
CONSTRAINT FK_procedimientos_x_instrumentos_instrumentos FOREIGN KEY (id_instrumento)
REFERENCES  instrumentos (id_instrumento)
)

CREATE TABLE REPARACIONES
(id_reparacion int,
id_instrumento int,
id_tipo_reparacion int,
costo int,
CONSTRAINT PK_reparaciones PRIMARY KEY (id_reparacion),
CONSTRAINT FK_reparaciones_instrumentos FOREIGN KEY (id_instrumento)
REFERENCES instrumentos (id_instrumento),
CONSTRAINT FK_reparaciones_tipos_reparaciones FOREIGN KEY (id_tipo_reparacion)
REFERENCES tipos_reparaciones (id_tipo_reparacion)
)















